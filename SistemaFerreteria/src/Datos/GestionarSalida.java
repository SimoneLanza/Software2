package Datos;

import Componentes.Fecha;
import Componentes.Operacion;
import Componentes.generarCodigos;
import Modelo.DetalleSalida;
import Modelo.Salidas;
import java.util.List;

public class GestionarSalida {

    public static String getCodigo() {
        String cod = generarCodigos.getCodigo("SELECT MAX(sal_codigo) FROM salidas");
        return cod;
    }

    public static String addSalida(Salidas s) {
        String msg;
        msg = Operacion.exeOperacion("INSERT INTO salidas VALUES (" + s.getCodSal() + ",'" + s.getFecha() + "','" + Fecha.darHora() + "'," + s.getMonto() + ",'S')");
        return msg;
    }

    public static String actSalida(String cod) {
        String msg;
        msg = Operacion.exeOperacion("UPDATE salidas SET sal_indicador='N' WHERE sal_codigo = " + cod + "");
        return msg;
    }

    public static String addDetalleSalida(DetalleSalida ds) {
        String msg;
        msg = Operacion.exeOperacion("INSERT INTO detalle_salida VALUES (" + ds.getCodArt() + "," + ds.getCodSalida() + "," + ds.getCodM() + "," + ds.getCant() + "," + ds.getPrec() + "," + ds.getMonto() + ")");
        return msg;
    }

    public static List listSalidas() {
        String sql = "select * from salidas where sal_indicador = 'S'";
        return Operacion.getTabla(sql);
    }

    public static List listDetalle(String cod) {
        String sql = "SELECT motivo.mot_nombre,"
                + "    detalle_salida.ds_cantidad,"
                + "    detalle_salida.ds_salida,"
                + "    articulo.art_descripcion,"
                + "    detalle_salida.ds_precio"
                + "   FROM (((detalle_salida"
                + "   JOIN articulo ON ((detalle_salida.ds_articulo = articulo.art_codigo)))"
                + "   JOIN motivo ON ((detalle_salida.ds_motivo = motivo.mot_codigo)))"
                + "   JOIN salidas ON ((detalle_salida.ds_salida = salidas.sal_codigo)))"
                + "  WHERE (salidas.sal_codigo = "+cod+")";
        return Operacion.getTabla(sql);
    }
}
