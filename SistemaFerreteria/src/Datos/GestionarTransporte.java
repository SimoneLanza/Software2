package Datos;

import Componentes.Operacion;
import Componentes.generarCodigos;
import Modelo.Transporte;
import java.util.List;

public class GestionarTransporte {
    
    public static String getCodigo()
    {
        String cod = generarCodigos.getCodigo("SELECT MAX(tra_codigo) FROM transporte");
        return cod;
    }
    
    public static String addTransporte(Transporte t)
    {
        String msg;
        msg = Operacion.exeOperacion("INSERT INTO transporte VALUES ("+t.getCodTransporte()+",'"+t.getTransporte()+"','S')");
        return msg;
    }
    
    public static String actTransporte(Transporte t)
    {
        String msg;
        msg = Operacion.exeOperacion("UPDATE transporte SET tra_nombre='"+t.getTransporte()+"' WHERE tra_codigo="+t.getCodTransporte()+"");
        return msg;
    }
    
    public static String delTransporte(String cod)
    {
        String msg;
        String sql = "UPDATE transporte SET tra_indicador='N' WHERE tra_codigo = "+cod+"";
        msg = Operacion.exeOperacion(sql);
        return msg;
    }
    
    public static List listTransporte()
    {
        String sql = "select * from transporte WHERE tra_indicador='S'";
        return Operacion.getTabla(sql);
    }
    
}