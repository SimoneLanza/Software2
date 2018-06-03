package Datos;

import Componentes.Fecha;
import Componentes.Operacion;
import Componentes.generarCodigos;
import Modelo.DetalleFactura;
import Modelo.Factura;
import java.util.List;

public class GestionarFactura {

    public static String getCodigo() {
        String cod = generarCodigos.getCodigo("SELECT MAX(fac_codigo) from factura");
        return cod;
    }

    public static String addFactura(Factura f) {
        String msg;
        msg = Operacion.exeOperacion("INSERT INTO factura VALUES (" + f.getCodFactura() + "," + f.getCodCliente() + "," + f.getCodVendedor() + "," + f.getDescuento() + ",'" + f.getTipoPago() + "','" + f.getFecha() + "','" + Fecha.darHora() + "','" + f.getNeto() + "' ," + f.getTotal() + ",'S')");
        return msg;
    }

    public static String actFactura(String cod) {
        String msg;
        msg = Operacion.exeOperacion("UPDATE factura SET fac_indicador='N' WHERE fac_codigo=" + cod + "");
        return msg;
    }

    public static String addDetalleFactura(DetalleFactura df) {
        String msg;
        msg = Operacion.exeOperacion("INSERT INTO detalle_factura VALUES (" + df.getCodFactura() + "," + df.getCodArticulo() + "," + df.getCantidad() + "," + df.getPrecio() + "," + df.getTotal() + ")");
        return msg;
    }

    public static Factura busFactura(String cod) {
        Factura fac = null;
        String sql = "SELECT * FROM factura WHERE fac_codigo=" + cod + "";
        Object[] filaObt = Operacion.getFila(sql);
        if (filaObt != null) {
            fac = new Factura();
            fac.setCodFactura(Integer.parseInt(filaObt[0].toString()));
            fac.setCodCliente(Integer.parseInt(filaObt[1].toString()));
            fac.setCodVendedor(Integer.parseInt(filaObt[2].toString()));
            fac.setDescuento(Double.parseDouble(filaObt[3].toString()));
            fac.setTipoPago(filaObt[4].toString());
            fac.setFecha(filaObt[5].toString());
            fac.setHora(filaObt[6].toString());
            fac.setTotal(Double.parseDouble(filaObt[7].toString()));
        } else {
            System.out.println("No encontrado");
        }
        return fac;
    }

    public static List listFacturas() {
        String sql = "SELECT factura.fac_codigo,"
                + "    clientes.cli_razonsocial,"
                + "    factura.fac_fecha,"
                + "    clientes.cli_codigo,"
                + "    factura.fac_descuento,"
                + "    factura.fac_total,"
                + "    vendedor.ven_codigo"
                + "   FROM ((factura"
                + "   JOIN vendedor ON ((factura.fac_vendedor = vendedor.ven_codigo)))"
                + "   JOIN clientes ON ((factura.fac_cliente = clientes.cli_codigo)))"
                + "  WHERE ((factura.fac_indicador) = 'S')";
        return Operacion.getTabla(sql);
    }

    public static List lisFacturas2() {
        String sql = "SELECT factura.fac_codigo,"
                + "    clientes.cli_razonsocial,"
                + "    factura.fac_fecha,"
                + "    clientes.cli_codigo,"
                + "    factura.fac_descuento,"
                + "    factura.fac_total,"
                + "    vendedor.ven_codigo"
                + "   FROM ((factura"
                + "   JOIN vendedor ON ((factura.fac_vendedor = vendedor.ven_codigo)))"
                + "   JOIN clientes ON ((factura.fac_cliente = clientes.cli_codigo)))"
                + "  WHERE (((factura.fac_indicador) = 'S') AND (NOT (EXISTS ( SELECT factura.fac_codigo"
                + "   FROM notacredito"
                + "  WHERE (factura.fac_codigo = notacredito.nc_factura)))))";
        return Operacion.getTabla(sql);
    }

//    public static List listFacturasAnuladas() {
//        String sql = "SELECT factura.fac_codigo, clientes.cli_razonSocial, factura.fac_fecha, clientes.cli_codigo, factura.fac_descuento,factura.fac_total, vendedor.ven_codigo FROM factura, clientes, vendedor where factura.fac_cliente = clientes.cli_codigo AND factura.fac_vendedor = vendedor.ven_codigo AND factura.fac_indicador='N'";
//        return Operacion.getTabla(sql);
//    }
    public static List fillCliente(String nom) {
        String sql = "SELECT factura.fac_codigo,"
                + "    clientes.cli_razonsocial,"
                + "    factura.fac_fecha,"
                + "    clientes.cli_codigo,"
                + "    factura.fac_descuento,"
                + "    factura.fac_total,"
                + "    vendedor.ven_codigo"
                + "   FROM ((factura"
                + "   JOIN vendedor ON ((factura.fac_vendedor = vendedor.ven_codigo)))"
                + "   JOIN clientes ON ((factura.fac_cliente = clientes.cli_codigo)))"
                + "   WHERE "
                + "(((factura.fac_indicador) = 'S') AND "
                + "(NOT (EXISTS ( SELECT factura.fac_codigo"
                + "   FROM notacredito"
                + "  WHERE (factura.fac_codigo = notacredito.nc_factura)))) AND clientes.cli_razonsocial ILIKE '" + nom + "%')";
        return Operacion.getTabla(sql);
    }

    public static List listDetalles(String cod) {
        String sql = "SELECT detalle_factura.df_cantidad,"
                + "    detalle_factura.df_articulo,"
                + "    articulo.art_descripcion,"
                + "    unidad.uni_nombre,"
                + "    detalle_factura.df_precarticulo,"
                + "    detalle_factura.df_total"
                + "   FROM (((detalle_factura"
                + "   JOIN articulo ON ((detalle_factura.df_articulo = articulo.art_codigo)))"
                + "   JOIN unidad ON ((articulo.art_unidad = unidad.uni_codigo)))"
                + "   JOIN factura ON ((detalle_factura.df_codigo = factura.fac_codigo)))"
                + "  WHERE (factura.fac_codigo = "+cod+")";
        return Operacion.getTabla(sql);
    }

    public static List listDetallesF(String cod) {
        String sql = "SELECT detalle_factura.df_cantidad,"
                + "    detalle_factura.df_articulo,"
                + "    articulo.art_descripcion,"
                + "    detalle_factura.df_precarticulo,"
                + "    detalle_factura.df_total"
                + "   FROM ((detalle_factura"
                + "   JOIN factura ON ((detalle_factura.df_codigo = factura.fac_codigo)))"
                + "   JOIN articulo ON ((detalle_factura.df_articulo = articulo.art_codigo)))"
                + "  WHERE (factura.fac_codigo = "+cod+")";
        return Operacion.getTabla(sql);
    }

}
