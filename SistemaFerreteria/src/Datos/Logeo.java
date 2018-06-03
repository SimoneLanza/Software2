package Datos;

import Componentes.Operacion;
import Componentes.generarCodigos;
import IU.frmAcceso;
import Modelo.Usuario;

public class Logeo {
    
    public static String getCodigo(){
        String cod = generarCodigos.getCodigo("SELECT MAX(acc_codigo) FROM accesos");
        return cod;
    }
    
    public static Usuario logear(String user, String pass)
    {
        Usuario u = null;
        String sql = "SELECT * FROM usuario WHERE (usu_usuario = '"+user+"' AND usu_password = '"+pass+"')";
        Object[] filaObt = Operacion.getFila(sql);
        if(filaObt != null)
        {
            u = new Usuario();
            u.setCodUsuario(Integer.parseInt(filaObt[0].toString()));
            u.setNomUsuario(filaObt[1].toString());
            u.setPefil(filaObt[2].toString());
            u.setUsuario(filaObt[3].toString());
            u.setPassword(filaObt[4].toString());
            u.setIp(filaObt[6].toString());
            System.out.println("Usuario Correcto");
        }
        else
        {
            frmAcceso.lblMensaje.setText("Usuario o Contraseña Incorrectos");
        }
        return u;
    }
  
    
    public static String acceso(Usuario u)
    {
        String msg;
        msg = Operacion.exeOperacion("INSERT INTO accesos "
                + "VALUES ("+getCodigo()+","+u.getCodUsuario()+",'"+u.getNomUsuario()+"','"+u.getUsuario()+"',"
                + "'"+u.getPefil()+"','"+u.getUsuario()+" ingresó al sistema','Entrada',NOW())");
        return msg;
    }
    public static String salida(Usuario u)
    {
        String msg;
        msg = Operacion.exeOperacion("INSERT INTO accesos "
                + "VALUES ("+getCodigo()+","+u.getCodUsuario()+",'"+u.getNomUsuario()+"','"+u.getUsuario()+"',"
                + "'"+u.getPefil()+"','"+u.getUsuario()+" salió del sistema','Salida',NOW())");
        return msg;
    }
    
}
