package Datos;

import Componentes.Fecha;
import Componentes.Operacion;
import Componentes.generarCodigos;
import Modelo.detalle_presupuesto;
import Modelo.prespuesto;
import java.util.List;

public class GestionarPresupuesto {

    public static String getCodigo() {
        String cod = generarCodigos.getCodigo("SELECT MAX(pre_codigo) FROM presupuesto");
        return cod;
    }

    public static String addPresupuesto(prespuesto p) {
        String msg;
        msg = Operacion.exeOperacion("INSERT INTO presupuesto "
                + "VALUES (" + p.getCodPresupuesto() + "," + p.getCodeVendedor() + "," + p.getCodCliente() + ","
                + "" + p.getDescuento() + ",'" + p.getTipoPago() + "','" + p.getFecha() + "','" + Fecha.darHora() + "',"
                + "" + p.getTotal() + ",'S')");
        return msg;
    }

    public static String actPresupuesto(String cod) {
        String msg;
        msg = Operacion.exeOperacion("UPDATE presupuesto SET pre_indicador='N' WHERE pre_codigo=" + cod + "");
        return msg;
    }

    public static prespuesto busPresupuesto(String cod) {
        prespuesto p = null;
        String sql = "SELECT * FROM presupuesto WHERE pre_codigo = " + cod + "";
        Object[] filaObt = Operacion.getFila(sql);
        if (filaObt != null) {
            p = new prespuesto();
            p.setCodPresupuesto(Integer.parseInt(filaObt[0].toString()));
            p.setCodeVendedor(Integer.parseInt(filaObt[1].toString()));
            p.setCodCliente(Integer.parseInt(filaObt[2].toString()));
            p.setDescuento(Double.parseDouble(filaObt[3].toString()));
            p.setTipoPago(filaObt[4].toString());
            p.setFecha(filaObt[5].toString());
            p.setHora(filaObt[6].toString());
            p.setTotal(Double.parseDouble(filaObt[7].toString()));
            p.setIndicador(filaObt[8].toString());
            System.out.println("Encontrado");
        } else {
            System.out.println("No encontrado");
        }
        return p;
    }

    public static String presAceptado(String cod) {
        String msg;
        msg = Operacion.exeOperacion("UPDATE presupuesto SET pre_indicador='A' WHERE pre_codigo=" + cod + "");
        return msg;
    }

    public static String presRechazado(String cod) {
        String msg;
        msg = Operacion.exeOperacion("UPDATE presupuesto SET pre_indicador='R' WHERE pre_codigo=" + cod + "");
        return msg;
    }

    public static String presPendiente(String cod) {
        String msg;
        msg = Operacion.exeOperacion("UPDATE presupuesto SET pre_indicador='S' WHERE pre_codigo=" + cod + "");
        return msg;
    }

    public static String addDetallePresupuesto(detalle_presupuesto dp) {
        String msg;
        msg = Operacion.exeOperacion("INSERT INTO detalle_presupuesto "
                + "VALUES (" + dp.getCodPresupuesto() + "," + dp.getCodArticulo() + "," + dp.getCantidad() + ","
                + "" + dp.getPrecio() + "," + dp.getMonto() + ")");
        return msg;
    }

    public static List listPresupuesto() {
        String sql = "SELECT presupuesto.pre_codigo,"
                + "    presupuesto.pre_fecha,"
                + "    clientes.cli_razonsocial,"
                + "    clientes.cli_codigo,"
                + "    presupuesto.pre_descuento,"
                + "    presupuesto.pre_total"
                + "   FROM (presupuesto"
                + "   JOIN clientes ON ((presupuesto.pre_cliente = clientes.cli_codigo)))";
        return Operacion.getTabla(sql);
    }

//    public static List fillNobreCliente()
//    {
//        String sql = "SELECT presupuesto.codPresupuesto, presupuesto.fecha, clientes.razonSocial, clientes.codCliente, presupuesto.descuento, presupuesto.total FROM presupuesto, clientes WHERE presupuesto.codCliente = clientes.codCliente AND not exists (SELECT * FROM presupuesto WHERE Indicador='N') AND clientes.razonSocial LIKE 'C%'";
//        return Operacion.getTabla(sql);
//    }
    public static List listDetallePresupuest(String cod) {
        String sql = "SELECT detalle_presupuesto.dp_cantidad,"
                + "    articulo.art_codigo,"
                + "    articulo.art_descripcion,"
                + "    detalle_presupuesto.dp_precarticulo,"
                + "    detalle_presupuesto.dp_total"
                + "   FROM ((detalle_presupuesto"
                + "   JOIN articulo ON ((detalle_presupuesto.dp_articulo = articulo.art_codigo)))"
                + "   JOIN presupuesto ON ((detalle_presupuesto.dp_presupuesto = presupuesto.pre_codigo)))"
                + "  WHERE (presupuesto.pre_codigo = "+cod+")";
        return Operacion.getTabla(sql);
    }

}
