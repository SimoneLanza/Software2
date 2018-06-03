package Datos;

import Componentes.Operacion;
import Componentes.generarCodigos;
import Modelo.Rubro;
import Modelo.Unidad;
import java.util.List;

public class GestionarUnidad {
    
    public static String getCodigo()
    {
        String cod = generarCodigos.getCodigo("SELECT MAX(uni_codigo) FROM unidad");
        return cod;
    }
    
    public static String addUnidad(Unidad u)
    {
        String msg;
        msg = Operacion.exeOperacion("INSERT INTO unidad VALUES ("+u.getCodUnidad()+",'"+u.getUnidad()+"','S')");
        return msg;
    }
    
    public static Rubro busUnidad(String cod)
    {
        Rubro r = null;
        String sql = "SELECT * FROM unidad WHERE uni_codigo = '"+cod+"'";
        Object[] filaObt = Operacion.getFila(sql);
        if(filaObt != null)
        {
            r = new Rubro();
            r.setCodRubro(Integer.parseInt(filaObt[0].toString()));
            r.setRubro(filaObt[1].toString());
        }
        else{}
        return r;
    }
    
    public static List listUnidad()
    {
        String sql = "select * from unidad WHERE uni_indicador='S'";
        return Operacion.getTabla(sql);
    }
    
    public static String actUnidad(Unidad u)
    {
        String msg;
        String sql = "UPDATE unidad SET uni_nombre = '"+u.getUnidad()+"' WHERE uni_codigo = '"+u.getCodUnidad()+"'";
        msg = Operacion.exeOperacion(sql);
        return msg;
    }
    
    public static String delUnidad(String cod)
    {
        String msg;
        String sql = "UPDATE unidad SET uni_indicador='N' WHERE uni_codigo = "+cod+"";
        msg = Operacion.exeOperacion(sql);
        return msg;
    }
        
}
