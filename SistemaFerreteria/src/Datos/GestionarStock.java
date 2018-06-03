package Datos;

import Componentes.Operacion;
import Modelo.Stock;

public class GestionarStock {
    
    public static String addStock(Stock s){
        String msg;
        msg = Operacion.exeOperacion("INSERT INTO stock  VALUES ("+s.getCod()+","+s.getStock()+",'S')");
        return msg;
    }
    
    public static String actStock(Stock s){
        String msg;
        String sql = "UPDATE stock SET sto_cantidad = "+s.getStock()+" WHERE sto_articulo = "+s.getCod()+"";
        msg = Operacion.exeOperacion(sql);
        return msg;
    }
    
    public static Stock busStock(String cod)
    {
        Stock st = null;
        String sql = "SELECT * FROM stock WHERE sto_articulo = "+cod+"";
        Object[] fila = Operacion.getFila(sql);
        if(fila != null)
        {
            st = new Stock();
            st.setCod(Integer.parseInt(fila[0].toString()));
            st.setStock(Double.parseDouble(fila[1].toString()));
        }
        else
        {
            System.out.println("No encontrado");
        }
        return st;
    }
    
    public static String delStock(String c)
    {
        String msg;
        String sql = "UPDATE stock SET sto_indicador = 'N' WHERE sto_articulo = "+c+"";
        msg = Operacion.exeOperacion(sql);
        return msg;
    }
    
}
