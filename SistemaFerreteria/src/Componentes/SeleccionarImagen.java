package Componentes;

import java.awt.Image;
import javax.swing.ImageIcon;
import javax.swing.JFileChooser;
import javax.swing.JLabel;
import javax.swing.filechooser.FileNameExtensionFilter;

public class SeleccionarImagen {

    static JFileChooser dlg;
    static FileNameExtensionFilter filter = new FileNameExtensionFilter("Archivo de Imagen .jpg", "jpg");

    public static void selccionar(JLabel lblRuta, JLabel lblImagen) {
        dlg = new JFileChooser();
        dlg.setFileFilter(filter);
        int opcion = dlg.showOpenDialog(null);
        if (opcion == JFileChooser.APPROVE_OPTION) {
            String file = dlg.getSelectedFile().getPath();
            lblRuta.setText(file);
            ImageIcon icon = new ImageIcon(file);
            Image img = icon.getImage();
            Image newImg = img.getScaledInstance(234, 165, java.awt.Image.SCALE_SMOOTH);
            ImageIcon newIcon = new ImageIcon(newImg);
            lblImagen.setIcon(newIcon);
        } else {
            System.out.println("No selecciono nada");
        }
    }

}
