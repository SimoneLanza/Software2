package Componentes;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import javax.swing.JOptionPane;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.view.JasperViewer;

public class GenerarReporte {

    //creando una conexion
    Connection con = new ConexionBD().getConexion();

    public void MostrarReporte(String url, String tit) {
        try {// se lee el archivo del tipo jasper desde su ubicacion
            JasperReport reporte = (JasperReport) JRLoader.loadObject(url);
            //se crea el objeto Map para enviar el parametro que necesita el archivo jasper
            Map parametro = new HashMap();
            //se filtra el reporte con su conexion y su parametro  para mostrarlo
            JasperPrint jasperPrint = JasperFillManager.fillReport(reporte, parametro, con);
            //se lanza el viewer de Jasper, para ver el reporte
            JasperViewer jviewer = new JasperViewer(jasperPrint, false);
            jviewer.setTitle(tit); // se envia un titulo
            jviewer.setVisible(true); // se muestra el viewer
        } catch (JRException j) {
            JOptionPane.showMessageDialog(null, "Error al mostrar Reporte.. " + j.getMessage());
        }
    }

    public void MostrarReporteConParametro(String url, String tit, int codF) {
        try {// se lee el archivo del tipo jasper desde su ubicacion
            JasperReport reporte = (JasperReport) JRLoader.loadObject(url);
            //se crea el objeto Map para enviar el parametro que necesita el archivo jasper
            Map parametro = new HashMap();
            //Se Coloca al parametro el campo y su valor para actualizarlo
            parametro.put("ls_codigo", codF);
            //se filtra el reporte con su conexion y su parametro  para mostrarlo
            JasperPrint jasperPrint = JasperFillManager.fillReport(reporte, parametro, con);
            //se lanza el viewer de Jasper, para ver el reporte
            JasperViewer jviewer = new JasperViewer(jasperPrint, false);
            jviewer.setTitle(tit); // se envia un titulo
            jviewer.setVisible(true); // se muestra el viewer
        } catch (JRException j) {
            JOptionPane.showMessageDialog(null, "Error al mostrar Reporte.. " + j.getMessage());
        }
    }

    public void cerrar() {
        try {
            con.close();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Error al cerrar la"
                    + "  conexión.. " + ex.getMessage());
        }
    }
}
