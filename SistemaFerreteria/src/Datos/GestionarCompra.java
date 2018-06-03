package Datos;

import Componentes.Fecha;
import Componentes.Operacion;
import Componentes.generarCodigos;
import Modelo.Compra;
import Modelo.DetalleCompra;
import java.util.List;

public class GestionarCompra {

    public static String getCodigo() {
        String cod = generarCodigos.getCodigo("SELECT MAX(com_codigo) from compras");
        return cod;
    }

    public static String addCompra(Compra c) {
        String msg;
        msg = Operacion.exeOperacion("INSERT INTO compras VALUES (" + c.getCodCompra() + "," + c.getCodProveedor() + "," + c.getCategoria() + ",'" + c.getCondPago() + "','" + c.getFecha() + "','" + Fecha.darHora() + "'," + c.getTotal() + ",'S')");
        return msg;
    }

    public static String actCompra(Compra c) {
        String msg;
        msg = Operacion.exeOperacion("UPDATE compras SET com_codigo=" + c.getCodCompra() + ",com_proveedor=" + c.getCodProveedor() + ",com_condPago='" + c.getCondPago() + "',com_fecha='" + c.getFecha() + "',com_total=" + c.getTotal() + ",com_indicador='N' WHERE com_codigo=" + c.getCodCompra() + "");
        return msg;
    }

    public static String addDetalleCompra(DetalleCompra dc) {
        String msg;
        msg = Operacion.exeOperacion("INSERT INTO detalle_compras VALUES (" + dc.getCodArticulo() + "," + dc.getCodCompra() + "," + dc.getCant() + "," + dc.getPrecio() + "," + dc.getMonto() + ")");
        return msg;
    }

    public static String delCompra(String cod) {
        String msg;
        String sql = "UPDATE compras SET com_indicador='N' WHERE com_codigo = " + cod + "";
        msg = Operacion.exeOperacion(sql);
        return msg;
    }

    public static List listarCompras() {
        String sql = "SELECT compras.com_codigo,"
                + "    compras.com_fecha,"
                + "    proveedor.pro_razonsocial,"
                + "    proveedor.pro_codigo,"
                + "    compras.com_total"
                + "   FROM (compras"
                + "   JOIN proveedor ON ((compras.com_proveedor = proveedor.pro_codigo)))"
                + "  WHERE ((compras.com_indicador) = 'S')";
        return Operacion.getTabla(sql);
    }

    public static List listarDetalleCompras(String cod) {
        String sql = "SELECT detalle_compras.dc_cantidad,"
                + "    articulo.art_codigo,"
                + "    articulo.art_descripcion,"
                + "    detalle_compras.dc_precio,"
                + "    detalle_compras.dc_monto"
                + "   FROM ((compras"
                + "   JOIN detalle_compras ON ((detalle_compras.dc_compra = compras.com_codigo)))"
                + "   JOIN articulo ON ((detalle_compras.dc_articulo = articulo.art_codigo)))"
                + "  WHERE (compras.com_codigo = "+cod+")";
        return Operacion.getTabla(sql);
    }

}
