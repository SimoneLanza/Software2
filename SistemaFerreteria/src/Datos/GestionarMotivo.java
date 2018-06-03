package Datos;

import Componentes.Operacion;
import Componentes.generarCodigos;
import Modelo.Motivo;
import java.util.List;

public class GestionarMotivo {
    
    public static String getCodigo()
    {
        String cod = generarCodigos.getCodigo("SELECT MAX(mot_codigo) from motivo ");
        return cod;
    }
    
    public static String addMotivo(Motivo m)
    {
        String msg;
        msg = Operacion.exeOperacion("INSERT INTO motivo VALUES ("+m.getCodM()+",'"+m.getMotivo()+"','S')");
        return msg;
    }
    
    public static String actMotivo(Motivo m)
    {
        String msg;
        msg = Operacion.exeOperacion("UPDATE motivo SET mot_nombre='"+m.getMotivo()+"' WHERE mot_codigo="+m.getCodM()+"");
        return msg;
    }
    
    public static String delMotivo(String cod)
    {
        String msg;
        String sql = "UPDATE motivo SET mot_indicador = 'N' WHERE mot_codigo = "+cod+"";
        msg = Operacion.exeOperacion(sql);
        return msg;
    }
    
    public static List listMotivo()
    {
        String sql = "SELECT * FROM motivo WHERE mot_indicador='S'";
        return Operacion.getTabla(sql);
    }
    
}
