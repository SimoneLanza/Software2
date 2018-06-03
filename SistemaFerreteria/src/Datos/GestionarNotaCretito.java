package Datos;

import Componentes.Fecha;
import Componentes.Operacion;
import Componentes.generarCodigos;
import Modelo.detalle_notaCredito;
import Modelo.notaCredito;
import java.util.List;

public class GestionarNotaCretito {

    public static String getCodigo() {
        String cod = generarCodigos.getCodigo("SELECT MAX(nc_codigo) FROM notaCredito");
        return cod;
    }

    public static String addNotaCredit(notaCredito nc) {
        String msg;
        msg = Operacion.exeOperacion("INSERT INTO notacredito VALUES (" + nc.getCodNotaCredito() + "," + nc.getCodFactura() + "," + nc.getCodCliente() + "," + nc.getDescuento() + ",'" + nc.getFecha() + "', '" + Fecha.darHora() + "'," + nc.getTotal() + ",'S')");
        return msg;
    }

    public static String actNotaCredito(String cod) {
        String msg;
        msg = Operacion.exeOperacion("UPDATE notacredito set nc_indicador='N' WHERE nc_codigo=" + cod + "");
        return msg;
    }

    public static notaCredito busNotaCredito(String cod) {
        notaCredito nc = null;
        String sql = "SELECT * FROM notacredito WHERE nc_codigo = " + cod + "";
        Object[] filaObt = Operacion.getFila(sql);
        if (filaObt != null) {
            nc = new notaCredito();
            nc.setCodNotaCredito(Integer.parseInt(filaObt[0].toString()));
            nc.setCodFactura(Integer.parseInt(filaObt[1].toString()));
            nc.setCodCliente(Integer.parseInt(filaObt[2].toString()));
            nc.setDescuento(Double.parseDouble(filaObt[3].toString()));
            nc.setFecha(filaObt[4].toString());
            nc.setHora(filaObt[5].toString());
            nc.setTotal(Double.parseDouble(filaObt[6].toString()));
        } else {
            System.out.println("No encontrado");
        }
        return nc;
    }

    public static String addDetalleNotaCredito(detalle_notaCredito dnc) {
        String msg = null;
        msg = Operacion.exeOperacion("INSERT INTO detallenotacredito "
                + "VALUES (" + dnc.getCodNotaCredito() + "," + dnc.getCodArticulo() + ","
                + "" + dnc.getCantidad() + "," + dnc.getPrecio() + "," + dnc.getTotal() + ")");
        return msg;
    }

    public static List lisNotaCredito() {
        String sql = "SELECT notacredito.nc_codigo,"
                + "    notacredito.nc_fecha,"
                + "    clientes.cli_razonsocial,"
                + "    notacredito.nc_cliente,"
                + "    notacredito.nc_total,"
                + "    notacredito.nc_descuendo,"
                + "    notacredito.nc_factura"
                + "   FROM (notacredito"
                + "   JOIN clientes ON ((notacredito.nc_cliente = clientes.cli_codigo)))"
                + "  WHERE ((notacredito.nc_indicador) = 'S')";
        return Operacion.getTabla(sql);
    }

    public static List listDetalleNotaCredito(String cod) {
        String sql = "SELECT detallenotacredito.dn_cantidad,"
                + "    articulo.art_codigo,"
                + "    articulo.art_descripcion,"
                + "    detallenotacredito.dn_precarticulo,"
                + "    detallenotacredito.dn_total"
                + "   FROM ((detallenotacredito"
                + "   JOIN articulo ON ((detallenotacredito.dn_articulo = articulo.art_codigo)))"
                + "   JOIN notacredito ON ((detallenotacredito.dn_codigo = notacredito.nc_codigo)))"
                + "  WHERE (notacredito.nc_codigo = "+cod+")";
        return Operacion.getTabla(sql);
    }

}
