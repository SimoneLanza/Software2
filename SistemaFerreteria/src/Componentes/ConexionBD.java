package Componentes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionBD {
    
    private final String servidor = "localhost";
    private final String bd = "bd_ferreteria3";
    private final String usuario = "root";
    private final String password = "";

    public Connection getConexion() {
        Connection cn = null;
        try {
            //MySQL
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://"+servidor+"/"+bd+"", ""+usuario+"", ""+password+"");
            
            //PostgreSQL
//            Class.forName("org.postgresql.Driver");
//            cn = DriverManager.getConnection("jdbc:postgresql://"+servidor+":5432/"+bd+"", ""+usuario+"", ""+password+"");
        } catch (ClassNotFoundException e) {
            cn = null;
        } catch (SQLException e) {
            cn = null;
        }
        return cn;
    }

}
