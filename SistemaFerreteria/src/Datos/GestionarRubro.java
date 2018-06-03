package Datos;

import Componentes.Operacion;
import Componentes.generarCodigos;
import Modelo.Rubro;
import java.util.List;

public class GestionarRubro {
    
    public static String getCodigo()
    {
        String cod = generarCodigos.getCodigo("SELECT MAX(rub_codigo) FROM rubro");
        return cod;
    }
    
    public static String addRubro(Rubro r)
    {
        String msg;
        msg = Operacion.exeOperacion("INSERT INTO rubro VALUES ("+r.getCodRubro()+",'"+r.getRubro()+"','S')");
        return msg;
    }
    
    public static Rubro busRubro(String nom)
    {
        Rubro r = null;
        String sql = "SELECT rub_codigo FROM rubro WHERE rub_nombre = '"+nom+"'";
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
    
    
    public static List listRubro()
    {
        String sql = "select * from rubro WHERE rub_indicador='S'";
        return Operacion.getTabla(sql);
    }
    
    public static String actRubro(Rubro r)
    {
        String msg;
        String sql = "UPDATE rubro SET rub_nombre = '"+r.getRubro()+"' WHERE rub_codigo = '"+r.getCodRubro()+"'";
        msg = Operacion.exeOperacion(sql);
        return msg;
    }
    
    public static String delRubro(String cod)
    {
        String msg;
        String sql = "UPDATE rubro SET rub_indicador='N' WHERE rub_codigo = "+cod+"";
        msg = Operacion.exeOperacion(sql);
        return msg;
    }
    
    
    
}
