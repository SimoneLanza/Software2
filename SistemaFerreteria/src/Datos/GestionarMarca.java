package Datos;

import Componentes.Operacion;
import Componentes.generarCodigos;
import Modelo.Marca;
import Modelo.Rubro;
import java.util.List;

public class GestionarMarca {
    
    public static String getCodigo()
    {
        String cod = generarCodigos.getCodigo("SELECT MAX(mar_codigo) FROM marca");
        return cod;
    }
    
    public static String addMarca(Marca m)
    {
        String msg;
        msg = Operacion.exeOperacion("INSERT INTO marca VALUES ("+m.getCodMarca()+",'"+m.getMarca()+"','S')");
        return msg;
    }
    
    public static Rubro busMarca(String cod)
    {
        Rubro r = null;
        String sql = "SELECT * FROM marca WHERE mar_codigo = '"+cod+"'";
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
    
    public static List listMarca()
    {
        String sql = "select * from marca WHERE mar_indicador='S'";
        return Operacion.getTabla(sql);
    }
    
    public static String actMarca(Marca m)
    {
        String msg;
        String sql = "UPDATE marca SET mar_nombre = '"+m.getMarca()+"' WHERE mar_codigo = '"+m.getCodMarca()+"'";
        msg = Operacion.exeOperacion(sql);
        return msg;
    }
    
    public static String delMarca(String cod)
    {
        String msg;
        String sql = "UPDATE marca SET mar_indicador='N' WHERE mar_codigo = "+cod+"";
        msg = Operacion.exeOperacion(sql);
        return msg;
    }
    
}
