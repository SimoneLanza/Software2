package Datos;

import Componentes.Operacion;
import Componentes.generarCodigos;
import Modelo.zona;
import java.util.List;

public class GestionarZona {

    public static String getCodigo() {
        String cod = generarCodigos.getCodigo("SELECT MAX(zon_codigo) FROM zona");
        return cod;
    }

    public static String addZona(zona z) {
        String msg;
        msg = Operacion.exeOperacion("INSERT INTO zona VALUES (" + z.getCodZona() + ",'" + z.getZona() + "','S')");
        return msg;
    }

    public static String actZona(zona z) {
        String msg;
        msg = Operacion.exeOperacion("UPDATE zona SET zon_nombre='" + z.getZona() + "' WHERE zon_codigo=" + z.getCodZona() + "");
        return msg;
    }

    public static String delZona(String cod) {
        String msg;
        String sql = "UPDATE zona SET zon_indicador='N' WHERE zon_codigo = " + cod + "";
        msg = Operacion.exeOperacion(sql);
        return msg;
    }

    public static List listZona() {
        String sql = "select * from zona WHERE zon_indicador='S'";
        return Operacion.getTabla(sql);
    }
}
