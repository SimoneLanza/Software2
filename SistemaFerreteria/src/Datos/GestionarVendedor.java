package Datos;

import Componentes.Operacion;
import Componentes.generarCodigos;
import Modelo.Vendedor;
import java.util.List;

public class GestionarVendedor {

    public static String getCodigo() {
        String cod = generarCodigos.getCodigo("SELECT MAX(ven_codigo) FROM vendedor");
        return cod;
    }

    public static String addVendedor(Vendedor v) {
        String msg;
        String sql = "INSERT INTO vendedor VALUES (" + getCodigo() + ",'" + v.getNombreV() + "',"
                + "'" + v.getDireccion() + "','" + v.getTelefono() + "','" + v.getCelular() + "'," + v.getSueldo() + ","
                + "" + v.getCodProv() + "," + v.getCodZona() + "," + v.getComision() + ",'" + v.getEmail() + "','" + v.getObs() + "','S')";
        msg = Operacion.exeOperacion(sql);
        return msg;
    }

    public static String actVendedor(Vendedor v) {
        String msg;
        String sql = "UPDATE vendedor SET ven_nombre='" + v.getNombreV() + "',ven_direccion='" + v.getDireccion() + "',"
                + "ven_telefono='" + v.getTelefono() + "',ven_celular='" + v.getCelular() + "',ven_sueldo=" + v.getSueldo() + ","
                + "ven_provincia=" + v.getCodProv() + ",ven_zona=" + v.getCodZona() + ",ven_comision=" + v.getComision() + ","
                + "ven_email = '" + v.getEmail() + "',ven_observacion='" + v.getObs() + "' WHERE ven_codigo = " + v.getCodVe() + "";
        msg = Operacion.exeOperacion(sql);
        return msg;
    }

    public static Vendedor busVendedor(String cod) {
        Vendedor v = null;
        String sql = "SELECT * FROM vendedor WHERE ven_codigo = " + cod + "";
        Object[] filaObt = Operacion.getFila(sql);
        if (filaObt != null) {
            v = new Vendedor();
            v.setCodVe(Integer.parseInt(filaObt[0].toString()));
            v.setNombreV(filaObt[1].toString());
            v.setDireccion(filaObt[2].toString());
            v.setTelefono(filaObt[3].toString());
            v.setCelular(filaObt[4].toString());
            v.setSueldo(Double.parseDouble(filaObt[5].toString()));
            v.setCodProv(Integer.parseInt(filaObt[6].toString()));
            v.setCodZona(Integer.parseInt(filaObt[7].toString()));
            v.setComision(Double.parseDouble(filaObt[8].toString()));
            v.setEmail(filaObt[9].toString());
            v.setObs(filaObt[10].toString());
        } else {
            System.out.println("No encontrado");
        }
        return v;
    }

    public static String delVendedor(String cod) {
        String msg;
        String sql = "UPDATE vendedor SET ven_indicador='N' WHERE ven_codigo = " + cod + "";
        msg = Operacion.exeOperacion(sql);
        return msg;
    }

    public static List listVendedor(String cad) {
        String sql = "SELECT * FROM vendedor WHERE ven_indicador='S' ORDER BY " + cad + "";
        return Operacion.getTabla(sql);
    }

    public static List filNombre(String cad) {
        String sql = "SELECT * FROM vendedor WHERE ven_indicador='S' AND ven_nombre LIKE '" + cad + "%'";
        return Operacion.getTabla(sql);
    }

    public static List filDireccion(String cad) {
        String sql = "SELECT * FROM vendedor WHERE ven_indicador='S' AND ven_direccion LIKE '" + cad + "%'";
        return Operacion.getTabla(sql);
    }

    public static List filTelefono(String cad) {
        String sql = "SELECT * FROM vendedor WHERE ven_indicador='S' AND ven_telefono LIKE '" + cad + "%'";
        return Operacion.getTabla(sql);
    }
}
