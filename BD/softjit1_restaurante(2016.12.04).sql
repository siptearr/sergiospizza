/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50505
 Source Host           : localhost
 Source Database       : softjit1_restaurante

 Target Server Type    : MySQL
 Target Server Version : 50505
 File Encoding         : utf-8

 Date: 12/04/2016 03:43:20 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `almacen`
-- ----------------------------
DROP TABLE IF EXISTS `almacen`;
CREATE TABLE `almacen` (
  `idalmacen` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idalmacen`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `almacen`
-- ----------------------------
BEGIN;
INSERT INTO `almacen` VALUES ('1', 'almacen general');
COMMIT;

-- ----------------------------
--  Table structure for `asignaciones`
-- ----------------------------
DROP TABLE IF EXISTS `asignaciones`;
CREATE TABLE `asignaciones` (
  `idasignaciones` int(11) NOT NULL AUTO_INCREMENT,
  `tabla` varchar(90) DEFAULT NULL,
  `escritura` varchar(45) DEFAULT NULL,
  `lectura` varchar(45) DEFAULT NULL,
  `modificacion` varchar(45) DEFAULT NULL,
  `eliminacion` varchar(45) DEFAULT NULL,
  `privilegios_idprivilegios` int(11) NOT NULL,
  PRIMARY KEY (`idasignaciones`,`privilegios_idprivilegios`),
  KEY `fk_asignaciones_privilegios1_idx` (`privilegios_idprivilegios`),
  CONSTRAINT `fk_asignaciones_privilegios1` FOREIGN KEY (`privilegios_idprivilegios`) REFERENCES `privilegios` (`idprivilegios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `asignaciones`
-- ----------------------------
BEGIN;
INSERT INTO `asignaciones` VALUES ('1', 'proveedor', 'si', 'si', 'si', 'si', '2'), ('2', 'almacen', 'si', 'si', 'si', 'si', '2'), ('3', 'ingrediente', 'si', 'si', 'si', 'si', '2'), ('4', 'mesa', 'si', 'si', 'si', 'si', '2'), ('5', 'sucursal', 'si', 'si', 'si', 'si', '2'), ('6', 'tipousuario', 'si', 'si', 'si', 'si', '2'), ('9', 'familia', 'si', 'si', 'si', 'si', '2'), ('10', 'grupo', 'si', 'si', 'si', 'si', '2'), ('11', 'producto', 'si', 'si', 'si', 'si', '2'), ('12', 'tipoorden', 'si', 'si', 'si', 'si', '2'), ('13', 'cliente', 'si', 'si', 'si', 'si', '2'), ('14', 'orden', 'si', 'si', 'si', 'si', '3'), ('15', 'orden', 'si', 'si', 'si', 'si', '7'), ('16', 'orden', 'si', 'si', 'si', 'si', '8');
COMMIT;

-- ----------------------------
--  Table structure for `caja`
-- ----------------------------
DROP TABLE IF EXISTS `caja`;
CREATE TABLE `caja` (
  `idcaja` int(11) NOT NULL AUTO_INCREMENT,
  `fechayhora` timestamp NULL DEFAULT NULL,
  `tipomovimiento` varchar(45) DEFAULT NULL,
  `cantidad` float DEFAULT NULL,
  `compras_idcompras` int(11) NOT NULL,
  `ventas_idventas` int(11) NOT NULL,
  `sucursal_idsucursal` int(11) NOT NULL,
  PRIMARY KEY (`idcaja`,`compras_idcompras`,`ventas_idventas`,`sucursal_idsucursal`),
  KEY `fk_caja_compras1_idx` (`compras_idcompras`),
  KEY `fk_caja_ventas1_idx` (`ventas_idventas`),
  KEY `fk_caja_sucursal1_idx` (`sucursal_idsucursal`),
  CONSTRAINT `fk_caja_compras1` FOREIGN KEY (`compras_idcompras`) REFERENCES `compras` (`idcompras`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_caja_sucursal1` FOREIGN KEY (`sucursal_idsucursal`) REFERENCES `sucursal` (`idsucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_caja_ventas1` FOREIGN KEY (`ventas_idventas`) REFERENCES `ventas` (`idventas`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `cliente`
-- ----------------------------
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `razonsocial` varchar(45) DEFAULT NULL,
  `rfc` varchar(45) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `cp` varchar(45) DEFAULT NULL,
  `telefono` varchar(90) DEFAULT NULL,
  `calificacion` varchar(128) DEFAULT NULL,
  `estatus` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `cliente`
-- ----------------------------
BEGIN;
INSERT INTO `cliente` VALUES ('1', 'Publico en general', 'SIN RFC', 'Publico General', 'N/A', 'N/A', 'N/A', '10', 'activo'), ('2', 'Persona Fisica', 'TEAR8006198Q2', 'Ricardo Teran Arcibar', 'Blv. Adolfo Lopez Mateos s/n', '36000', '4734594141', '10', 'activo');
COMMIT;

-- ----------------------------
--  Table structure for `compras`
-- ----------------------------
DROP TABLE IF EXISTS `compras`;
CREATE TABLE `compras` (
  `idcompras` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `comprascol` varchar(45) DEFAULT NULL,
  `proveedor_idproveedor` int(11) NOT NULL,
  PRIMARY KEY (`idcompras`,`proveedor_idproveedor`),
  KEY `fk_compras_proveedor1_idx` (`proveedor_idproveedor`),
  CONSTRAINT `fk_compras_proveedor1` FOREIGN KEY (`proveedor_idproveedor`) REFERENCES `proveedor` (`idproveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `configuracion`
-- ----------------------------
DROP TABLE IF EXISTS `configuracion`;
CREATE TABLE `configuracion` (
  `idconfiguracion` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idconfiguracion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `configuracion`
-- ----------------------------
BEGIN;
INSERT INTO `configuracion` VALUES ('1', '2016-09-13', 'main');
COMMIT;

-- ----------------------------
--  Table structure for `contenido`
-- ----------------------------
DROP TABLE IF EXISTS `contenido`;
CREATE TABLE `contenido` (
  `idcontenido` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  `lugar` varchar(255) DEFAULT NULL,
  `gps` varchar(255) DEFAULT NULL,
  `contenido` text,
  `estatus` varchar(45) DEFAULT NULL,
  `seccion_idseccion` int(11) NOT NULL,
  `usuario_idusuario` int(11) NOT NULL,
  PRIMARY KEY (`idcontenido`,`seccion_idseccion`,`usuario_idusuario`),
  KEY `fk_contenido_seccion1_idx` (`seccion_idseccion`),
  KEY `fk_contenido_usuario1_idx` (`usuario_idusuario`),
  CONSTRAINT `fk_contenido_seccion1` FOREIGN KEY (`seccion_idseccion`) REFERENCES `seccion` (`idseccion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_contenido_usuario1` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `entrega`
-- ----------------------------
DROP TABLE IF EXISTS `entrega`;
CREATE TABLE `entrega` (
  `identrega` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL COMMENT '-sucursal\n-domicilio\n-gps',
  `tiempoestimado` timestamp NULL DEFAULT NULL,
  `entregado` datetime DEFAULT NULL,
  `orden_idorden` int(11) NOT NULL,
  PRIMARY KEY (`identrega`,`orden_idorden`),
  KEY `fk_entrega_orden1_idx` (`orden_idorden`),
  CONSTRAINT `fk_entrega_orden1` FOREIGN KEY (`orden_idorden`) REFERENCES `orden` (`idorden`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `estado`
-- ----------------------------
DROP TABLE IF EXISTS `estado`;
CREATE TABLE `estado` (
  `idestado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `cve` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idestado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `familia`
-- ----------------------------
DROP TABLE IF EXISTS `familia`;
CREATE TABLE `familia` (
  `idfamilia` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL COMMENT '-restaurant\n-pizzeria\n-postres\n-bebidas\n',
  PRIMARY KEY (`idfamilia`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `familia`
-- ----------------------------
BEGIN;
INSERT INTO `familia` VALUES ('1', 'restaurante'), ('2', 'pizzeria');
COMMIT;

-- ----------------------------
--  Table structure for `grupo`
-- ----------------------------
DROP TABLE IF EXISTS `grupo`;
CREATE TABLE `grupo` (
  `idgrupo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `familia_idfamilia` int(11) NOT NULL,
  PRIMARY KEY (`idgrupo`,`familia_idfamilia`),
  KEY `fk_grupo_familia1_idx` (`familia_idfamilia`),
  CONSTRAINT `fk_grupo_familia1` FOREIGN KEY (`familia_idfamilia`) REFERENCES `familia` (`idfamilia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `grupo`
-- ----------------------------
BEGIN;
INSERT INTO `grupo` VALUES ('1', 'pastas', '1'), ('2', 'cremas', '1'), ('3', 'carnes', '1'), ('4', 'hamburguesas', '1'), ('5', 'postres', '1'), ('6', 'otros', '1'), ('7', 'bisteck', '2'), ('8', 'salami', '2'), ('9', 'salami y carne molida', '2'), ('10', 'jamon', '2'), ('11', 'jamon y piÃƒÂ±a', '2'), ('12', 'sergios', '2'), ('13', 'champiÃƒÂ±ones', '2'), ('14', 'suprema', '2'), ('15', 'champiÃƒÂ±ones y carne molida', '2'), ('16', 'mexicana', '2'), ('17', 'tocino con cebolla', '2'), ('18', 'chorizo con cebolla', '2'), ('19', 'atun', '2'), ('20', 'camarones', '2'), ('21', 'vegetariana', '2'), ('22', 'camarones con champiÃƒÂ±ones', '2'), ('23', 'salchicha viena', '2'), ('24', 'mariscos', '2'), ('25', 'especial', '2'), ('26', 'carnes frias', '2');
COMMIT;

-- ----------------------------
--  Table structure for `ingrediente`
-- ----------------------------
DROP TABLE IF EXISTS `ingrediente`;
CREATE TABLE `ingrediente` (
  `idingrediente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `tamaño` varchar(45) DEFAULT NULL,
  `precio` varchar(45) DEFAULT NULL,
  `unidad` varchar(45) DEFAULT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  `reorden` varchar(45) DEFAULT NULL,
  `almacen_idalmacen` int(11) NOT NULL,
  PRIMARY KEY (`idingrediente`,`almacen_idalmacen`),
  KEY `fk_ingrediente_almacen1_idx` (`almacen_idalmacen`),
  CONSTRAINT `fk_ingrediente_almacen1` FOREIGN KEY (`almacen_idalmacen`) REFERENCES `almacen` (`idalmacen`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `ingrediente`
-- ----------------------------
BEGIN;
INSERT INTO `ingrediente` VALUES ('1', 'completo', 'normal', '1', 'pieza', '10000', '10', '1');
COMMIT;

-- ----------------------------
--  Table structure for `localidad`
-- ----------------------------
DROP TABLE IF EXISTS `localidad`;
CREATE TABLE `localidad` (
  `idlocalidad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(128) DEFAULT NULL,
  `cve` varchar(10) DEFAULT NULL,
  `municipio_idmunicipio` int(11) NOT NULL,
  PRIMARY KEY (`idlocalidad`,`municipio_idmunicipio`),
  KEY `fk_localidad_municipio1` (`municipio_idmunicipio`),
  CONSTRAINT `fk_localidad_municipio1` FOREIGN KEY (`municipio_idmunicipio`) REFERENCES `municipio` (`idmunicipio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `mesa`
-- ----------------------------
DROP TABLE IF EXISTS `mesa`;
CREATE TABLE `mesa` (
  `idmesa` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(45) DEFAULT NULL,
  `ubicacion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idmesa`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `mesa`
-- ----------------------------
BEGIN;
INSERT INTO `mesa` VALUES ('1', '1', 'planta baja');
COMMIT;

-- ----------------------------
--  Table structure for `municipio`
-- ----------------------------
DROP TABLE IF EXISTS `municipio`;
CREATE TABLE `municipio` (
  `idmunicipio` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(70) DEFAULT NULL,
  `cve` varchar(10) DEFAULT NULL,
  `jurisdiccion` int(11) DEFAULT NULL,
  `estado_idestado` int(11) NOT NULL,
  PRIMARY KEY (`idmunicipio`,`estado_idestado`),
  KEY `fk_municipio_estado` (`estado_idestado`),
  CONSTRAINT `fk_municipio_estado` FOREIGN KEY (`estado_idestado`) REFERENCES `estado` (`idestado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `orden`
-- ----------------------------
DROP TABLE IF EXISTS `orden`;
CREATE TABLE `orden` (
  `idorden` int(11) NOT NULL AUTO_INCREMENT,
  `inicio` timestamp NULL DEFAULT NULL,
  `entregaaproximada` datetime DEFAULT NULL,
  `horaentrega` datetime DEFAULT NULL,
  `estatus` varchar(45) DEFAULT NULL,
  `mesa_idmesa` int(11) NOT NULL,
  `procion_idporcion` int(11) NOT NULL,
  `producto_idproducto` int(11) NOT NULL,
  `tipoorden_idtipoorden` int(11) NOT NULL,
  `familia_idfamilia` int(11) NOT NULL,
  `sucursal_idsucursal` int(11) NOT NULL,
  `cliente_idcliente` int(11) NOT NULL,
  `usuario_idusuario` int(11) NOT NULL,
  PRIMARY KEY (`idorden`,`mesa_idmesa`,`procion_idporcion`,`producto_idproducto`,`tipoorden_idtipoorden`,`familia_idfamilia`,`sucursal_idsucursal`,`cliente_idcliente`,`usuario_idusuario`),
  KEY `fk_orden_tipoorden1_idx` (`tipoorden_idtipoorden`),
  KEY `fk_orden_familia1_idx` (`familia_idfamilia`),
  KEY `fk_orden_mesa1_idx` (`mesa_idmesa`),
  KEY `fk_orden_producto1_idx` (`producto_idproducto`),
  KEY `fk_orden_sucursal1_idx` (`sucursal_idsucursal`),
  KEY `fk_orden_usuario1_idx` (`usuario_idusuario`),
  KEY `fk_orden_procion1_idx` (`procion_idporcion`),
  KEY `fk_orden_cliente1_idx` (`cliente_idcliente`),
  CONSTRAINT `fk_orden_cliente1` FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente` (`idcliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orden_familia1` FOREIGN KEY (`familia_idfamilia`) REFERENCES `familia` (`idfamilia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orden_mesa1` FOREIGN KEY (`mesa_idmesa`) REFERENCES `mesa` (`idmesa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orden_procion1` FOREIGN KEY (`procion_idporcion`) REFERENCES `procion` (`idporcion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orden_producto1` FOREIGN KEY (`producto_idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orden_sucursal1` FOREIGN KEY (`sucursal_idsucursal`) REFERENCES `sucursal` (`idsucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orden_tipoorden1` FOREIGN KEY (`tipoorden_idtipoorden`) REFERENCES `tipoorden` (`idtipoorden`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orden_usuario1` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `orden_has_ingrediente`
-- ----------------------------
DROP TABLE IF EXISTS `orden_has_ingrediente`;
CREATE TABLE `orden_has_ingrediente` (
  `orden_idorden` int(11) NOT NULL,
  `ingrediente_idingrediente` int(11) NOT NULL,
  PRIMARY KEY (`orden_idorden`,`ingrediente_idingrediente`),
  KEY `fk_orden_has_ingrediente_ingrediente1_idx` (`ingrediente_idingrediente`),
  KEY `fk_orden_has_ingrediente_orden1_idx` (`orden_idorden`),
  CONSTRAINT `fk_orden_has_ingrediente_ingrediente1` FOREIGN KEY (`ingrediente_idingrediente`) REFERENCES `ingrediente` (`idingrediente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orden_has_ingrediente_orden1` FOREIGN KEY (`orden_idorden`) REFERENCES `orden` (`idorden`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `privilegios`
-- ----------------------------
DROP TABLE IF EXISTS `privilegios`;
CREATE TABLE `privilegios` (
  `idprivilegios` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idprivilegios`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `privilegios`
-- ----------------------------
BEGIN;
INSERT INTO `privilegios` VALUES ('1', 'superusuario'), ('2', 'administrador'), ('3', 'orden'), ('4', 'venta'), ('5', 'compra'), ('6', 'caja'), ('7', 'restaurante'), ('8', 'pizzeria');
COMMIT;

-- ----------------------------
--  Table structure for `procion`
-- ----------------------------
DROP TABLE IF EXISTS `procion`;
CREATE TABLE `procion` (
  `idporcion` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idporcion`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `procion`
-- ----------------------------
BEGIN;
INSERT INTO `procion` VALUES ('1', '1/1'), ('2', '1/2'), ('3', '1/3'), ('4', '1/4'), ('5', '2/3'), ('6', '3/4');
COMMIT;

-- ----------------------------
--  Table structure for `producto`
-- ----------------------------
DROP TABLE IF EXISTS `producto`;
CREATE TABLE `producto` (
  `idproducto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `tamaño` varchar(45) DEFAULT NULL,
  `precio` varchar(45) DEFAULT NULL,
  `tiempopreparacion` varchar(45) DEFAULT NULL,
  `grupo_idgrupo` int(11) NOT NULL,
  PRIMARY KEY (`idproducto`,`grupo_idgrupo`),
  KEY `fk_producto_grupo1_idx` (`grupo_idgrupo`),
  CONSTRAINT `fk_producto_grupo1` FOREIGN KEY (`grupo_idgrupo`) REFERENCES `grupo` (`idgrupo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `producto`
-- ----------------------------
BEGIN;
INSERT INTO `producto` VALUES ('1', 'Espaguetti al burro', 'chico', '60', '20', '1');
COMMIT;

-- ----------------------------
--  Table structure for `producto_has_ingrediente`
-- ----------------------------
DROP TABLE IF EXISTS `producto_has_ingrediente`;
CREATE TABLE `producto_has_ingrediente` (
  `producto_idproducto` int(11) NOT NULL,
  `ingrediente_idingrediente` int(11) NOT NULL,
  `unidad` varchar(45) DEFAULT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`producto_idproducto`,`ingrediente_idingrediente`),
  KEY `fk_producto_has_ingrediente_ingrediente1_idx` (`ingrediente_idingrediente`),
  KEY `fk_producto_has_ingrediente_producto1_idx` (`producto_idproducto`),
  CONSTRAINT `fk_producto_has_ingrediente_ingrediente1` FOREIGN KEY (`ingrediente_idingrediente`) REFERENCES `ingrediente` (`idingrediente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_producto_has_ingrediente_producto1` FOREIGN KEY (`producto_idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `proveedor`
-- ----------------------------
DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE `proveedor` (
  `idproveedor` int(11) NOT NULL AUTO_INCREMENT,
  `razonsocial` varchar(45) DEFAULT NULL,
  `rfc` varchar(45) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `cp` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idproveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `seccion`
-- ----------------------------
DROP TABLE IF EXISTS `seccion`;
CREATE TABLE `seccion` (
  `idseccion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(90) DEFAULT NULL,
  `ruta` varchar(255) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `estatus` varchar(45) DEFAULT NULL,
  `usuario_idusuario` int(11) NOT NULL,
  PRIMARY KEY (`idseccion`,`usuario_idusuario`),
  KEY `fk_seccion_usuario1_idx` (`usuario_idusuario`),
  CONSTRAINT `fk_seccion_usuario1` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `stampticket`
-- ----------------------------
DROP TABLE IF EXISTS `stampticket`;
CREATE TABLE `stampticket` (
  `idstampticket` int(11) NOT NULL AUTO_INCREMENT,
  `folioticket` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idstampticket`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `sucursal`
-- ----------------------------
DROP TABLE IF EXISTS `sucursal`;
CREATE TABLE `sucursal` (
  `idsucursal` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `gps` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idsucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `sucursal`
-- ----------------------------
BEGIN;
INSERT INTO `sucursal` VALUES ('1', 'Matriz', 'Av. San Pedro Num. Conocido', '4771234567', '24.2685,26.6589'), ('2', 'Centro', 'Col. Centro', '4771234567', '200.3465,100.7655434');
COMMIT;

-- ----------------------------
--  Table structure for `ticket`
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket` (
  `idticket` int(11) NOT NULL AUTO_INCREMENT,
  `orden_idorden` int(11) NOT NULL,
  `stampticket_idstampticket` int(11) NOT NULL,
  PRIMARY KEY (`idticket`,`orden_idorden`,`stampticket_idstampticket`),
  KEY `fk_ticket_orden1_idx` (`orden_idorden`),
  KEY `fk_ticket_stampticket1_idx` (`stampticket_idstampticket`),
  CONSTRAINT `fk_ticket_orden1` FOREIGN KEY (`orden_idorden`) REFERENCES `orden` (`idorden`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ticket_stampticket1` FOREIGN KEY (`stampticket_idstampticket`) REFERENCES `stampticket` (`idstampticket`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tipoorden`
-- ----------------------------
DROP TABLE IF EXISTS `tipoorden`;
CREATE TABLE `tipoorden` (
  `idtipoorden` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtipoorden`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tipoorden`
-- ----------------------------
BEGIN;
INSERT INTO `tipoorden` VALUES ('1', 'local'), ('2', 'foranea');
COMMIT;

-- ----------------------------
--  Table structure for `tipousuario`
-- ----------------------------
DROP TABLE IF EXISTS `tipousuario`;
CREATE TABLE `tipousuario` (
  `idtipousuario` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL COMMENT '-administrador\n-supervisor\n-mesero\n-repartidor\n-caja',
  PRIMARY KEY (`idtipousuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tipousuario`
-- ----------------------------
BEGIN;
INSERT INTO `tipousuario` VALUES ('1', 'local'), ('2', 'foraneo');
COMMIT;

-- ----------------------------
--  Table structure for `usuario`
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `usr` varchar(45) DEFAULT NULL,
  `pwd` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fotoavatar` varchar(255) DEFAULT NULL,
  `turno` varchar(45) DEFAULT NULL,
  `estatus` varchar(45) DEFAULT NULL,
  `privilegios_idprivilegios` int(11) NOT NULL,
  `tipousuario_idtipousuario` int(11) NOT NULL,
  `sucursal_idsucursal` int(11) NOT NULL,
  PRIMARY KEY (`idusuario`,`privilegios_idprivilegios`,`tipousuario_idtipousuario`,`sucursal_idsucursal`),
  KEY `fk_usuario_privilegios1_idx` (`privilegios_idprivilegios`),
  KEY `fk_usuario_tipousuario1_idx` (`tipousuario_idtipousuario`),
  KEY `fk_usuario_sucursal1_idx` (`sucursal_idsucursal`),
  CONSTRAINT `fk_usuario_privilegios1` FOREIGN KEY (`privilegios_idprivilegios`) REFERENCES `privilegios` (`idprivilegios`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_sucursal1` FOREIGN KEY (`sucursal_idsucursal`) REFERENCES `sucursal` (`idsucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_tipousuario1` FOREIGN KEY (`tipousuario_idtipousuario`) REFERENCES `tipousuario` (`idtipousuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `usuario`
-- ----------------------------
BEGIN;
INSERT INTO `usuario` VALUES ('1', 'superuser', 'superusergios', 'Super Usuario', null, 'superuser@sergiospizza.com', null, 'completo', 'activo', '1', '1', '1'), ('3', 'admin', 'adminsergios', 'Administrador', null, 'admin@sergiospizza.com', null, 'completo', 'activo', '2', '1', '1'), ('4', 'orden', 'ordensergios', 'Ordenes', 'Sergio\'s Pizza', 'orden@sergiospizza.com', null, 'completo', 'activo', '3', '1', '1'), ('5', 'restaurante', 'restaurantesergios', 'Restaurante', 'Sergio\'s Pizza', 'restaurante@sergiospizza.com', null, 'completo', 'activo', '7', '1', '1'), ('6', 'pizzeria', 'pizzeriasergios', 'Pizzeria', 'Sergio\'s Pizza', 'pizzeria@sergiospizza.com', null, 'completo', 'activo', '8', '1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `ventas`
-- ----------------------------
DROP TABLE IF EXISTS `ventas`;
CREATE TABLE `ventas` (
  `idventas` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` varchar(45) DEFAULT NULL,
  `estatus` varchar(45) DEFAULT NULL,
  `stampticket_idstampticket` int(11) NOT NULL,
  `cliente_idcliente` int(11) NOT NULL,
  PRIMARY KEY (`idventas`,`stampticket_idstampticket`,`cliente_idcliente`),
  KEY `fk_ventas_stampticket1_idx` (`stampticket_idstampticket`),
  KEY `fk_ventas_cliente1_idx` (`cliente_idcliente`),
  CONSTRAINT `fk_ventas_cliente1` FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente` (`idcliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ventas_stampticket1` FOREIGN KEY (`stampticket_idstampticket`) REFERENCES `stampticket` (`idstampticket`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
