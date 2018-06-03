package Datos;

import Componentes.Operacion;
import Componentes.generarCodigos;
import Modelo.Usuario;
import java.util.List;

public class GestionarUsuario {

    public static String getCodigo() {
        String cod = generarCodigos.getCodigo("SELECT MAX(usu_codigo) FROM usuario");
        return cod;
    }

    public static String addUsuario(Usuario u) {
        String msg = null;
        msg = Operacion.exeOperacion("INSERT INTO usuario "
                + "VALUES (" + u.getCodUsuario() + ",'" + u.getNomUsuario() + "',"
                + "'" + u.getPefil() + "','" + u.getUsuario() + "','" + u.getPassword() + "','S','"+u.getIp()+"')");
        return msg;
    }

    public static String actUsuario(Usuario u) {
        String msg = null;
        msg = Operacion.exeOperacion("UPDATE usuario SET usu_nombre='" + u.getNomUsuario() + "',usu_perfil='" + u.getPefil() + "',usu_usuario='" + u.getUsuario() + "',usu_password='" + u.getPassword() + "',usu_ip='"+u.getIp()+"' WHERE usu_codigo = '" + u.getCodUsuario() + "'");
        return msg;
    }

    public static String delUsuario(String cod) {
        String msg = null;
        msg = Operacion.exeOperacion("UPDATE usuario SET usu_indicador='N' WHERE usu_codigo=" + cod + "");
        return msg;
    }

    public static Usuario busUsuario(String cod) {
        Usuario u = null;
        String sql = "SELECT * FROM usuario WHERE usu_codigo=" + cod + "";
        Object[] filaObt = Operacion.getFila(sql);
        if (filaObt != null) {
            u = new Usuario();
            u.setCodUsuario(Integer.parseInt(filaObt[0].toString()));
            u.setNomUsuario(filaObt[1].toString());
            u.setPefil(filaObt[2].toString());
            u.setUsuario(filaObt[3].toString());
            u.setPassword(filaObt[4].toString());
            u.setIp(filaObt[6].toString());
        }
        return u;
    }

    public static List listUsuario() {
        String sql = "SELECT * FROM usuario WHERE usu_indicador='S'";
        return Operacion.getTabla(sql);
    }

    public static List listEmpleados() {
        String sql = "SELECT ven_codigo, ven_nombre, ven_observacion "
                + "FROM vendedor WHERE NOT EXISTS "
                + "(SELECT usu_codigo FROM usuario where vendedor.ven_codigo = usuario.usu_codigo)";
        return Operacion.getTabla(sql);
    }
}
