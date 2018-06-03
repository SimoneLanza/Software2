package Datos;

import Componentes.Operacion;
import Componentes.generarCodigos;
import Modelo.Articulo;
import java.util.List;

public class GestionarArticulos {

    public static String getCodigo() {
        String cod = generarCodigos.getCodigo("select MAX(art_codigo) from articulo");
        return cod;
    }

    public static String addArticulo(Articulo art) {
        String msg;
        msg = Operacion.exeOperacion("INSERT INTO articulo VALUES (" + art.getCodArticulo() + ",'" + art.getDescripcion() + "',"
                + "" + art.getCodMarca() + "," + art.getCodProveedor() + "," + art.getEfectivo() + "," + art.getMontoCalculado() + ","
                + "" + art.getTarjeta() + "," + art.getCosto() + ",'" + art.getFecha() + "'," + art.getCodUnidad() + "," + art.getCodRubro() + ","
                + "" + art.getStock() + ",'S')");
        return msg;
    }

    public static String actArticulo(Articulo art) {
        String msg;
        msg = Operacion.exeOperacion("UPDATE articulo SET art_descripcion='" + art.getDescripcion() + "',art_marca=" + art.getCodMarca() + ",art_proveedor=" + art.getCodProveedor() + ",art_efectivo=" + art.getEfectivo() + ",art_montoCalculado=" + art.getMontoCalculado() + ",art_tarjeta=" + art.getTarjeta() + ",art_costo=" + art.getCosto() + ",art_fechaCompra='" + art.getFecha() + "',art_unidad=" + art.getCodUnidad() + ",art_rubro=" + art.getCodRubro() + ",art_stock=" + art.getStock() + " WHERE art_codigo=" + art.getCodArticulo() + "");
        return msg;
    }

    public static String actStock(Articulo art) {
        String msg;
        msg = Operacion.exeOperacion("UPDATE articulo SET art_stock=" + art.getStock() + " WHERE art_codigo=" + art.getCodArticulo() + "");
        return msg;
    }

    public static String delArticulo(String cod) {
        String msg;
        String sql = "UPDATE articulo SET art_indicador = 'N' WHERE art_codigo = " + cod + "";
        msg = Operacion.exeOperacion(sql);
        return msg;
    }

    public static Articulo busArticulo(String cod) {
        Articulo ar = null;
        String sql = "SELECT * FROM articulo WHERE art_codigo = " + cod + "";
        Object[] filaObt = Operacion.getFila(sql);
        if (filaObt != null) {
            ar = new Articulo();
            ar.setCodArticulo(Integer.parseInt(filaObt[0].toString()));
            ar.setDescripcion(filaObt[1].toString());
            ar.setCodMarca(Integer.parseInt(filaObt[2].toString()));
            ar.setCodProveedor(Integer.parseInt(filaObt[3].toString()));
            ar.setEfectivo(Double.parseDouble(filaObt[4].toString()));
            ar.setMontoCalculado(Double.parseDouble(filaObt[5].toString()));
            ar.setTarjeta(Double.parseDouble(filaObt[6].toString()));
            ar.setCosto(Double.parseDouble(filaObt[7].toString()));
            ar.setFecha(filaObt[8].toString());
            ar.setCodUnidad(Integer.parseInt(filaObt[9].toString()));
            ar.setCodRubro(Integer.parseInt(filaObt[10].toString()));
            ar.setStock(Double.parseDouble(filaObt[11].toString()));
            System.out.println("Encontrado");
        } else {
            System.out.println("No encontrado");
        }
        return ar;
    }

    public static List listArticulo(String cod) {
        String sql = "SELECT articulo.art_codigo,"
                + "    articulo.art_descripcion,"
                + "    marca.mar_nombre,"
                + "    proveedor.pro_razonsocial,"
                + "    articulo.art_efectivo,"
                + "    articulo.art_montocalculado,"
                + "    articulo.art_tarjeta,"
                + "    articulo.art_costo,"
                + "    articulo.art_fechacompra,"
                + "    unidad.uni_nombre,"
                + "    rubro.rub_nombre,"
                + "    articulo.art_stock,"
                + "    stock.sto_cantidad"
                + "   FROM (((((articulo"
                + "   JOIN marca ON ((articulo.art_marca = marca.mar_codigo)))"
                + "   JOIN proveedor ON ((articulo.art_proveedor = proveedor.pro_codigo)))"
                + "   JOIN unidad ON ((articulo.art_unidad = unidad.uni_codigo)))"
                + "   JOIN rubro ON ((articulo.art_rubro = rubro.rub_codigo)))"
                + "   JOIN stock ON ((stock.sto_articulo = articulo.art_codigo)))"
                + "   WHERE"
                + "   articulo.art_indicador = 'S'"
                + "   ORDER BY " + cod + "";
        return Operacion.getTabla(sql);
    }

    public static List filtrarArticulo(String cad) {
        String sql = " SELECT articulo.art_codigo,"
                + "    articulo.art_descripcion,"
                + "    marca.mar_nombre,"
                + "    proveedor.pro_razonsocial,"
                + "    articulo.art_efectivo,"
                + "    articulo.art_montocalculado,"
                + "    articulo.art_tarjeta,"
                + "    articulo.art_costo,"
                + "    articulo.art_fechacompra,"
                + "    unidad.uni_nombre,"
                + "    rubro.rub_nombre,"
                + "    articulo.art_stock,"
                + "    stock.sto_cantidad"
                + "   FROM (((((articulo"
                + "   JOIN marca ON ((articulo.art_marca = marca.mar_codigo)))"
                + "   JOIN proveedor ON ((articulo.art_proveedor = proveedor.pro_codigo)))"
                + "   JOIN unidad ON ((articulo.art_unidad = unidad.uni_codigo)))"
                + "   JOIN rubro ON ((articulo.art_rubro = rubro.rub_codigo)))"
                + "   JOIN stock ON ((stock.sto_articulo = articulo.art_codigo)))"
                + "  WHERE (((articulo.art_indicador) = 'S') AND ((articulo.art_descripcion) LIKE '" + cad + "%'))";
        return Operacion.getTabla(sql);
    }

    public static List filtrarRubro(String cad) {
        String sql = "SELECT articulo.art_codigo,"
                + "    articulo.art_descripcion,"
                + "    marca.mar_nombre,"
                + "    proveedor.pro_razonsocial,"
                + "    articulo.art_efectivo,"
                + "    articulo.art_montocalculado,"
                + "    articulo.art_tarjeta,"
                + "    articulo.art_costo,"
                + "    articulo.art_fechacompra,"
                + "    unidad.uni_nombre,"
                + "    rubro.rub_nombre,"
                + "    articulo.art_stock,"
                + "    stock.sto_cantidad"
                + "   FROM (((((articulo"
                + "   JOIN marca ON ((articulo.art_marca = marca.mar_codigo)))"
                + "   JOIN proveedor ON ((articulo.art_proveedor = proveedor.pro_codigo)))"
                + "   JOIN unidad ON ((articulo.art_unidad = unidad.uni_codigo)))"
                + "   JOIN rubro ON ((articulo.art_rubro = rubro.rub_codigo)))"
                + "   JOIN stock ON ((stock.sto_articulo = articulo.art_codigo)))"
                + "   WHERE"
                + "(((articulo.art_indicador) = 'S') AND "
                + "rubro.rub_nombre LIKE '" + cad + "%')";
        return Operacion.getTabla(sql);
    }

    public static List filtrarMarca(String cad) {
        String sql = "SELECT articulo.art_codigo,"
                + "    articulo.art_descripcion,"
                + "    marca.mar_nombre,"
                + "    proveedor.pro_razonsocial,"
                + "    articulo.art_efectivo,"
                + "    articulo.art_montocalculado,"
                + "    articulo.art_tarjeta,"
                + "    articulo.art_costo,"
                + "    articulo.art_fechacompra,"
                + "    unidad.uni_nombre,"
                + "    rubro.rub_nombre,"
                + "    articulo.art_stock,"
                + "    stock.sto_cantidad"
                + "   FROM (((((articulo"
                + "   JOIN marca ON ((articulo.art_marca = marca.mar_codigo)))"
                + "   JOIN proveedor ON ((articulo.art_proveedor = proveedor.pro_codigo)))"
                + "   JOIN unidad ON ((articulo.art_unidad = unidad.uni_codigo)))"
                + "   JOIN rubro ON ((articulo.art_rubro = rubro.rub_codigo)))"
                + "   JOIN stock ON ((stock.sto_articulo = articulo.art_codigo)))"
                + "   WHERE"
                + "(((articulo.art_indicador) = 'S') AND "
                + "marca.mar_nombre LIKE '" + cad + "%')";
        return Operacion.getTabla(sql);
    }

    public static List filtProveedor(String cad) {
        String sql = "SELECT articulo.art_codigo,"
                + "    articulo.art_descripcion,"
                + "    marca.mar_nombre,"
                + "    proveedor.pro_razonsocial,"
                + "    articulo.art_efectivo,"
                + "    articulo.art_montocalculado,"
                + "    articulo.art_tarjeta,"
                + "    articulo.art_costo,"
                + "    articulo.art_fechacompra,"
                + "    unidad.uni_nombre,"
                + "    rubro.rub_nombre,"
                + "    articulo.art_stock,"
                + "    stock.sto_cantidad"
                + "   FROM (((((articulo"
                + "   JOIN marca ON ((articulo.art_marca = marca.mar_codigo)))"
                + "   JOIN proveedor ON ((articulo.art_proveedor = proveedor.pro_codigo)))"
                + "   JOIN unidad ON ((articulo.art_unidad = unidad.uni_codigo)))"
                + "   JOIN rubro ON ((articulo.art_rubro = rubro.rub_codigo)))"
                + "   JOIN stock ON ((stock.sto_articulo = articulo.art_codigo)))"
                + "   WHERE"
                + "(((articulo.art_indicador) = 'S') AND "
                + "proveedor.pro_razonsocial LIKE '" + cad + "%')";
        return Operacion.getTabla(sql);
    }

}
