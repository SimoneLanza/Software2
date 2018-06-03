package Datos;

import Componentes.Operacion;
import Componentes.generarCodigos;
import Modelo.Proveedor;
import java.util.List;

public class GestionarProveedor {

    public static String getCodigo() {
        String cod = generarCodigos.getCodigo("SELECT MAX(pro_codigo) FROM proveedor");
        return cod;
    }

    public static String addProveedor(Proveedor p) {
        String msg;
        msg = Operacion.exeOperacion("INSERT INTO proveedor  VALUES (" + p.getCodP() + ",'" + p.getRazoS() + "','" + p.getRuc() + "','" + p.getContac() + "','" + p.getCelu() + "','" + p.getTelef() + "','" + p.getFax() + "','" + p.getDireccion() + "'," + p.getCodProvincia() + ",'" + p.getEmail() + "','" + p.getWeb() + "', '" + p.getObs() + "','S')");
        return msg;
    }

    public static String actProveedor(Proveedor p) {
        String msg;
        msg = Operacion.exeOperacion("UPDATE proveedor SET pro_razonSocial='" + p.getRazoS() + "',pro_ruc='" + p.getRuc() + "',pro_contacto='" + p.getContac() + "',pro_celular='" + p.getCelu() + "',pro_telefono='" + p.getTelef() + "',pro_fax='" + p.getFax() + "',pro_direccion='" + p.getDireccion() + "',pro_provincia=" + p.getCodProvincia() + ",pro_email='" + p.getEmail() + "',pro_web='" + p.getWeb() + "', pro_observacion='" + p.getObs() + "' WHERE pro_codigo=" + p.getCodP() + "");
        return msg;
    }

    public static Proveedor busProveedor(String cod) {
        Proveedor p = null;
        String sql = "SELECT * FROM proveedor WHERE pro_codigo = " + cod + "";
        Object[] filaObt = Operacion.getFila(sql);
        if (filaObt != null) {
            p = new Proveedor();
            p.setCodP(Integer.parseInt(filaObt[0].toString()));
            p.setRazoS(filaObt[1].toString());
            p.setRuc(filaObt[2].toString());
            p.setContac(filaObt[3].toString());
            p.setCelu(filaObt[4].toString());
            p.setTelef(filaObt[5].toString());
            p.setFax(filaObt[6].toString());
            p.setDireccion(filaObt[7].toString());
            p.setCodProvincia(Integer.parseInt(filaObt[8].toString()));
            p.setEmail(filaObt[9].toString());
            p.setWeb(filaObt[10].toString());
            p.setObs(filaObt[11].toString());
        } else {
            System.out.println("No encontrado");
        }
        return p;
    }

    public static List listProveedor(String cod) {
        String sql = " SELECT proveedor.pro_codigo,"
                + "    proveedor.pro_razonsocial,"
                + "    proveedor.pro_contacto,"
                + "    proveedor.pro_celular,"
                + "    proveedor.pro_telefono,"
                + "    proveedor.pro_fax,"
                + "    proveedor.pro_direccion,"
                + "    provincias.prv_nombre,"
                + "    proveedor.pro_email,"
                + "    proveedor.pro_web"
                + "   FROM (proveedor"
                + "   JOIN provincias ON ((proveedor.pro_provincia = provincias.prv_codigo)))  "
                + "   WHERE proveedor.pro_indicador = 'S' "
                + "  ORDER BY " + cod + "";
        return Operacion.getTabla(sql);
    }

    public static String delProveedor(String cod) {
        String msg;
        String sql = "UPDATE proveedor SET pro_indicador='N' WHERE pro_codigo = " + cod + "";
        msg = Operacion.exeOperacion(sql);
        return msg;
    }

    public static List filRazonS(String cod) {
        String sql = "SELECT proveedor.pro_codigo,"
                + "    proveedor.pro_razonsocial,"
                + "    proveedor.pro_contacto,"
                + "    proveedor.pro_celular,"
                + "    proveedor.pro_telefono,"
                + "    proveedor.pro_fax,"
                + "    proveedor.pro_direccion,"
                + "    provincias.prv_nombre,"
                + "    proveedor.pro_email,"
                + "    proveedor.pro_web"
                + "   FROM (proveedor"
                + "   JOIN provincias ON ((proveedor.pro_provincia = provincias.prv_codigo)))"
                + "  WHERE (((proveedor.pro_indicador) = 'S') AND ((proveedor.pro_razonsocial) LIKE '"+cod+"%'))";
        return Operacion.getTabla(sql);
    }

    public static List filContacto(String cod) {
        String sql = "SELECT proveedor.pro_codigo,"
                + "    proveedor.pro_razonsocial,"
                + "    proveedor.pro_contacto,"
                + "    proveedor.pro_celular,"
                + "    proveedor.pro_telefono,"
                + "    proveedor.pro_fax,"
                + "    proveedor.pro_direccion,"
                + "    provincias.prv_nombre,"
                + "    proveedor.pro_email,"
                + "    proveedor.pro_web"
                + "   FROM (proveedor"
                + "   JOIN provincias ON ((proveedor.pro_provincia = provincias.prv_codigo)))"
                + "  WHERE (((proveedor.pro_indicador) = 'S') AND ((proveedor.pro_contacto) LIKE '"+cod+"%'))";
        return Operacion.getTabla(sql);
    }

}
