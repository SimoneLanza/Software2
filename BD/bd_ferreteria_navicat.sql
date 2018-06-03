/*
MySQL Backup
Source Server Version: 5.6.16
Source Database: bd_ferreteria3
Date: 18/11/2014 12:19:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `accesos`
-- ----------------------------
DROP TABLE IF EXISTS `accesos`;
CREATE TABLE `accesos` (
  `acc_codigo` int(32) NOT NULL,
  `acc_usuario` int(32) NOT NULL,
  `acc_nombre` varchar(50) DEFAULT NULL,
  `acc_user` varchar(15) DEFAULT NULL,
  `acc_perfil` varchar(15) DEFAULT NULL,
  `acc_descripcion` varchar(50) DEFAULT NULL,
  `acc_tipoacceso` varchar(8) DEFAULT NULL,
  `acc_fecha` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`acc_codigo`),
  KEY `fki_accesos_fkey` (`acc_codigo`),
  KEY `accesos_fkey` (`acc_usuario`),
  CONSTRAINT `accesos_fkey` FOREIGN KEY (`acc_usuario`) REFERENCES `usuario` (`usu_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `articulo`
-- ----------------------------
DROP TABLE IF EXISTS `articulo`;
CREATE TABLE `articulo` (
  `art_codigo` int(32) NOT NULL,
  `art_descripcion` varchar(40) DEFAULT NULL,
  `art_marca` int(32) NOT NULL,
  `art_proveedor` int(32) NOT NULL,
  `art_efectivo` varchar(255) DEFAULT NULL,
  `art_montocalculado` varchar(255) DEFAULT NULL,
  `art_tarjeta` varchar(255) DEFAULT NULL,
  `art_costo` varchar(255) DEFAULT NULL,
  `art_fechacompra` date DEFAULT NULL,
  `art_unidad` int(32) NOT NULL,
  `art_rubro` int(32) NOT NULL,
  `art_stock` int(32) DEFAULT NULL,
  `art_indicador` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`art_codigo`),
  KEY `articulo_art_marca_idx` (`art_marca`),
  KEY `articulo_art_proveedor_idx` (`art_proveedor`),
  KEY `articulo_art_rubro_idx` (`art_rubro`),
  KEY `articulo_art_unidad_idx` (`art_unidad`),
  KEY `fki_articulo_fkey` (`art_rubro`),
  KEY `fki_articulo_mkey` (`art_marca`),
  KEY `fki_articulo_ukey` (`art_unidad`),
  KEY `fki_articulo_vkey` (`art_proveedor`),
  CONSTRAINT `articulo_mkey` FOREIGN KEY (`art_marca`) REFERENCES `marca` (`mar_codigo`),
  CONSTRAINT `articulo_fkey` FOREIGN KEY (`art_rubro`) REFERENCES `rubro` (`rub_codigo`),
  CONSTRAINT `articulo_ukey` FOREIGN KEY (`art_unidad`) REFERENCES `unidad` (`uni_codigo`),
  CONSTRAINT `articulo_vkey` FOREIGN KEY (`art_proveedor`) REFERENCES `proveedor` (`pro_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `categcompra`
-- ----------------------------
DROP TABLE IF EXISTS `categcompra`;
CREATE TABLE `categcompra` (
  `ccp_codigo` int(32) NOT NULL,
  `ccp_nombre` varchar(15) DEFAULT NULL,
  `ccp_indicador` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`ccp_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `clientes`
-- ----------------------------
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `cli_codigo` int(32) NOT NULL,
  `cli_razonsocial` varchar(50) DEFAULT NULL,
  `cli_contacto` varchar(50) DEFAULT NULL,
  `cli_vendedor` int(32) NOT NULL,
  `cli_telefono` varchar(9) DEFAULT NULL,
  `cli_celular` varchar(11) DEFAULT NULL,
  `cli_fax` varchar(9) DEFAULT NULL,
  `cli_rubro` int(32) NOT NULL,
  `cli_ruc` varchar(12) DEFAULT NULL,
  `cli_limitecuenta` varchar(255) DEFAULT NULL,
  `cli_direccion` varchar(50) DEFAULT NULL,
  `cli_email` varchar(50) DEFAULT NULL,
  `cli_web` varchar(50) DEFAULT NULL,
  `cli_transporte` int(32) NOT NULL,
  `cli_provincia` int(32) NOT NULL,
  `cli_zona` int(32) NOT NULL,
  `cli_descuento` varchar(255) DEFAULT NULL,
  `cli_tipopago` varchar(20) DEFAULT NULL,
  `cli_observacion` varchar(200) DEFAULT NULL,
  `cli_indicador` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`cli_codigo`),
  KEY `clientes_cli_provincia_idx` (`cli_provincia`),
  KEY `clientes_cli_rubro_idx` (`cli_rubro`),
  KEY `clientes_cli_transporte_idx` (`cli_transporte`),
  KEY `clientes_cli_vendedor_idx` (`cli_vendedor`),
  KEY `clientes_cli_zona_idx` (`cli_zona`),
  KEY `fki_cliente_rkey` (`cli_rubro`),
  KEY `fki_cliente_tkey` (`cli_transporte`),
  KEY `fki_cliente_vkey` (`cli_vendedor`),
  KEY `fki_clientes_ckey` (`cli_provincia`),
  KEY `fki_clientes_zkey` (`cli_zona`),
  CONSTRAINT `clientes_ckey` FOREIGN KEY (`cli_provincia`) REFERENCES `provincias` (`prv_codigo`),
  CONSTRAINT `clientes_zkey` FOREIGN KEY (`cli_zona`) REFERENCES `zona` (`zon_codigo`),
  CONSTRAINT `cliente_rkey` FOREIGN KEY (`cli_rubro`) REFERENCES `rubro` (`rub_codigo`),
  CONSTRAINT `cliente_tkey` FOREIGN KEY (`cli_transporte`) REFERENCES `transporte` (`tra_codigo`),
  CONSTRAINT `cliente_vkey` FOREIGN KEY (`cli_vendedor`) REFERENCES `vendedor` (`ven_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `comision`
-- ----------------------------
DROP TABLE IF EXISTS `comision`;
CREATE TABLE `comision` (
  `com_codigo` int(32) NOT NULL,
  `com_vendedor` int(32) DEFAULT NULL,
  `com_total` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`com_codigo`),
  KEY `vendedor_fkey` (`com_vendedor`),
  CONSTRAINT `vendedor_fkey` FOREIGN KEY (`com_vendedor`) REFERENCES `vendedor` (`ven_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `compras`
-- ----------------------------
DROP TABLE IF EXISTS `compras`;
CREATE TABLE `compras` (
  `com_codigo` int(32) NOT NULL,
  `com_proveedor` int(32) NOT NULL,
  `com_categoria` int(32) NOT NULL,
  `com_condpago` varchar(20) DEFAULT NULL,
  `com_fecha` varchar(9) DEFAULT NULL,
  `com_hora` time(6) NOT NULL,
  `com_total` varchar(255) DEFAULT NULL,
  `com_indicador` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`com_codigo`),
  KEY `compras_com_categoria_idx` (`com_categoria`),
  KEY `compras_com_proveedor_idx` (`com_proveedor`),
  CONSTRAINT `compras_fkey_proveedor` FOREIGN KEY (`com_proveedor`) REFERENCES `proveedor` (`pro_codigo`),
  CONSTRAINT `compras_com_categoria_fkey` FOREIGN KEY (`com_categoria`) REFERENCES `categcompra` (`ccp_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `detallenotacredito`
-- ----------------------------
DROP TABLE IF EXISTS `detallenotacredito`;
CREATE TABLE `detallenotacredito` (
  `dn_codigo` int(32) NOT NULL,
  `dn_articulo` int(32) NOT NULL,
  `dn_cantidad` int(32) DEFAULT NULL,
  `dn_precarticulo` int(32) DEFAULT NULL,
  `dn_total` varchar(255) DEFAULT NULL,
  KEY `detallenotacredito_dn_articulo_idx` (`dn_articulo`),
  KEY `detallenotacredito_dn_codigo_idx` (`dn_codigo`),
  KEY `fki_detallenotacredito_db_notacredito_fkey` (`dn_codigo`),
  CONSTRAINT `detallenotacredito_db_notacredito_fkey` FOREIGN KEY (`dn_codigo`) REFERENCES `notacredito` (`nc_codigo`),
  CONSTRAINT `detallenotacredito_dn_articulo_fkey` FOREIGN KEY (`dn_articulo`) REFERENCES `articulo` (`art_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `detalle_compras`
-- ----------------------------
DROP TABLE IF EXISTS `detalle_compras`;
CREATE TABLE `detalle_compras` (
  `dc_articulo` int(32) NOT NULL,
  `dc_compra` int(32) NOT NULL,
  `dc_cantidad` int(32) DEFAULT NULL,
  `dc_precio` varchar(255) DEFAULT NULL,
  `dc_monto` varchar(255) DEFAULT NULL,
  KEY `detalle_compras_dc_articulo_idx` (`dc_articulo`),
  KEY `detalle_compras_dc_compra_idx` (`dc_compra`),
  CONSTRAINT `detalle_compras_dc_compra_fkey` FOREIGN KEY (`dc_compra`) REFERENCES `compras` (`com_codigo`),
  CONSTRAINT `detalle_compras_dc_articulo_fkey` FOREIGN KEY (`dc_articulo`) REFERENCES `articulo` (`art_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `detalle_factura`
-- ----------------------------
DROP TABLE IF EXISTS `detalle_factura`;
CREATE TABLE `detalle_factura` (
  `df_codigo` int(32) NOT NULL,
  `df_articulo` int(32) NOT NULL,
  `df_cantidad` int(32) DEFAULT NULL,
  `df_precarticulo` varchar(255) DEFAULT NULL,
  `df_total` varchar(255) DEFAULT NULL,
  KEY `detalle_factura_df_articulo_idx` (`df_articulo`),
  KEY `detalle_factura_df_codigo_idx` (`df_codigo`),
  KEY `fki_detalle_factura_df_factura_fkey` (`df_codigo`),
  CONSTRAINT `detalle_factura_df_articulo_fkey` FOREIGN KEY (`df_articulo`) REFERENCES `articulo` (`art_codigo`),
  CONSTRAINT `detalle_factura_df_factura_fkey` FOREIGN KEY (`df_codigo`) REFERENCES `factura` (`fac_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `detalle_presupuesto`
-- ----------------------------
DROP TABLE IF EXISTS `detalle_presupuesto`;
CREATE TABLE `detalle_presupuesto` (
  `dp_presupuesto` int(32) NOT NULL,
  `dp_articulo` int(32) NOT NULL,
  `dp_cantidad` int(32) DEFAULT NULL,
  `dp_precarticulo` varchar(255) DEFAULT NULL,
  `dp_total` varchar(255) DEFAULT NULL,
  KEY `detalle_presupuesto_dp_articulo_idx` (`dp_articulo`),
  KEY `detalle_presupuesto_dp_presupuesto_idx` (`dp_presupuesto`),
  KEY `fki_detalle_presupuesto_dp_presupuesto_fkey` (`dp_presupuesto`),
  CONSTRAINT `detalle_presupuesto_dp_articulo_fkey` FOREIGN KEY (`dp_articulo`) REFERENCES `articulo` (`art_codigo`),
  CONSTRAINT `detalle_presupuesto_dp_presupuesto_fkey` FOREIGN KEY (`dp_presupuesto`) REFERENCES `presupuesto` (`pre_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `detalle_salida`
-- ----------------------------
DROP TABLE IF EXISTS `detalle_salida`;
CREATE TABLE `detalle_salida` (
  `ds_articulo` int(32) NOT NULL,
  `ds_salida` int(32) NOT NULL,
  `ds_motivo` int(32) NOT NULL,
  `ds_cantidad` int(32) DEFAULT NULL,
  `ds_precio` varchar(255) DEFAULT NULL,
  `ds_monto` varchar(255) NOT NULL,
  KEY `detalle_salida_ds_articulo_idx` (`ds_articulo`),
  KEY `detalle_salida_ds_motivo_idx` (`ds_motivo`),
  KEY `detalle_salida_ds_salida_idx` (`ds_salida`),
  KEY `fki_detalle_salida_ds_motivo_fkey` (`ds_motivo`),
  KEY `fki_detalle_salida_ds_salidas_fkey` (`ds_salida`),
  CONSTRAINT `detalle_salida_ds_articulo_fkey` FOREIGN KEY (`ds_articulo`) REFERENCES `articulo` (`art_codigo`),
  CONSTRAINT `detalle_salida_ds_motivo_fkey` FOREIGN KEY (`ds_motivo`) REFERENCES `motivo` (`mot_codigo`),
  CONSTRAINT `detalle_salida_ds_salidas_fkey` FOREIGN KEY (`ds_salida`) REFERENCES `salidas` (`sal_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `factura`
-- ----------------------------
DROP TABLE IF EXISTS `factura`;
CREATE TABLE `factura` (
  `fac_codigo` int(32) NOT NULL,
  `fac_cliente` int(32) NOT NULL,
  `fac_vendedor` int(32) NOT NULL,
  `fac_descuento` varchar(255) DEFAULT NULL,
  `fac_tipopago` varchar(15) DEFAULT NULL,
  `fac_fecha` varchar(9) DEFAULT NULL,
  `fac_hora` time(6) NOT NULL,
  `fac_neto` varchar(255) DEFAULT NULL,
  `fac_total` varchar(255) DEFAULT NULL,
  `fac_indicador` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`fac_codigo`),
  KEY `factura_fac_cliente_idx` (`fac_cliente`),
  KEY `factura_fac_vendedor_idx` (`fac_vendedor`),
  CONSTRAINT `factura_fac_cliente_fkey` FOREIGN KEY (`fac_cliente`) REFERENCES `clientes` (`cli_codigo`),
  CONSTRAINT `factura_fkey_vendedor` FOREIGN KEY (`fac_vendedor`) REFERENCES `vendedor` (`ven_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `marca`
-- ----------------------------
DROP TABLE IF EXISTS `marca`;
CREATE TABLE `marca` (
  `mar_codigo` int(32) NOT NULL,
  `mar_nombre` varchar(15) DEFAULT NULL,
  `mar_indicador` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`mar_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `motivo`
-- ----------------------------
DROP TABLE IF EXISTS `motivo`;
CREATE TABLE `motivo` (
  `mot_codigo` int(32) NOT NULL,
  `mot_nombre` varchar(15) DEFAULT NULL,
  `mot_indicador` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`mot_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `notacredito`
-- ----------------------------
DROP TABLE IF EXISTS `notacredito`;
CREATE TABLE `notacredito` (
  `nc_codigo` int(32) NOT NULL,
  `nc_factura` int(32) NOT NULL,
  `nc_cliente` int(32) NOT NULL,
  `nc_descuendo` varchar(255) DEFAULT NULL,
  `nc_fecha` varchar(9) DEFAULT NULL,
  `nc_hora` time(6) NOT NULL,
  `nc_total` varchar(255) DEFAULT NULL,
  `nc_indicador` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`nc_codigo`),
  KEY `notacredito_nc_cliente_idx` (`nc_cliente`),
  KEY `notacredito_nc_factura_idx` (`nc_factura`),
  CONSTRAINT `notacredito_nc_cliente_fkey` FOREIGN KEY (`nc_cliente`) REFERENCES `clientes` (`cli_codigo`),
  CONSTRAINT `notacredito_nc_factura_fkey` FOREIGN KEY (`nc_factura`) REFERENCES `factura` (`fac_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `presupuesto`
-- ----------------------------
DROP TABLE IF EXISTS `presupuesto`;
CREATE TABLE `presupuesto` (
  `pre_codigo` int(32) NOT NULL,
  `pre_vendedor` int(32) NOT NULL,
  `pre_cliente` int(32) NOT NULL,
  `pre_descuento` varchar(255) DEFAULT NULL,
  `pre_tipopago` varchar(15) DEFAULT NULL,
  `pre_fecha` varchar(9) DEFAULT NULL,
  `pre_hora` time(6) NOT NULL,
  `pre_total` varchar(255) DEFAULT NULL,
  `pre_indicador` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`pre_codigo`),
  KEY `presupuesto_pre_cliente_idx` (`pre_cliente`),
  KEY `presupuesto_pre_vendedor_idx` (`pre_vendedor`),
  CONSTRAINT `presupuesto_pre_cliente_fkey` FOREIGN KEY (`pre_cliente`) REFERENCES `clientes` (`cli_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `proveedor`
-- ----------------------------
DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE `proveedor` (
  `pro_codigo` int(32) NOT NULL,
  `pro_razonsocial` varchar(50) DEFAULT NULL,
  `pro_ruc` varchar(11) DEFAULT NULL,
  `pro_contacto` varchar(30) DEFAULT NULL,
  `pro_celular` varchar(11) DEFAULT NULL,
  `pro_telefono` varchar(9) DEFAULT NULL,
  `pro_fax` varchar(8) DEFAULT NULL,
  `pro_direccion` varchar(50) DEFAULT NULL,
  `pro_provincia` int(32) NOT NULL,
  `pro_email` varchar(50) DEFAULT NULL,
  `pro_web` varchar(50) DEFAULT NULL,
  `pro_observacion` varchar(200) DEFAULT NULL,
  `pro_indicador` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`pro_codigo`),
  KEY `proveedor_pro_provincia_idx` (`pro_provincia`),
  CONSTRAINT `proveeedor_fkey` FOREIGN KEY (`pro_provincia`) REFERENCES `provincias` (`prv_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `provincias`
-- ----------------------------
DROP TABLE IF EXISTS `provincias`;
CREATE TABLE `provincias` (
  `prv_codigo` int(32) NOT NULL,
  `prv_nombre` varchar(15) DEFAULT NULL,
  `prv_indicador` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`prv_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `rubro`
-- ----------------------------
DROP TABLE IF EXISTS `rubro`;
CREATE TABLE `rubro` (
  `rub_codigo` int(32) NOT NULL,
  `rub_nombre` varchar(15) DEFAULT NULL,
  `rub_indicador` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`rub_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `salidas`
-- ----------------------------
DROP TABLE IF EXISTS `salidas`;
CREATE TABLE `salidas` (
  `sal_codigo` int(32) NOT NULL,
  `sal_fecha` varchar(9) DEFAULT NULL,
  `sal_hora` time(6) NOT NULL,
  `sal_monto` varchar(255) DEFAULT NULL,
  `sal_indicador` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`sal_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `stock`
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `sto_articulo` int(32) NOT NULL,
  `sto_cantidad` int(32) DEFAULT NULL,
  `sto_indicador` varchar(2) DEFAULT NULL,
  KEY `stock_sto_articulo_idx` (`sto_articulo`),
  CONSTRAINT `stock_sto_articulo_fkey` FOREIGN KEY (`sto_articulo`) REFERENCES `articulo` (`art_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `transporte`
-- ----------------------------
DROP TABLE IF EXISTS `transporte`;
CREATE TABLE `transporte` (
  `tra_codigo` int(32) NOT NULL,
  `tra_nombre` varchar(15) DEFAULT NULL,
  `tra_indicador` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`tra_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `unidad`
-- ----------------------------
DROP TABLE IF EXISTS `unidad`;
CREATE TABLE `unidad` (
  `uni_codigo` int(32) NOT NULL,
  `uni_nombre` varchar(15) DEFAULT NULL,
  `uni_indicador` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`uni_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `usuario`
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `usu_codigo` int(32) NOT NULL,
  `usu_nombre` varchar(30) DEFAULT NULL,
  `usu_perfil` longtext,
  `usu_usuario` varchar(50) DEFAULT NULL,
  `usu_password` varchar(50) DEFAULT NULL,
  `usu_indicador` varchar(2) DEFAULT NULL,
  `usu_ip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`usu_codigo`),
  KEY `usuario_usu_codigo_idx` (`usu_codigo`),
  CONSTRAINT `usuario_fkey_empleado` FOREIGN KEY (`usu_codigo`) REFERENCES `vendedor` (`ven_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `vendedor`
-- ----------------------------
DROP TABLE IF EXISTS `vendedor`;
CREATE TABLE `vendedor` (
  `ven_codigo` int(32) NOT NULL,
  `ven_nombre` varchar(50) DEFAULT NULL,
  `ven_direccion` varchar(40) DEFAULT NULL,
  `ven_telefono` varchar(9) DEFAULT NULL,
  `ven_celular` varchar(11) DEFAULT NULL,
  `ven_sueldo` varchar(255) DEFAULT NULL,
  `ven_provincia` int(32) NOT NULL,
  `ven_zona` int(32) NOT NULL,
  `ven_comision` varchar(255) DEFAULT NULL,
  `ven_email` varchar(40) DEFAULT NULL,
  `ven_observacion` varchar(200) NOT NULL,
  `ven_indicador` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`ven_codigo`),
  KEY `vendedor_ven_provincia_idx` (`ven_provincia`),
  KEY `vendedor_ven_zona_idx` (`ven_zona`),
  CONSTRAINT `vendedor_ven_provincia_fkey` FOREIGN KEY (`ven_provincia`) REFERENCES `provincias` (`prv_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `zona`
-- ----------------------------
DROP TABLE IF EXISTS `zona`;
CREATE TABLE `zona` (
  `zon_codigo` int(32) NOT NULL,
  `zon_nombre` varchar(15) DEFAULT NULL,
  `zon_indicador` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`zon_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records 
-- ----------------------------
INSERT INTO `accesos` VALUES ('1','1','JONATHAN M. LOPEZ','jlopez','Almacen','jlopez ingresó al sistema','Entrada','11/5/2014 19:02:44'), ('2','1','JONATHAN M. LOPEZ','jlopez','Almacen','jlopez salió del sistema','Salida','11/5/2014 19:03:01'), ('3','1','JONATHAN M. LOPEZ','jlopez','Administrador','jlopez ingresó al sistema','Entrada','11/5/2014 19:09:05'), ('4','1','JONATHAN M. LOPEZ','jlopez','Administrador','jlopez salió del sistema','Salida','11/5/2014 19:12:23'), ('5','1','JONATHAN M. LOPEZ','jlopez','Administrador','jlopez ingresó al sistema','Entrada','11/5/2014 19:19:43'), ('6','1','JONATHAN M. LOPEZ','jlopez','Administrador','jlopez salió del sistema','Salida','11/5/2014 19:23:16'), ('7','1','JONATHAN M. LOPEZ','jlopez','Administrador','jlopez ingresó al sistema','Entrada','11/5/2014 21:24:37'), ('8','1','JONATHAN M. LOPEZ','jlopez','Administrador','jlopez salió del sistema','Salida','11/5/2014 21:30:46'), ('9','2','NOELIA CALLE QUIROZ','ncalle','Venta','ncalle ingresó al sistema','Entrada','11/5/2014 21:55:04'), ('10','2','NOELIA CALLE QUIROZ','ncalle','Venta','ncalle salió del sistema','Salida','11/5/2014 21:59:08'), ('11','5','JENNIFER C. ASTON RAMOS','jaston','Venta','jaston ingresó al sistema','Entrada','11/5/2014 22:33:35'), ('12','5','JENNIFER C. ASTON RAMOS','jaston','Venta','jaston salió del sistema','Salida','11/5/2014 22:35:21'), ('13','6','GIANELLA R. GONZALES PRADA','ggonzales','Compra','ggonzales ingresó al sistema','Entrada','13/5/2014 07:06:51'), ('14','6','GIANELLA R. GONZALES PRADA','ggonzales','Compra','ggonzales salió del sistema','Salida','13/5/2014 07:09:10'), ('15','1','JONATHAN M. LOPEZ','jlopez','Administrador','jlopez ingresó al sistema','Entrada','14/5/2014 03:53:49'), ('16','1','JONATHAN M. LOPEZ','jlopez','Administrador','jlopez salió del sistema','Salida','14/5/2014 03:54:23'), ('17','2','NOELIA CALLE QUIROZ','ncalle','Compra','ncalle ingresó al sistema','Entrada','26/5/2014 05:21:23'), ('18','2','NOELIA CALLE QUIROZ','ncalle','Compra','ncalle salió del sistema','Salida','26/5/2014 05:23:40'), ('19','7','ANDRE PEÑALOZA DE SOUSA','apeñaloza','Administrador','apeñaloza ingresó al sistema','Entrada','26/5/2014 05:25:49'), ('20','7','ANDRE PEÑALOZA DE SOUSA','apeñaloza','Administrador','apeñaloza salió del sistema','Salida','26/5/2014 05:32:32'), ('21','1','JONATHAN M. LOPEZ','jlopez','Administrador','jlopez ingresó al sistema','Entrada','9/6/2014 04:00:31'), ('22','1','JONATHAN M. LOPEZ','jlopez','Administrador','jlopez salió del sistema','Salida','9/6/2014 04:02:07'), ('23','8','MARISOL CASTRO AGUIRRE','mcastro','Venta','mcastro ingresó al sistema','Entrada','18/6/2014 18:15:28'), ('24','8','MARISOL CASTRO AGUIRRE','mcastro','Venta','mcastro salió del sistema','Salida','18/6/2014 18:21:55'), ('25','1','JONATHAN M. LOPEZ','jlopez','Administrador','jlopez ingresó al sistema','Entrada','11/7/2014 19:57:49'), ('26','1','JONATHAN M. LOPEZ','jlopez','Administrador','jlopez salió del sistema','Salida','11/7/2014 20:01:01'), ('27','1','JONATHAN M. LOPEZ','jlopez','Administrador','jlopez ingresó al sistema','Entrada','13/7/2014 20:03:54'), ('28','1','JONATHAN M. LOPEZ','jlopez','Administrador','jlopez salió del sistema','Salida','14/7/2014 00:06:52'), ('29','2','NOELIA CALLE QUIROZ','ncalle','Compra','ncalle ingresó al sistema','Entrada','20/7/2014 03:48:23'), ('30','2','NOELIA CALLE QUIROZ','ncalle','Compra','ncalle salió del sistema','Salida','20/7/2014 03:53:06'), ('31','3','RAUL SANTOS GARLAND','rsantos','Almacen','rsantos ingresó al sistema','Entrada','20/7/2014 03:54:30'), ('32','3','RAUL SANTOS GARLAND','rsantos','Almacen','rsantos salió del sistema','Salida','20/7/2014 03:57:29'), ('33','7','ANDRE PEÑALOZA DE SOUSA','apeñaloza','Administrador','apeñaloza ingresó al sistema','Entrada','22/8/2014 20:32:40'), ('34','7','ANDRE PEÑALOZA DE SOUSA','apeñaloza','Administrador','apeñaloza salió del sistema','Salida','22/8/2014 20:35:42'), ('35','6','GIANELLA R. GONZALES PRADA','ggonzales','Venta','ggonzales ingresó al sistema','Entrada','22/8/2014 20:40:09'), ('36','6','GIANELLA R. GONZALES PRADA','ggonzales','Venta','ggonzales salió del sistema','Salida','22/8/2014 20:40:31'), ('37','1','JONATHAN M. LOPEZ','jlopez','Administrador','jlopez ingresó al sistema','Entrada','22/8/2014 22:10:13'), ('38','1','JONATHAN M. LOPEZ','jlopez','Administrador','jlopez salió del sistema','Salida','22/8/2014 22:17:02'), ('39','2','NOELIA CALLE QUIROZ','ncalle','Compra','ncalle ingresó al sistema','Entrada','23/8/2014 22:45:58'), ('40','2','NOELIA CALLE QUIROZ','ncalle','Compra','ncalle salió del sistema','Salida','23/8/2014 22:49:41'), ('41','6','GIANELLA R. GONZALES PRADA','ggonzales','Venta','ggonzales ingresó al sistema','Entrada','24/8/2014 22:49:40'), ('42','6','GIANELLA R. GONZALES PRADA','ggonzales','Venta','ggonzales salió del sistema','Salida','24/8/2014 22:57:01'), ('43','1','JONATHAN M. LOPEZ','jlopez','Administrador','jlopez ingresó al sistema','Entrada','27/8/2014 00:24:31'), ('44','1','JONATHAN M. LOPEZ','jlopez','Administrador','jlopez salió del sistema','Salida','27/8/2014 00:32:54'), ('45','1','JONATHAN M. LOPEZ','jlopez','Administrador','jlopez ingresó al sistema','Entrada','27/8/2014 00:34:24'), ('46','1','JONATHAN M. LOPEZ','jlopez','Administrador','jlopez salió del sistema','Salida','27/8/2014 00:48:27'), ('47','9','PRUEBA','prueba','Administrador','prueba ingresó al sistema','Entrada','27/8/2014 00:49:02'), ('48','9','PRUEBA','prueba','Administrador','prueba salió del sistema','Salida','27/8/2014 00:52:18'), ('49','1','JONATHAN M. LOPEZ','jlopez','Administrador','jlopez ingresó al sistema','Entrada','31/8/2014 18:37:54'), ('50','1','JONATHAN M. LOPEZ','jlopez','Administrador','jlopez salió del sistema','Salida','31/8/2014 18:39:44'), ('51','1','JONATHAN M. LOPEZ','jlopez','Administrador','jlopez ingresó al sistema','Entrada','26/9/2014 04:03:29'), ('52','1','JONATHAN M. LOPEZ','jlopez','Administrador','jlopez salió del sistema','Salida','26/9/2014 04:23:12'), ('53','3','RAUL SANTOS GARLAND','rsantos','Almacen','rsantos ingresó al sistema','Entrada','30/9/2014 06:49:50'), ('54','3','RAUL SANTOS GARLAND','rsantos','Almacen','rsantos salió del sistema','Salida','30/9/2014 06:58:07'), ('55','7','ANDRE PEÑALOZA DE SOUSA','apeñaloza','Administrador','apeñaloza ingresó al sistema','Entrada','30/9/2014 06:58:57'), ('56','7','ANDRE PEÑALOZA DE SOUSA','apeñaloza','Administrador','apeñaloza salió del sistema','Salida','30/9/2014 07:11:18'), ('57','3','RAUL SANTOS GARLAND','rsantos','Almacen','rsantos ingresó al sistema','Entrada','6/10/2014 04:31:51'), ('58','3','RAUL SANTOS GARLAND','rsantos','Almacen','rsantos salió del sistema','Salida','6/10/2014 04:42:10'), ('59','9','JOSE IZQUIERDO MORALES','joseim','Venta','joseim ingresó al sistema','Entrada','6/10/2014 05:48:36'), ('60','9','JOSE IZQUIERDO MORALES','joseim','Venta','joseim salió del sistema','Salida','6/10/2014 05:54:10'), ('61','7','ANDRE PEÑALOZA DE SOUSA','apeñaloza','Administrador','apeñaloza ingresó al sistema','Entrada','9/10/2014 06:25:49'), ('62','7','ANDRE PEÑALOZA DE SOUSA','apeñaloza','Administrador','apeñaloza salió del sistema','Salida','9/10/2014 06:46:08'), ('63','9','JOSE IZQUIERDO MORALES','joseim','Venta','joseim ingresó al sistema','Entrada','12/10/2014 22:29:40'), ('64','9','JOSE IZQUIERDO MORALES','joseim','Venta','joseim salió del sistema','Salida','12/10/2014 22:36:06'), ('65','1','JONATHAN M. LOPEZ','jlopez','Administrador','jlopez ingresó al sistema','Entrada','12/10/2014 22:38:00'), ('66','1','JONATHAN M. LOPEZ','jlopez','Administrador','jlopez salió del sistema','Salida','12/10/2014 22:41:25'), ('67','10','ESTEVAN RAMIREZ SALCEDO','eramirez','Almacen','eramirez ingresó al sistema','Entrada','12/10/2014 22:41:35'), ('68','10','ESTEVAN RAMIREZ SALCEDO','eramirez','Almacen','eramirez salió del sistema','Salida','13/10/2014 00:45:56'), ('69','1','JONATHAN M. LOPEZ','jlopez','Administrador','jlopez ingresó al sistema','Entrada','26/10/2014 05:55:16'), ('70','1','JONATHAN M. LOPEZ','jlopez','Administrador','jlopez salió del sistema','Salida','26/10/2014 06:02:59'), ('71','9','JOSE IZQUIERDO MORALES','joseim','Venta','joseim ingresó al sistema','Entrada','2/11/2014 02:25:18'), ('72','9','JOSE IZQUIERDO MORALES','joseim','Venta','joseim salió del sistema','Salida','2/11/2014 02:33:41'), ('73','1','JONATHAN M. LOPEZ','jlopez','Administrador','jlopez ingresó al sistema','Entrada','2014-11-04 17:40:26'), ('74','1','JONATHAN M. LOPEZ','jlopez','Administrador','jlopez salió del sistema','Salida','2014-11-04 17:49:11'), ('75','7','ANDRE PEÑALOZA DE SOUSA','apeñaloza','Administrador','apeñaloza ingresó al sistema','Entrada','2014-11-06 00:26:09'), ('76','7','ANDRE PEÑALOZA DE SOUSA','apeñaloza','Administrador','apeñaloza salió del sistema','Salida','2014-11-06 00:40:01'), ('77','2','NOELIA CALLE QUIROZ','ncalle','Compra','ncalle ingresó al sistema','Entrada','2014-11-06 16:21:22'), ('78','2','NOELIA CALLE QUIROZ','ncalle','Compra','ncalle salió del sistema','Salida','2014-11-06 16:28:15'), ('79','9','JOSE IZQUIERDO MORALES','joseim','Venta','joseim ingresó al sistema','Entrada','2014-11-06 23:34:27'), ('80','9','JOSE IZQUIERDO MORALES','joseim','Venta','joseim salió del sistema','Salida','2014-11-06 23:48:55'), ('81','8','MARISOL CASTRO AGUIRRE','mcastro','Venta','mcastro ingresó al sistema','Entrada','2014-11-07 11:07:21'), ('82','8','MARISOL CASTRO AGUIRRE','mcastro','Venta','mcastro salió del sistema','Salida','2014-11-07 11:16:48'), ('83','1','JONATHAN M. LOPEZ','jlopez','Administrador','jlopez ingresó al sistema','Entrada','2014-11-07 23:44:02'), ('84','1','JONATHAN M. LOPEZ','jlopez','Administrador','jlopez salió del sistema','Salida','2014-11-07 23:49:37'), ('85','3','RAUL SANTOS GARLAND','rsantos','Almacen','rsantos ingresó al sistema','Entrada','2014-11-08 10:34:44'), ('86','3','RAUL SANTOS GARLAND','rsantos','Almacen','rsantos salió del sistema','Salida','2014-11-08 10:39:54'), ('87','6','GIANELLA R. GONZALES PRADA','ggonzales','Venta','ggonzales ingresó al sistema','Entrada','2014-11-08 10:42:50'), ('88','6','GIANELLA R. GONZALES PRADA','ggonzales','Venta','ggonzales salió del sistema','Salida','2014-11-08 10:52:53'), ('89','5','JENNIFER C. ASTON RAMOS','jaston','Venta','jaston ingresó al sistema','Entrada','2014-11-08 23:15:05'), ('90','5','JENNIFER C. ASTON RAMOS','jaston','Venta','jaston salió del sistema','Salida','2014-11-08 23:29:20'), ('91','1','JONATHAN M. LOPEZ','jlopez','Administrador','jlopez ingresó al sistema','Entrada','2014-11-08 23:29:30'), ('92','1','JONATHAN M. LOPEZ','jlopez','Administrador','jlopez salió del sistema','Salida','2014-11-08 23:37:10'), ('93','9','JOSE IZQUIERDO MORALES','joseim','Venta','joseim ingresó al sistema','Entrada','2014-11-09 11:12:38'), ('94','9','JOSE IZQUIERDO MORALES','joseim','Venta','joseim salió del sistema','Salida','2014-11-09 11:18:39'), ('95','7','ANDRE PEÑALOZA DE SOUSA','apeñaloza','Administrador','apeñaloza ingresó al sistema','Entrada','2014-11-09 17:04:59'), ('96','7','ANDRE PEÑALOZA DE SOUSA','apeñaloza','Administrador','apeñaloza salió del sistema','Salida','2014-11-09 17:17:26'), ('97','2','NOELIA CALLE QUIROZ','ncalle','Compra','ncalle ingresó al sistema','Entrada','2014-11-09 22:18:27'), ('98','2','NOELIA CALLE QUIROZ','ncalle','Compra','ncalle salió del sistema','Salida','2014-11-09 22:24:07'), ('99','8','MARISOL CASTRO AGUIRRE','mcastro','Venta','mcastro ingresó al sistema','Entrada','2014-11-10 11:10:41'), ('100','8','MARISOL CASTRO AGUIRRE','mcastro','Venta','mcastro salió del sistema','Salida','2014-11-10 11:13:51');
INSERT INTO `articulo` VALUES ('1','PASADOR PARA CARPINTERO PALANCA DE BRONC','1','1','42.00','40.00','0.00','45.00','2014-11-04','1','1','129','S'), ('2','PASADOR PARA CARPINTERO PALANCA DE PLATA','4','6','313.00','300.00','0.00','306.00','2014-10-06','3','5','229','S'), ('3','PASADOR PARA HERRERO PALANCA DE BRONCE 1','4','8','584.00','575.00','0.00','581.00','2014-11-09','2','4','68','S'), ('4','PASADOR PARA HERRERO PALANCA DE BRONCE 2','2','7','233.00','230.00','0.00','236.00','2014-04-24','3','5','108','S'), ('5','PERILLA CHICA PARA BISAGRA','4','8','33.00','27.00','0.00','33.00','2014-04-24','1','2','517','S'), ('6','PERILLA GRANDE PARA BISAGRA','3','3','86.00','85.00','0.00','91.00','2014-05-15','2','2','111','S'), ('7','PERNO PARA BISAGRA 100','1','5','323.00','320.00','0.00','326.00','2014-06-19','3','5','414','S'), ('8','PERNO PARA BISAGRA 124','3','4','343.00','335.00','0.00','341.00','2014-04-24','1','2','425','S'), ('9','PERNO PARA BISAGRA 145','4','6','67.00','55.00','0.00','61.00','2014-04-24','2','3','641','S'), ('10','PERNO PARA BISAGRA 175','2','7','323.00','325.00','0.00','331.00','2014-04-24','3','1','116','S'), ('11','PERNO PARA BISAGRA 78','3','8','42.00','40.00','0.00','46.00','2014-04-24','1','5','520','S'), ('12','PUÑO FIJO CON CHAPON BRONCE PLATIL','3','5','32.00','28.00','0.00','34.00','2014-05-15','2','2','50','S'), ('13','PUÑO FIJO CON CHAPON DON ARAGON BRONCE','2','3','223.00','220.00','0.00','226.00','2014-04-24','3','3','653','S'), ('14','PUÑO GIRATORIA CON CHAPON DON ARAGON BRO','1','1','554.00','250.00','0.00','256.00','2014-04-24','3','2','665','S'), ('15','PUÑO GIRATORIA CON CHAPON DON ARAGON BRO','4','2','333.00','325.00','0.00','331.00','2014-04-24','3','5','619','S'), ('16','RULEMAN PARA BISAGRA BRONCE CHICO 18','3','4','46.00','40.00','0.00','46.00','2014-04-24','2','1','340','S'), ('17','RULEMAN PARA BISAGRA BRONCE GRANDE 21','2','6','586.00','580.00','0.00','586.00','2014-04-24','1','3','724','S'), ('18','RULEMAN PARA BISAGRA CHICO 18MM','1','7','765.00','760.00','0.00','766.00','2014-04-24','1','4','152','S'), ('19','RULEMAN PARA BISAGRA GRANDE 21MM','3','8','322.00','320.00','0.00','326.00','2014-04-24','2','5','731','S'), ('20','SOPORTE PARA ESTANTE BLANCO 75X100','4','6','243.00','240.00','0.00','246.00','2014-11-09','3','3','98','S'), ('21','TACHAS BRONCEADAS','2','3','355.00','350.00','0.00','356.00','2014-04-24','3','2','731','S'), ('22','TACHAS NIQUELADAS','3','2','78.00','75.00','0.00','81.00','2014-08-24','1','1','100','S'), ('23','TANQUE  NAFTA  AUTO RE-12 SALIDA H/BAUL','4','4','534.00','530.00','0.00','536.00','2014-04-24','1','5','421','S'), ('24','TORNILLO DE BRONCE 17X17 GOTA SEBO','2','5','54.00','50.00','0.00','56.00','2014-04-24','2','3','208','S'), ('25','TORNILLO DE BRONCE 20X20 GOTA SEBO','3','4','23.00','20.00','0.00','26.00','2014-04-24','3','2','424','S'), ('26','TUERCA DE BRONCE ESTAMPADAS 1/4','4','9','24.00','21.00','0.00','27.00','2014-05-15','3','3','105','S'), ('27','TUERCA DE BRONCE ESTAMPADAS 5/32','2','3','32.00','28.00','0.00','34.00','2014-04-24','1','5','134','S'), ('28','TUERCA Y ESPARRAGO DE SEGURIDAD','3','1','234.00','230.00','0.00','236.00','2014-04-24','1','2','430','S'), ('29','PERNO PARA BISAGRA 78','3','2','134.00','130.00','0.00','136.00','2014-07-19','2','3','150','S'), ('30','PINCEL TODO USO CERDA NEGRA 2.1/2','2','1','334.00','220.00','0.00','226.00','2014-04-24','3','4','239','S'), ('31','ARANDELA DE COBRE 24','4','3','343.00','240.00','0.00','246.00','2014-04-24','3','5','407','S'), ('32','ARANDELA DE COBRE 8','1','6','34.00','29.00','0.00','35.00','2014-05-15','2','4','218','S'), ('33','ARANDELA DE FIBRA 24','2','6','54.00','38.00','0.00','44.00','2014-04-24','1','3','123','S'), ('34','ARANDELA DE FIBRA 8','2','5','86.00','80.00','0.00','86.00','2014-05-15','2','4','43','S'), ('35','DISCO DIAMANTADO LASER LS-AB ECONOMY 4','3','6','543.00','540.00','0.00','546.00','2014-04-24','3','2','224','S'), ('36','DISCO DIAMANTADO LASER LS ECONOMY 9','2','4','323.00','320.00','0.00','326.00','2014-04-24','1','5','243','S'), ('37','MARIPOSA DE BRONCE MACHO 3/8X1','4','2','233.00','230.00','0.00','236.00','2014-04-24','2','3','259','S'), ('38','PASADOR CON TRABA POSICION EMPAVONADO 35','2','4','325.00','320.00','0.00','326.00','2014-04-24','3','4','216','S'), ('39','PASADOR DE EMBUTIR C/CAJA','2','6','333.00','331.00','0.00','337.00','2014-04-24','2','1','231','S'), ('40','PASADOR PARA CARPINTERO PALANCA DE BRONC','4','5','233.00','321.00','0.00','327.00','2014-07-19','1','1','60','S'), ('41','ACEITE ENV.TAMBOR  SUPERDIESEL 15W40 T20','2','4','629.00','626.00','0.00','632.00','2014-04-24','3','5','254','S'), ('42','AGRO 3M X 200MIC','3','3','554.00','550.00','0.00','556.00','2014-04-24','2','3','736','S'), ('43','AGRO 4M X 200MIC','3','4','291.00','281.00','0.00','287.00','2014-04-24','1','4','249','S'), ('44','AGRO 6M X 200MIC','2','6','385.00','380.00','0.00','386.00','2014-04-24','2','4','87','S'), ('45','ARANDELA DE ALUMINIO 12','4','7','496.00','480.00','0.00','486.00','2014-05-15','3','2','220','S'), ('46','ARANDELA DE ALUMINIO 24','2','3','271.00','265.00','0.00','271.00','2014-08-24','2','5','482','S'), ('47','ARANDELA DE ALUMINIO 4','4','7','328.00','325.00','0.00','331.00','2014-04-24','1','3','735','S'), ('48','ARANDELA DE BRONCE 3/8','3','4','138.00','130.00','0.00','136.00','2014-04-24','2','3','223','S'), ('49','PRISIONERO PARA MANIJA GIRATORIA','4','4','348.00','340.00','0.00','346.00','2014-04-24','2','4','224','S'), ('50','PRISIONERO PARA PERNO FLOTANTE','3','5','128.00','115.00','0.00','121.00','2014-04-24','1','3','327','S'), ('51','PUÑO DOBLE BALANCIN CON CHAPON DON ARAGO','3','5','450.00','435.00','0.00','441.00','2014-04-24','2','5','214','S'), ('52','ABRAZADERA STANDART 110 X 130 BANDA 9MM','5','9','11.86','11.76','12.26','11.76','2014-05-20','4','5','228','S'), ('53','ACOPLE COMPLETO A BOLILLA 1/2','7','6','14.50','14.40','14.90','14.40','2014-05-20','4','5','220','S'), ('54','ADAPTADOR P/BAYONETAS','9','3','26.02','25.92','26.42','25.92','2014-10-05','4','3','116','S'), ('55','AMOLADORA 1/2 HP HP. ECONOMICA ','8','5','232.85','232.75','233.25','232.75','2014-05-20','4','4','130','S'), ('56','ANTIPARRA PVC UCU 321B','5','7','10.77','10.67','11.17','10.67','2014-05-20','4','6','136','S'), ('57','BASE GIRATORIA P/MORSA NR-4','6','8','12.58','12.48','12.98','12.48','2014-05-20','4','6','127','S'), ('58','CABLE DE ACERO 6X7 MM','8','1','31.72','31.62','32.12','31.62','2014-05-20','1','3','103','S'), ('59','CADENA ESLABON DERECHO N 30','5','6','63.75','63.65','64.15','63.65','2014-05-25','1','3','144','S'), ('60','CANDADO N 30 DOBLE TRABA BRONCE','5','10','70.41','70.31','70.81','70.31','2014-05-20','4','3','186','S'), ('61','ROLLO DE CABLE DE COBRE','5','1','282.58','282.48','282.98','282.48','2014-09-29','1','9','893','S'), ('62','ARGOLLAS PLASTICAS 30CM','9','2','43.30','43.20','43.70','43.20','2014-10-05','1','2','679','S'), ('63','CREMALLERA METALICA','8','1','119.70','119.60','120.10','119.60','2014-10-05','4','5','425','S'), ('64','TELA ALGODON MALLA','9','1','161.20','161.10','161.60','161.10','2014-10-05','2','10','986','S'), ('65','GRADUADOR PROFESIONAL FABER','8','1','81.57','81.47','81.97','81.47','2014-10-05','4','4','791','S'), ('66','CABLE AUDIO BLANCO/GRIS 2X0.75','9','7','63.66','63.56','64.06','63.56','2014-10-05','1','9','1982','S'), ('67','CABLE COAXIAL ANTENA TV ECONOMICA 5M','9','7','60.15','60.05','60.55','60.05','2014-11-06','1','9','59','S'), ('68','ADAPTADOR 10-16A C/TT 1303-3 TOMAS','9','1','12.48','12.38','12.88','12.38','2014-10-05','4','9','775','S'), ('69','ADAPTADOR 10A 1206-2 T+LUZ','9','8','11.14','11.04','11.54','11.04','2014-10-05','4','9','764','S'), ('70','CLAVIJA BIPOLAR GOMA 16A 1133 NEGRO','9','8','14.64','14.54','15.04','14.54','2014-10-05','4','9','773','S'), ('71','ABRELATAS DE TENAZAS','9','7','41.50','41.40','41.90','41.40','2014-10-12','4','5','989','S'), ('72','ABRELATAS EXPLORADOR','9','1','38.74','38.64','39.14','38.64','2014-10-12','4','6','971','S'), ('73','ABRELATAS GIRATORIO','9','1','48.04','47.94','48.44','47.94','2014-10-12','4','6','953','S');
INSERT INTO `categcompra` VALUES ('1','INSUMOS','S'), ('2','OTROS','S');
INSERT INTO `clientes` VALUES ('1','INDUSTRIAS TONINO','JOSE','4','5485018','893527492','1923','1','9217239827','1200.00','CALLE 5 MZ. E LT. 4 URB. EL NARANJITO - P. PIEDRA','informes@tonico.com','www.tonino-peru.com','2','1','1','11.0','EFECTIVO','CLIENTE EXIGENTE','S'), ('2','REPRESENTACIONES CENTER S.A.','JUAQUIN','3','3264400','939987238','9019','5','1927491274','1200.00','AVENID SALAVERRY, 206 URB. EL PINO - SAN LUIS','informes@alumniocenter.compe','www.aluminiocenter.com.pe','2','1','1','11.00','TARJETA','CLIENTE EXIGENTE','S'), ('3','JR STEEL COMPANY S.A.C','RAFAEL','6','3432987','897283490','9021','1','9072140820','1400.00','PARINACOCHAS, 940','informes@jrsteelcompany.com','www.jrsteelcompany.com','3','1','5','12.00','EFECTIVO','CLIENTE LEJANO','S'), ('4','COMERCIAL DEL ACERO - SUCURSAL DE EL CERCADO','ESTEVAN','6','4332543','892423223','1231','3','7453646343','1250.00','AVENIDA ARGENTINA, 2017 2051 - C. LIMA','informes@comasa.com.pe','www.comasa.com.pe','2','1','5','9.00','TARJETA','CLIENTE MOROSO','S'), ('5','AFIDERSA S. A. C.','XIMENA','8','8305472','984533453','2341','5','3645757657','1500.00','AVENIDA HUAROCHIRI MZ. C LT. 17, SANTA ANITA','informes@acerofidersa.com','www.acerosafidersa.com','2','1','3','15.0','EFECTIVO','NINGUNA','S'), ('6','JAHESA - SUCURSAL DE CERCADO CALLAO','ROXANA','1','4645701','745346346','1232','6','5234253464','1300.00','CALLE LAMBDA, 180','informes@jahesa.com','www.jahesa.com','3','2','4','12.00','TARJETA','NINGUNA','S'), ('7','ANGULOS RANURADOS ESTILOS Y DISEÑOS S.R.L.','PABLO','1','4714562','898675678','2311','5','8658363464','1250.00','AVENIDA JOSÉ PARDO DE ZELA, 807','informes@angulosred.com','www.angulosred.com','2','1','4','6.00','TARJETA','NINGUNA','S'), ('8','IMEGUEZA - SUCURSAL DE PUENTE PIEDRA','CARLOS','4','5502066','979863247','9812','5','9817293901','1400.00','MZ. A3 LT. 3 AS. ALAMEDA DEL NORTE','informes@imeguezaperu.com','www.imeguezaperu.com','2','1','1','12.00','TARJETA','NINGUNA','S'), ('9','POLINSUMOS - SUCURSAL DE LURÍN','URSULA','1','5132930','643647475','2143','2','7547456454','1250.00','CALLE LOS FRESNOS - LURIN','informes@polinsumos.com','www.polinsumos.com','1','1','2','11.00','TARJETA','NINGUNA','S'), ('10','Q PLAST S.A.C.','JORGE','1','6473828','892667477','2488','2','1084932904','1350.00','AVENIDA MARISCAL OSCAR R. BENAVIDES, 643 C. LIMA','informes@aplasticos.com','www.aplasticos.com','3','2','5','10.00','EFECTIVO','NINGUNA','S'), ('11','FUMINSUMOS S.A.','RAUL','8','2398392','939279787','1298','8','2384989823','14550.00','AV. BRAZIL CALLE 34','fuminsumos@gmail.com','www.fuminsumos.com','2','1','3','12.00','TARJETA','','S'), ('12','INVERSIONES YORDAN','JONATHAN','1','2342354','828783398','8797','6','3257932042','1000.00','LOS FALCONES CALLE 23. SMP','informes@inver-yordan.com','','1','1','1','0.00','EFECTIVO','','S'), ('13','ELECTRO INDUSTRIAS S.A.C','JOSE','9','6876878','998847737','9238','9','9892432453','2000.00','AV. ENCALADA 234 - LURIN','electroindustrias@gmail.com','','4','1','2','12.00','EFECTIVO','','S'), ('14','DE VICENTE CONSTRUCTORA S.A.C','MARIA','1','4164801','','2398','3','1029487598','2000.00','AV. COSTANERA 2650 - SAN MIGUEL','informes@dvc.com.pe','www.dvc.com.pe','4','1','3','15.00','EFECTIVO','EMPRESA CON EXPERIENCIA EN EDIFICACIONES.','S'), ('15','ARQUIZIONE','ESTEVAN','4','7245558','','2309','1','9298349199','35000.00','CALLE JUAN ALFARO 195 - MIRAFLORES','consultas@arquizione.com','www.arquizione.com ','3','1','4','12.00','EFECTIVO','LA COMPAÑÍA CUENTA CON UNA SÓLIDA EXPERIENCIA EN LOS CAMPOS DEL DISEÑO ARQUITECTÓNICO','S'), ('16','ABYSEM S.A.C.','MANUEL','5','5985589','','','8','9234875854','2000.00','BELLAVISTA CALLAO CALLE 2','www.abysemsac.com','informes@abysem.com','3','2','4','10.0','EFECTIVO','NINGUNA','S'), ('17','COMERCIAL MIRLO S.A.C','ISABEL','7','0','998194180','','4','8732738172','1500.00','JIRON AZANGARO 977 - CERCADO LIMA','','','2','1','5','12.0','EFECTIVO','','S');
INSERT INTO `compras` VALUES ('1','5','2','CHEQUE','03/05/14','20:13:51.000000','4268.00','S'), ('2','6','1','CHEQUE','02/05/14','23:42:12.000000','1076.00','S'), ('3','3','1','CUENTA CORRIENTE','09/05/14','00:08:23.000000','3629.00','S'), ('4','1','2','CUENTA CORRIENTE','12/05/14','23:45:26.000000','1722.00','S'), ('5','8','2','TARJETA','13/05/14','00:08:13.000000','1695.00','S'), ('6','4','2','CUENTA CORRIENTE','13/05/14','23:49:26.000000','4766.00','S'), ('7','2','2','EFECTIVO','15/05/14','18:39:04.000000','4208.00','S'), ('8','7','2','TARJETA','17/05/14','22:40:21.000000','2205.00','S'), ('9','9','2','CHEQUE','20/05/14','00:36:03.000000','2667.00','S'), ('10','10','2','EFECTIVO','20/05/14','00:36:54.000000','2316.00','S'), ('11','4','2','CUENTA CORRIENTE','25/05/14','22:22:53.000000','976.94','S'), ('12','9','2','CUENTA CORRIENTE','19/07/14','20:49:19.000000','2114.82','S'), ('13','3','1','CHEQUE','19/07/14','20:52:04.000000','1776.00','S'), ('14','6','2','EFECTIVO','23/08/14','15:46:29.000000','1970.00','S'), ('15','8','2','CHEQUE','26/08/14','17:28:39.000000','2027.00','S'), ('16','12','2','EFECTIVO','25/10/14','23:57:45.000000','3034.00','S'), ('17','13','2','EFECTIVO','04/11/14','17:45:48.000000','5643.32','S'), ('18','11','2','EFECTIVO','06/11/14','16:22:30.000000','1745.06','S'), ('19','14','1','TARJETA','06/11/14','16:26:40.000000','5437.00','S'), ('20','12','2','EFECTIVO','07/11/14','23:47:03.000000','9196.00','S'), ('21','10','1','EFECTIVO','09/11/14','22:20:05.000000','2760.23','S'), ('22','13','2','EFECTIVO','09/11/14','22:23:25.000000','3091.56','S');
INSERT INTO `detallenotacredito` VALUES ('1','7','2','323','646'), ('1','10','3','320','960'), ('1','17','3','580','1740'), ('1','23','1','530','530'), ('1','38','3','325','975'), ('1','46','2','271','542'), ('2','7','1','323','323'), ('2','17','3','586','1758'), ('2','42','4','554','2216'), ('3','7','2','323','646'), ('3','10','2','323','646'), ('3','15','2','333','666'), ('3','23','3','530','1590'), ('3','38','2','325','650'), ('4','8','2','343','686'), ('4','34','2','84','168'), ('4','40','2','233','466'), ('4','43','1','291','291'), ('5','38','2','325','650'), ('5','45','2','490','980'), ('5','50','1','128','128'), ('5','51','2','450','900'), ('6','1','1','42','42'), ('6','2','1','313','313'), ('6','49','2','348','696'), ('6','50','2','128','256'), ('7','3','3','584','1752'), ('7','8','2','343','686'), ('7','22','2','78','156'), ('7','33','2','54','108'), ('7','47','3','328','984'), ('8','2','4','313','1252'), ('8','43','2','291','582'), ('8','53','4','15','58'), ('9','27','6','32','192'), ('9','38','6','325','1950'), ('9','63','6','120','718.2'), ('9','68','6','12','74.88'), ('9','69','6','11','66.84'), ('9','70','6','15','87.84'), ('10','19','4','322','1288'), ('10','28','3','234','702'), ('10','56','5','11','53.85'), ('10','73','3','48','144.12'), ('11','24','5','54','270'), ('11','68','5','12','62.4'), ('11','73','3','48','144.12'), ('11','22','2','78','156');
INSERT INTO `detalle_compras` VALUES ('1','10','4','42','168'), ('2','14','4','313','1252'), ('3','4','2','584','1168'), ('4','2','2','233','466'), ('4','8','2','233','466'), ('5','7','2','33','66'), ('5','8','5','33','165'), ('5','9','2','33','66'), ('6','6','2','86','172'), ('6','10','4','86','344'), ('7','1','2','323','646'), ('7','5','2','323','646'), ('7','9','2','323','646'), ('8','16','4','343','1372'), ('9','10','2','67','134'), ('11','1','1','42','42'), ('13','2','2','223','446'), ('13','12','2','223','446'), ('17','6','3','586','1758'), ('17','7','4','586','2344'), ('18','7','2','765','1530'), ('22','12','2','78','156'), ('24','4','1','54','54'), ('26','2','4','24','96'), ('29','7','2','134','268'), ('29','8','4','134','536'), ('29','9','1','134','134'), ('29','13','2','134','268'), ('29','15','3','134','402'), ('31','3','1','343','343'), ('31','10','2','343','686'), ('31','12','4','343','1372'), ('31','13','1','343','343'), ('32','2','2','34','68'), ('32','4','1','34','34'), ('32','11','4','34','136'), ('32','14','2','34','68'), ('37','4','2','233','466'), ('37','13','5','233','1165'), ('38','1','2','325','650'), ('38','5','2','325','650'), ('38','14','2','325','650'), ('38','15','5','325','1625'), ('39','11','2','333','666'), ('40','9','2','233','466'), ('41','1','4','629','2516'), ('41','3','4','629','2516'), ('44','3','2','385','770'), ('44','6','4','385','1540'), ('46','5','1','271','271'), ('46','9','5','271','1355'), ('47','6','2','328','656'), ('47','10','3','328','984'), ('48','1','3','138','414'), ('48','8','1','138','138'), ('49','16','4','348','1392'), ('50','5','1','128','128'), ('50','6','5','128','640'), ('51','8','2','450','900'), ('52','11','4','11.86','47.44'), ('59','11','2','63.75','127.5'), ('60','12','2','70.41','140.82'), ('70','16','2','14.64','29.28'), ('71','16','3','41.5','124.5'), ('72','16','3','38.74','116.22'), ('42','17','5','554','2770'), ('37','17','6','233','1398'), ('72','17','6','38.74','232.44'), ('3','17','2','584','1168'), ('68','17','6','12.48','74.88'), ('72','18','5','38.74','193.7'), ('71','18','2','41.5','83'), ('16','18','5','46','230'), ('73','18','6','48.04','288.24'), ('46','18','3','271','813'), ('53','18','5','14.5','72.5'), ('56','18','6','10.77','64.62'), ('6','19','6','86','516'), ('41','19','6','629','3774'), ('27','19','2','32','64'), ('1','19','5','42','210'), ('43','19','3','291','873'), ('37','20','4','233','932'), ('45','20','2','496','992'), ('3','20','5','584','2920'), ('18','20','4','765','3060'), ('36','20','4','323','1292'), ('4','21','4','233','932'), ('29','21','6','134','804'), ('46','21','3','271','813'), ('60','21','3','70.41','211.23'), ('23','22','3','534','1602'), ('48','22','2','138','276'), ('70','22','4','14.64','58.56'), ('44','22','3','385','1155');
INSERT INTO `detalle_factura` VALUES ('1','7','1','323','323'), ('1','17','3','586','1758'), ('1','42','2','554','1108'), ('2','7','4','323','1292'), ('2','10','2','323','646'), ('2','15','2','333','666'), ('2','23','3','534','1602'), ('2','38','1','325','325'), ('3','7','2','323','646'), ('3','10','3','323','969'), ('3','17','3','586','1758'), ('3','23','1','530','530'), ('3','38','3','325','975'), ('3','46','2','271','542'), ('4','25','4','23','92'), ('4','40','2','233','466'), ('4','43','2','291','582'), ('5','14','2','554','1108'), ('5','23','2','534','1068'), ('5','32','2','34','68'), ('5','49','2','348','696'), ('6','2','2','313','626'), ('6','45','2','496','992'), ('6','50','1','128','128'), ('6','51','3','450','1350'), ('7','1','2','42','84'), ('7','14','2','554','1108'), ('7','48','2','138','276'), ('7','49','1','348','348'), ('8','1','1','42','42'), ('8','2','2','313','626'), ('8','22','2','78','156'), ('8','49','1','348','348'), ('8','50','2','128','256'), ('9','1','2','42','84'), ('9','29','2','134','268'), ('9','32','2','34','68'), ('9','49','1','348','348'), ('10','8','2','343','686'), ('10','34','2','86','172'), ('10','40','2','233','466'), ('10','43','2','291','582'), ('11','6','2','86','172'), ('11','44','2','385','770'), ('11','45','2','496','992'), ('12','2','2','313','626'), ('12','3','2','584','1168'), ('12','21','2','355','710'), ('12','33','3','54','162'), ('12','50','1','128','128'), ('13','1','3','42','126'), ('13','6','2','86','172'), ('13','39','3','333','999'), ('13','46','2','271','542'), ('13','50','1','128','128'), ('14','3','3','584','1752'), ('14','8','2','343','686'), ('14','22','2','78','156'), ('14','33','5','54','270'), ('14','47','4','328','1312'), ('15','6','2','86','172'), ('15','10','3','323','969'), ('15','23','2','534','1068'), ('15','29','2','134','268'), ('16','28','2','234','468'), ('16','47','4','328','1312'), ('16','49','4','348','1392'), ('16','58','2','31.72','63.44'), ('17','14','3','554','1662'), ('17','49','4','348','1392'), ('17','58','2','31.72','63.44'), ('17','59','1','63.75','63.75'), ('18','1','5','42','210'), ('18','21','2','355','710'), ('18','45','4','496','1984'), ('18','50','2','128','256'), ('18','59','2','63.75','127.5'), ('18','60','4','70.41','281.64'), ('19','5','3','33','99'), ('19','25','1','23','23'), ('19','38','2','325','650'), ('20','5','4','33','132'), ('20','6','3','86','258'), ('20','22','4','78','312'), ('20','54','2','26.02','52.04'), ('21','21','7','355','2485'), ('21','38','3','325','975'), ('21','45','5','496','2480'), ('21','57','8','12.58','100.64'), ('22','16','3','46','138'), ('22','24','3','54','162'), ('22','25','3','23','69'), ('22','59','4','63.75','255'), ('23','2','4','313','1252'), ('23','43','4','291','1164'), ('23','53','4','14.5','58'), ('24','5','4','33','132'), ('24','24','3','54','162'), ('24','41','5','629','3145'), ('25','61','100','282.58','28258');
INSERT INTO `detalle_factura` VALUES ('26','16','7','46','322'), ('26','24','3','54','162'), ('26','32','4','34','136'), ('26','56','4','10.77','43.08'), ('26','61','7','282.58','1978.06'), ('27','6','6','86','516'), ('27','32','5','34','170'), ('27','56','20','10.77','215.4'), ('27','65','6','81.57','489.42'), ('27','68','12','12.48','149.76'), ('27','70','30','14.64','439.2'), ('28','44','6','385','2310'), ('28','52','12','11.86','142.32'), ('28','56','6','10.77','64.62'), ('28','62','12','43.3','519.6'), ('28','63','3','119.7','359.1'), ('29','24','5','54','270'), ('29','63','4','119.7','478.8'), ('29','64','12','161.2','1934.4'), ('29','66','6','63.66','381.96'), ('29','69','4','11.14','44.56'), ('29','70','6','14.64','87.84'), ('30','27','6','32','192'), ('30','38','3','325','975'), ('30','63','6','119.7','718.2'), ('30','68','6','12.48','74.88'), ('30','69','6','11.14','66.84'), ('30','70','12','14.64','175.68'), ('31','19','4','322','1288'), ('31','28','3','234','702'), ('31','56','5','10.77','53.85'), ('31','73','6','48.04','288.24'), ('32','24','5','54','270'), ('32','57','6','12.58','75.48'), ('32','68','5','12.48','62.4'), ('32','73','6','48.04','288.24'), ('33','38','4','325','1300'), ('33','58','7','31.72','222.04'), ('33','73','4','48.04','192.16'), ('33','72','4','38.74','154.96'), ('33','71','6','41.5','249'), ('33','69','6','11.14','66.84'), ('34','6','6','86','516'), ('34','42','7','554','3878'), ('34','58','6','31.72','190.32'), ('34','72','6','38.74','232.44'), ('34','73','6','48.04','288.24'), ('35','21','6','355','2130'), ('35','45','3','496','1488'), ('35','39','6','333','1998'), ('35','48','3','138','414'), ('35','53','6','14.5','87'), ('36','44','12','385','4620'), ('36','24','6','54','324'), ('36','58','3','31.72','95.16'), ('36','49','7','348','2436'), ('37','31','6','343','2058'), ('37','72','3','38.74','116.22'), ('37','34','3','86','258'), ('37','73','5','48.04','240.2'), ('37','9','4','67','268'), ('38','37','5','233','1165'), ('38','40','4','233','932'), ('38','69','3','11.14','33.42'), ('38','39','5','333','1665'), ('38','67','6','60.15','360.9'), ('38','68','2','12.48','24.96'), ('39','39','3','333','999'), ('39','57','4','12.58','50.32'), ('39','72','4','38.74','154.96'), ('39','3','2','584','1168'), ('39','15','5','333','1665'), ('39','46','2','271','542'), ('40','33','3','54','162'), ('40','46','2','271','542'), ('40','51','5','450','2250'), ('40','45','2','496','992'), ('40','72','5','38.74','193.7'), ('40','30','2','334','668'), ('41','35','4','543','2172'), ('41','42','2','554','1108'), ('41','4','2','233','466'), ('41','62','5','43.3','216.5'), ('41','50','2','128','256'), ('42','27','2','32','64'), ('42','21','3','355','1065'), ('42','3','3','584','1752'), ('42','46','6','271','1626'), ('42','41','4','629','2516'), ('42','69','5','11.14','55.7'), ('43','7','4','323','1292'), ('43','46','4','271','1084'), ('43','72','2','38.74','77.48'), ('43','73','5','48.04','240.2'), ('43','1','2','42','84'), ('43','70','5','14.64','73.2'), ('43','40','4','233','932'), ('44','43','2','291','582'), ('44','40','4','233','932'), ('44','51','1','450','450');
INSERT INTO `detalle_factura` VALUES ('44','45','1','496','496'), ('44','73','5','48.04','240.2'), ('44','66','5','63.66','318.3'), ('44','67','5','60.15','300.75'), ('45','36','5','323','1615'), ('45','24','2','54','108'), ('45','37','2','233','466'), ('45','69','6','11.14','66.84'), ('45','71','2','41.5','83'), ('46','44','5','385','1925'), ('46','51','2','450','900'), ('46','73','2','48.04','96.08'), ('46','36','6','323','1938'), ('46','38','3','325','975'), ('46','43','1','291','291'), ('47','31','4','343','1372'), ('47','26','3','24','72'), ('47','54','2','26.02','52.04'), ('47','24','2','54','108'), ('47','63','4','119.7','478.8'), ('47','68','6','12.48','74.88'), ('47','42','3','554','1662'), ('48','37','4','233','932'), ('48','51','4','450','1800'), ('48','62','4','43.3','173.2'), ('48','72','3','38.74','116.22'), ('48','40','3','233','699'), ('48','43','3','291','873'), ('49','33','2','54','108'), ('49','47','2','328','656'), ('49','50','6','128','768'), ('49','71','3','41.5','124.5'), ('49','66','2','63.66','127.32'), ('49','32','2','34','68'), ('50','31','6','343','2058'), ('50','46','4','271','1084'), ('50','69','2','11.14','22.28'), ('50','64','2','161.2','322.4'), ('50','73','2','48.04','96.08'), ('51','40','5','233','1165'), ('51','68','2','12.48','24.96'), ('51','63','5','119.7','598.5'), ('51','65','3','81.57','244.71'), ('51','31','3','343','1029'), ('51','56','3','10.77','32.31'), ('52','38','4','325','1300'), ('52','69','4','11.14','44.56'), ('52','70','6','14.64','87.84'), ('52','1','2','42','84'), ('52','32','6','34','204'), ('52','17','1','586','586'), ('53','43','1','291','291'), ('53','24','5','54','270'), ('53','56','6','10.77','64.62'), ('53','63','2','119.7','239.4'), ('53','73','5','48.04','240.2');
INSERT INTO `detalle_presupuesto` VALUES ('1','14','2','554','1108'), ('1','38','1','325','325'), ('1','40','2','233','466'), ('1','44','3','385','1155'), ('2','12','4','32','128'), ('2','46','2','271','542'), ('2','49','2','348','696'), ('3','11','2','42','84'), ('3','28','2','234','468'), ('3','39','2','333','666'), ('3','43','1','291','291'), ('3','51','2','450','900'), ('4','1','1','42','42'), ('4','19','2','322','644'), ('4','20','2','243','486'), ('4','32','2','34','68'), ('5','6','2','86','172'), ('5','30','2','334','668'), ('5','38','1','325','325'), ('5','47','1','328','328'), ('5','49','2','348','696'), ('5','50','2','128','256'), ('5','51','2','450','900'), ('6','2','1','313','313'), ('6','5','2','33','66'), ('6','32','2','34','68'), ('6','36','3','323','969'), ('6','37','4','233','932'), ('6','51','1','450','450'), ('7','5','2','33','66'), ('7','13','2','223','446'), ('7','40','5','233','1165'), ('7','48','4','138','552'), ('7','49','2','348','696'), ('8','4','2','233','466'), ('8','25','3','23','69'), ('8','29','2','134','268'), ('8','45','3','496','1488'), ('9','31','3','343','1029'), ('9','56','3','10.77','32.31'), ('9','58','2','31.72','63.44'), ('9','60','5','70.41','352.05'), ('10','28','4','234','936'), ('10','29','2','134','268'), ('10','31','6','343','2058'), ('10','44','2','385','770'), ('11','1','3','42','126'), ('11','36','4','323','1292'), ('11','48','5','138','690'), ('12','6','4','86','344'), ('12','36','2','323','646'), ('12','38','7','325','2275'), ('12','41','5','629','3145'), ('13','15','6','333','1998'), ('13','45','2','496','992'), ('13','67','12','60.15','721.8'), ('13','69','6','11.14','66.84'), ('14','35','6','543','3258'), ('14','41','3','629','1887'), ('14','28','6','234','1404'), ('14','27','2','32','64'), ('15','5','4','33','132'), ('15','34','3','86','258'), ('15','43','4','291','1164'), ('15','72','7','38.74','271.18'), ('15','71','2','41.5','83'), ('15','31','2','343','686'), ('16','25','4','23','92'), ('16','37','2','233','466'), ('16','52','4','11.86','47.44'), ('16','27','4','32','128'), ('16','72','4','38.74','154.96'), ('16','59','5','63.75','318.75'), ('16','61','5','282.58','1412.9'), ('17','48','4','138','552'), ('17','43','5','291','1455'), ('17','2','4','313','1252'), ('17','67','4','60.15','240.6'), ('17','50','5','128','640'), ('17','73','2','48.04','96.08'), ('18','25','2','23','46'), ('18','39','5','333','1665'), ('18','41','5','629','3145'), ('18','44','3','385','1155'), ('18','73','2','48.04','96.08');
INSERT INTO `detalle_salida` VALUES ('1','1','2','3','42','126'), ('1','15','2','2','42','84'), ('2','4','2','2','313','626'), ('2','6','2','2','313','626'), ('4','5','2','2','233','466'), ('4','6','1','3','233','699'), ('4','9','3','4','233','932'), ('5','5','1','3','33','99'), ('5','10','3','1','33','33'), ('6','10','2','2','86','172'), ('7','3','1','2','323','646'), ('7','7','3','2','323','646'), ('7','14','2','3','323','969'), ('8','13','1','3','343','1029'), ('17','11','2','2','586','1172'), ('20','7','2','2','243','486'), ('20','12','3','4','243','972'), ('21','8','1','2','355','710'), ('24','7','1','1','54','54'), ('26','5','1','2','24','48'), ('26','13','3','2','24','48'), ('30','3','1','1','334','334'), ('31','9','1','5','343','1715'), ('31','11','3','3','343','1029'), ('34','15','3','4','86','344'), ('35','3','1','2','543','1086'), ('37','16','3','4','233','932'), ('38','2','2','2','325','650'), ('38','13','2','5','325','1625'), ('39','14','1','4','333','1332'), ('40','8','3','1','233','233'), ('42','2','3','1','554','554'), ('44','16','1','2','385','770'), ('47','4','3','1','328','328'), ('48','3','1','2','138','276'), ('48','4','1','2','138','276'), ('49','2','1','1','348','348'), ('50','6','2','2','128','256'), ('51','2','1','2','450','900'), ('51','12','1','1','450','450'), ('58','12','2','2','31.72','63'), ('58','14','1','5','31.72','159'), ('59','9','2','2','63.75','128'), ('66','15','2','3','63.66','191'), ('68','15','3','4','12.48','50'), ('72','16','2','2','38.74','77'), ('35','17','2','3','543','1629'), ('44','17','3','2','385','770'), ('73','17','1','1','48.04','48.04'), ('66','17','1','2','63.66','127.32'), ('23','18','3','1','534','534'), ('39','18','1','2','333','666');
INSERT INTO `factura` VALUES ('1','5','4','478.35','Efectivo','03/05/14','20:09:45.000000','3189.00','2710.65','S'), ('2','4','5','407.79','Tarjeta','03/05/14','20:11:27.000000','4531.00','4123.21','S'), ('3','3','2','650.40','Efectivo','03/05/14','20:22:05.000000','5420.00','4878.00','S'), ('4','9','4','125.40','Tarjeta','10/05/14','12:22:59.000000','1140.00','1014.60','S'), ('5','10','5','235.20','Efectivo','10/05/14','14:29:05.000000','2940.00','2704.80','S'), ('6','7','2','185.76','Tarjeta','11/05/14','14:56:20.000000','3096.00','2910.24','S'), ('7','6','5','217.92','Tarjeta','11/05/14','15:34:29.000000','1816.00','1598.08','S'), ('8','8','4','171.36','Tarjeta','11/05/14','23:01:35.000000','1428.00','1256.64','S'), ('9','2','6','84.48','Tarjeta','11/05/14','23:04:42.000000','768.00','683.52','S'), ('10','1','2','209.66','Efectivo','11/05/14','23:06:29.000000','1906.00','1696.34','S'), ('11','2','2','212.74','Tarjeta','13/05/14','20:55:41.000000','1934.00','1721.26','S'), ('12','5','4','419.10','Efectivo','20/05/14','00:30:24.000000','2794.00','2374.90','S'), ('13','10','2','157.36','Efectivo','20/05/14','00:33:37.000000','1967.00','1809.64','S'), ('14','1','8','459.36','Efectivo','20/05/14','00:44:31.000000','4176.00','3716.64','S'), ('15','5','8','371.55','Efectivo','20/05/14','17:39:00.000000','2477.00','2105.45','S'), ('16','7','4','194.13','Tarjeta','20/05/14','23:29:15.000000','3235.44','3041.31','S'), ('17','2','5','349.93','Tarjeta','22/05/14','16:14:31.000000','3181.19','2831.26','S'), ('18','10','8','285.53','Efectivo','18/06/14','11:17:00.000000','3569.14','3283.61','S'), ('19','5','5','115.80','Efectivo','11/07/14','12:58:56.000000','772.00','656.20','S'), ('20','11','6','90.48','Tarjeta','13/07/14','13:07:27.000000','754.04','663.56','S'), ('21','9','6','845.69','Tarjeta','24/08/14','15:51:45.000000','6040.64','5194.95','S'), ('22','7','4','37.44','Tarjeta','26/08/14','17:13:50.000000','624.00','586.56','S'), ('23','6','6','296.88','Tarjeta','26/08/14','17:27:00.000000','2474.00','2177.12','S'), ('24','1','6','378.29','Efectivo','26/08/14','17:38:45.000000','3439.00','3060.71','S'), ('25','12','8','0.00','Efectivo','25/09/14','21:19:49.000000','28258.00','28258.00','S'), ('26','13','8','316.94','Efectivo','30/09/14','00:05:37.000000','2641.14','2324.20','S'), ('27','13','9','237.57','Efectivo','05/10/14','22:50:56.000000','1979.78','1762.00','S'), ('28','8','9','407.48','Tarjeta','05/10/14','22:53:25.000000','3395.64','2988.16','S'), ('29','14','9','479.63','Efectivo','11/10/14','02:19:15.000000','3197.56','2717.93','S'), ('30','14','9','330.39','Efectivo','12/10/14','15:30:59.000000','2202.60','1872.21','S'), ('31','15','9','279.85','Efectivo','01/11/14','20:26:05.000000','2332.09','2052.24','S'), ('32','13','5','83.53','Efectivo','01/11/14','20:30:54.000000','696.12','612.59','S'), ('33','10','8','218.5','Efectivo','04/11/14','17:43:37.000000','2185.00','1966.50','S'), ('34','6','9','612.6','Tarjeta','04/11/14','17:48:49.000000','5105.00','4492.40','S'), ('35','8','8','734.04','Tarjeta','06/11/14','00:30:10.000000','6117.00','5382.96','S'), ('36','4','9','672.76','Tarjeta','06/11/14','23:35:50.000000','7475.16','6802.40','S'), ('37','8','9','352.85','Tarjeta','06/11/14','23:41:04.000000','2940.42','2587.57','S'), ('38','13','9','501.75','Efectivo','06/11/14','23:47:23.000000','4181.28','3679.53','S'), ('39','10','8','457.93','Efectivo','07/11/14','11:08:01.000000','4579.28','4121.35','S'), ('40','14','8','721.16','Efectivo','07/11/14','11:10:09.000000','4807.70','4086.54','S'), ('41','12','4','0.0','Efectivo','07/11/14','23:45:32.000000','4218.50','4218.50','S'), ('42','10','6','707.87','Efectivo','08/11/14','10:43:41.000000','7078.70','6370.83','S'), ('43','7','5','226.97','Tarjeta','08/11/14','23:16:16.000000','3782.88','3555.91','S'), ('44','8','5','398.31','Tarjeta','08/11/14','23:20:43.000000','3319.25','2920.94','S'), ('45','16','8','233.88','Efectivo','08/11/14','23:34:39.000000','2338.84','2104.96','S'), ('46','17','8','735.01','Efectivo','08/11/14','23:35:42.000000','6125.08','5390.07','S'), ('47','16','9','381.97','Efectivo','09/11/14','11:14:21.000000','3819.72','3437.75','S'), ('48','6','9','551.21','Tarjeta','09/11/14','11:16:12.000000','4593.42','4042.21','S'), ('49','14','4','277.77','Efectivo','09/11/14','17:07:42.000000','1851.82','1574.05','S'), ('50','5','4','537.41','Efectivo','09/11/14','17:09:26.000000','3582.76','3045.35','S'), ('51','3','8','371.34','Efectivo','09/11/14','17:14:08.000000','3094.48','2723.14','S'), ('52','14','8','345.96','Efectivo','10/11/14','11:11:28.000000','2306.40','1960.44','S'), ('53','9','8','121.57','Tarjeta','10/11/14','11:13:13.000000','1105.22','983.65','S');
INSERT INTO `marca` VALUES ('1','SOLO','S'), ('2','CATERPILAR','S'), ('3','VULCANO','S'), ('4','KOLLER','S'), ('5','ZINCSO','S'), ('6','PATCO','S'), ('7','SAFETY','S'), ('8','INCORESA','S'), ('9','GENERICO','S');
INSERT INTO `motivo` VALUES ('1','PERDIDA','S'), ('2','ROBO','S'), ('3','DEFECTUOSO','S');
INSERT INTO `notacredito` VALUES ('1','3','3','647.16','20/05/14','00:11:18.000000','4745.84','S'), ('2','1','5','644.55','20/05/14','00:21:54.000000','3652.45','S'), ('3','2','4','377.82','20/05/14','00:22:40.000000','3820.18','S'), ('4','10','1','177.21','20/05/14','00:23:00.000000','1433.79','S'), ('5','6','7','159.48','20/05/14','00:24:09.000000','2498.52','S'), ('6','8','8','156.84','20/05/14','00:24:34.000000','1150.16','S'), ('7','14','1','405.46','20/05/14','00:46:52.000000','3280.54','S'), ('8','23','6','227.04','26/08/14','17:31:30.000000','1664.96','S'), ('9','30','14','463.46','25/10/14','00:00:14.000000','2626.30','S'), ('10','31','15','262.56','01/11/14','20:33:08.000000','1925.41','S'), ('11','32','13','75.90','07/11/14','11:14:00.000000','556.62','S');
INSERT INTO `presupuesto` VALUES ('1','2','3','366.48','Efectivo','03/05/14','20:15:03.000000','2687.52','R'), ('2','4','5','204.90','Tarjeta','11/05/14','12:21:05.000000','1161.10','A'), ('3','4','1','264.99','Efectivo','14/05/14','14:27:01.000000','2144.01','A'), ('4','2','2','148.80','Efectivo','10/05/14','14:57:49.000000','1091.20','A'), ('5','5','4','301.05','Tarjeta','12/05/14','23:57:35.000000','3043.95','A'), ('6','2','8','335.76','Tarjeta','13/05/14','23:45:53.000000','2462.24','R'), ('7','4','6','351.00','Tarjeta','20/05/14','00:38:11.000000','2574.00','A'), ('8','8','10','183.28','Efectivo','20/05/14','17:42:05.000000','2107.72','A'), ('9','8','7','88.61','Efectivo','25/05/14','22:30:29.000000','1388.19','A'), ('10','8','4','362.88','Tarjeta','18/06/14','11:19:08.000000','3669.12','A'), ('11','5','2','231.88','Tarjeta','11/07/14','10:44:14.000000','1876.12','R'), ('12','6','3','769.20','Efectivo','24/08/14','15:54:57.000000','5640.80','A'), ('13','9','13','453.44','Efectivo','12/10/14','15:34:15.000000','3325.20','A'), ('14','5','11','793.56','Tarjeta','06/11/14','00:39:03.000000','5819.44','A'), ('15','5','14','389.13','Efectivo','07/11/14','23:48:53.000000','2205.05','R'), ('16','6','15','314.41','Efectivo','08/11/14','10:47:16.000000','2305.64','A'), ('17','5','4','381.21','Tarjeta','08/11/14','23:18:42.000000','3854.47','A'), ('18','9','8','732.85','Tarjeta','09/11/14','11:17:39.000000','5374.23','A');
INSERT INTO `proveedor` VALUES ('1','ARDILES IMPORT S.A.C','6436353343','JOSE','983453453','3190660 ','1232','AVENIDA SANTA MARÍA, 210','1','informes@ardiles.com.pe','www.ardilesimport.com','NINGUNA','S'), ('2','JEPESA REPRESENTACIONES S.R.L.','6436353343','MARIA','898382689','5617466','4121','CALLE LOS TUCANES, 153 URB. SAN JOSE-BELLAVISTA','2','informes@jepesa.com','www.jepesa.com','NINGUNA','S'), ('3','FEDIVEN S.A.C. - SUCURSAL DE SAN LUIS','5325322','PEDRO','984352333','4732464  ','2311','AVENIDA CIRCUNVALACIÓN, 2094','1','informes@fediven.com.pe','www.fediven.com','NINGUNA','S'), ('4','INDUSTRIAL COMERCIAL SANTA ADELAIDA S.A.','9388748327','ESTELA','938829884','6116868','5332','AVENIDA COLONIAL, 2479 - CERCADO DE LIMA','1','informes@icsa.com.pe','www.icsa.com.pe','NINGUNA','S'), ('5','DISTRIBUIDORA INCORESA - SUCURSAL DE EL CERCADO','5445446454','ESTHEPANY','873435233','6197373 ','4322','AVENIDA SANTA BERNARDITA, 024 URB. PALOMINO','1','informes@incoresa.com.pe','www.incoresa.com.pe','NINGUNA','S'), ('6','LINIAN CORP S.A.C. - SUCURSAL DE BREÑA','1988392837','CARLOS','848382934','4333296','5413','JIRÓN PARIACOTO, 989 - BREÑA','1','informes@liniasac.com','www.liniansac.com','EXIGENTE','S'), ('7','TRUCK ACCESORIES S.A.C. - LOCAL COMERCIAL','6523534534','SAMUEL','898232523','5354546','3423','AVENIDA MÉXICO, 889 891 - LA VICTORIA ','1','informes@truckaccesoriesperu.com.pe','www.truckaccesoriesperu.com','NINGUNA','S'), ('8','COMPER','4757567567','ERICKA','957833763','2248602','2112','AVENIDA NICOLÁS ARRIOLA, 290 OF. 105 - LA VICTORIA','1','informes@compersrl.com','www.compersrl.com','NINGUNA','S'), ('9','VIDRIERIA SANTA CATALINA SAC','4635353523','ROSARIO','982423534','5632342','1232','AVENIDA CANADÁ, 860 URB. SANTA CATALINA','1','atencionalcliente@vidstacatalina.com','www.vidstacatalina.com','NINGUNA','S'), ('10','SAFETY FILMS PERU SAC','6436353252','FRANK','798434535','5723534','6324','C. CARLOS JIMÉNEZ MZ. K LT. 5 LA CAMPIÑA','1','informes@safetyfilms.pe','www.safetyfilms.pe','LEJANO','S'), ('11','TUBERIAS JACINTO S.A','2184089238','ROBERTO','987987987','2837982','8921','AV. FLORES 345, LA VICTORIA','1','tuberiasjacinto@gmail.com','','','S'), ('12','DELBAY S.A','2394804093','ERNESTO','893481932','5943823','3498','AV. ALFREDO MENDIOLA 642','1','delbay@hotmail.com','','','S'), ('13','VIALUMAZ E.I.R.L','2034430930','PEPE','899293209','5103994','7979','JR. PACARITAMBO','1','vialumaz@gmail.com','','','S'), ('14','MASTERCOM','1238043909','ROSAURA','9893298','6839928','9128','AV. AVIACION 4230 OF 301-SURQUILLO','1','informes@mastercom.com.pe','www.mastercon.com.pe/','','S');
INSERT INTO `provincias` VALUES ('1','LIMA','S'), ('2','CALLAO','S');
INSERT INTO `rubro` VALUES ('1','MADERAS','S'), ('2','PLASTICOS','S'), ('3','CONTRUCCION','S'), ('4','CARPINTERIA','S'), ('5','METALES','S'), ('6','GASFITERIA','S'), ('7','VIDRIOS','S'), ('8','ELECTRICIDAD','S'), ('9','JARDINERIA','S'), ('10','TELAS','S');
INSERT INTO `salidas` VALUES ('1','03/05/14','20:07:29.000000','126.00','S'), ('2','14/05/14','14:25:34.000000','2452.00','S'), ('3','11/05/14','17:04:50.000000','2342.00','S'), ('4','12/05/14','23:47:06.000000','1230.00','S'), ('5','13/05/14','20:52:08.000000','613.00','S'), ('6','15/05/14','14:18:52.000000','1581.00','S'), ('7','17/05/14','22:38:25.000000','1186.00','S'), ('8','20/05/14','17:37:00.000000','943.00','S'), ('9','25/05/14','22:15:18.000000','2774.50','S'), ('10','13/07/14','13:10:02.000000','205.00','S'), ('11','19/07/14','20:56:11.000000','2201.00','S'), ('12','22/08/14','15:11:55.000000','1485.44','S'), ('13','24/08/14','15:43:37.000000','2702.00','S'), ('14','29/09/14','23:50:29.000000','2459.60','S'), ('15','08/10/14','23:27:59.000000','668.90','S'), ('16','25/10/14','23:56:03.000000','1779.48','S'), ('17','08/11/14','10:35:56.000000','2574.36','S'), ('18','09/11/14','17:16:33.000000','1200.00','S');
INSERT INTO `stock` VALUES ('1','50','S'), ('2','50','S'), ('3','50','S'), ('4','50','S'), ('5','50','S'), ('6','50','S'), ('7','50','S'), ('8','50','S'), ('9','50','S'), ('10','50','S'), ('11','50','S'), ('12','50','S'), ('13','50','S'), ('14','50','S'), ('15','50','S'), ('16','50','S'), ('17','50','S'), ('18','50','S'), ('19','50','S'), ('20','50','S'), ('21','50','S'), ('22','50','S'), ('23','50','S'), ('24','50','S'), ('25','50','S'), ('26','50','S'), ('27','50','S'), ('28','50','S'), ('29','50','S'), ('30','50','S'), ('31','50','S'), ('32','50','S'), ('33','50','S'), ('34','50','S'), ('35','50','S'), ('36','50','S'), ('37','50','S'), ('38','50','S'), ('39','50','S'), ('40','50','S'), ('41','50','S'), ('42','50','S'), ('43','50','S'), ('44','50','S'), ('45','50','S'), ('46','50','S'), ('47','50','S'), ('48','50','S'), ('49','50','S'), ('50','50','S'), ('51','50','S'), ('52','50','S'), ('53','50','S'), ('54','50','S'), ('55','50','S'), ('56','50','S'), ('57','50','S'), ('58','50','S'), ('59','50','S'), ('60','50','S'), ('61','50','S'), ('62','50','S'), ('63','50','S'), ('64','50','S'), ('65','50','S'), ('66','50','S'), ('67','50','S'), ('68','50','S'), ('69','50','S'), ('70','50','S'), ('71','50','S'), ('72','50','S'), ('73','50','S');
INSERT INTO `transporte` VALUES ('1','EL RAPIDO','S'), ('2','EL NITROSO','S'), ('3','EL FUGAZ','S'), ('4','EL ESCARABAJO','S');
INSERT INTO `unidad` VALUES ('1','METROS','S'), ('2','KILOGRAMO','S'), ('3','PULGADAS','S'), ('4','UNIDADES','S');
INSERT INTO `usuario` VALUES ('1','JONATHAN M. LOPEZ','Administrador','jlopez','b06e188688ee904809bc4f1fda16aed8','S','10.10.62.2'), ('2','NOELIA CALLE QUIROZ','Compra','ncalle','376199b95700ef9ad5b8b9cd2e565fc8','S','10.10.62.2'), ('3','RAUL SANTOS GARLAND','Almacen','rsantos','c2f004a05fffa487f826003604b87de1','S','10.10.62.2'), ('4','ROSA M. PATIÑO AGUILAR','Venta','rpatiño','d2200b3c9b3d1e7a1effb538d8e23be2','S','10.10.62.2'), ('5','JENNIFER C. ASTON RAMOS','Venta','jaston','63adada0c38fcb3eb4f11548d046dfc7','S','10.10.62.2'), ('6','GIANELLA R. GONZALES PRADA','Venta','ggonzales','ab40b2a3fc91109d30c1e3fd5c7be3fe','S','10.10.62.2'), ('7','ANDRE PEÑALOZA DE SOUSA','Administrador','apeñaloza','dd573120e473c889140e34e817895495','S','10.10.62.2'), ('8','MARISOL CASTRO AGUIRRE','Venta','mcastro','987f6c3ed52eea0e00f48f838d330911','S','10.10.62.2'), ('9','JOSE IZQUIERDO MORALES','Venta','joseim','90e528618534d005b1a7e7b7a367813f','S','10.10.62.2'), ('10','ESTEVAN RAMIREZ SALCEDO','Almacen','eramirez','73ac3cb2bbaa6f2a277417a260779cec','S','10.10.62.2');
INSERT INTO `vendedor` VALUES ('1','JONATHAN M. LOPEZ GAMARRA','COMAS CALLE HEROES DEL CENEPA 243','7399939','979183889','2000.00','1','1','10.00','jmlopezg108@gmail.com','PUNTUAL Y RESPONSABLE','S'), ('2','NOELIA CALLE QUIROZ','URB. CASIMIRO 345 - SAN LUIS','4554323','989343523','800.00','1','3','10.00','noeliacq@hotmail.com','LE GUSTA CANTAR','S'), ('3','RAUL SANTOS GARLAND','URB. GIRASOL 234 - LOS OLIVOS','7823883','893273478','800.00','1','1','10.00','raulsg@gmail.com','PUNTUAL','S'), ('4','ROSA M. PATIÑO AGUILAR','CALLE DONAL 344 - CHORRILLOS','5792920','900239843','800.00','1','1','10.00','parosa@gmail.com','SIMPATICA','S'), ('5','JENNIFER C. ASTON RAMOS','URB. GRAU 344 - LOS OLIVOS','7839929','983829383','800.00','1','1','10.00','jennifer12@hotmail.com','PERSUASIVA','S'), ('6','GIANELLA R. GONZALES PRADA','AV. OCLLO 345, LINCE','5923993','989379346','800.00','1','3','10.00','gonzalesg@hotmail.com','NINGUNA','S'), ('7','ANDRE PEÑALOZA DE SOUSA','AV. GENERAL ALMEDARIZ 234 MIRAFLORES','7838298','899293399','2000.00','1','4','11.00','apeñaloza@hotmail.com','NINGUNA','S'), ('8','MARISOL CASTRO AGUIRRE','AV. CASIMIRO 233 - URB. GIRASOLES, COMAS','5654323','755432323','800.0','1','1','3.0','mcastro@gmail.com','NINGUNA','S'), ('9','JOSE IZQUIERDO MORALES','URB. ALAMO 345 - COMAS','8980234','023482304','900.00','1','1','10.00','joseim@gmail.com','NINGUNA','S'), ('10','ESTEVAN RAMIREZ SALCEDO','URB. PINAR 352 - LOS OLIVOS','7623534','896524356','900.00','1','1','10.00','ramirez@gmail.com','','S');
INSERT INTO `zona` VALUES ('1','NORTE','S'), ('2','SUR','S'), ('3','ESTE','S'), ('4','OESTE','S'), ('5','CENTRO','S');
