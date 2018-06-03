package Datos;

import Componentes.Operacion;
import Componentes.generarCodigos;
import Modelo.Provincia;
import java.util.List;

public class GestionarProvincia {

    public static String getCodigo() {
        String cod = generarCodigos.getCodigo("SELECT MAX(prv_codigo) FROM provincias");
        return cod;
    }

    public static String addProvincia(Provincia p) {
        String msg;
        msg = Operacion.exeOperacion("INSERT INTO provincias VALUES (" + p.getCodProvincia() + ",'" + p.getProvincia() + "','S')");
        return msg;
    }

    public static String actProvincia(Provincia p) {
        String msg;
        msg = Operacion.exeOperacion("UPDATE provincias SET prv_nombre='" + p.getProvincia() + "' WHERE prv_codigo=" + p.getCodProvincia() + "");
        return msg;
    }

    public static String delProvincia(String cod) {
        String msg;
        String sql = "UPDATE provincias SET prv_indicador='N' WHERE prv_codigo = " + cod + "";
        msg = Operacion.exeOperacion(sql);
        return msg;
    }

    public static List listProvincias() {
        String sql = "select * from provincias WHERE prv_indicador='S'";
        return Operacion.getTabla(sql);
    }
}
