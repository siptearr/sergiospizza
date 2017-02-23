/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : softjit1_restaurante

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2017-01-18 16:55:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for almacen
-- ----------------------------
DROP TABLE IF EXISTS `almacen`;
CREATE TABLE `almacen` (
  `idalmacen` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idalmacen`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of almacen
-- ----------------------------
INSERT INTO `almacen` VALUES ('1', 'almacen general');

-- ----------------------------
-- Table structure for asignaciones
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of asignaciones
-- ----------------------------
INSERT INTO `asignaciones` VALUES ('1', 'proveedor', 'si', 'si', 'si', 'si', '2');
INSERT INTO `asignaciones` VALUES ('2', 'almacen', 'si', 'si', 'si', 'si', '2');
INSERT INTO `asignaciones` VALUES ('3', 'ingrediente', 'si', 'si', 'si', 'si', '2');
INSERT INTO `asignaciones` VALUES ('4', 'mesa', 'si', 'si', 'si', 'si', '2');
INSERT INTO `asignaciones` VALUES ('5', 'sucursal', 'si', 'si', 'si', 'si', '2');
INSERT INTO `asignaciones` VALUES ('6', 'tipousuario', 'si', 'si', 'si', 'si', '2');
INSERT INTO `asignaciones` VALUES ('9', 'familia', 'si', 'si', 'si', 'si', '2');
INSERT INTO `asignaciones` VALUES ('10', 'grupo', 'si', 'si', 'si', 'si', '2');
INSERT INTO `asignaciones` VALUES ('11', 'producto', 'si', 'si', 'si', 'si', '2');
INSERT INTO `asignaciones` VALUES ('12', 'tipoorden', 'si', 'si', 'si', 'si', '2');
INSERT INTO `asignaciones` VALUES ('13', 'cliente', 'si', 'si', 'si', 'si', '2');
INSERT INTO `asignaciones` VALUES ('14', 'orden', 'si', 'si', 'si', 'si', '3');
INSERT INTO `asignaciones` VALUES ('15', 'orden', 'si', 'si', 'si', 'si', '7');
INSERT INTO `asignaciones` VALUES ('16', 'orden', 'si', 'si', 'si', 'si', '8');
INSERT INTO `asignaciones` VALUES ('17', 'orden', 'si', 'si', 'si', 'si', '4');

-- ----------------------------
-- Table structure for caja
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
-- Records of caja
-- ----------------------------

-- ----------------------------
-- Table structure for cliente
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
-- Records of cliente
-- ----------------------------
INSERT INTO `cliente` VALUES ('1', 'Publico en general', 'SIN RFC', 'Publico en General', 'N/A', 'N/A', 'N/A', '10', 'activo');
INSERT INTO `cliente` VALUES ('2', 'Persona Fisica', 'TEAR8006198Q2', 'Ricardo Teran Arcibar', 'Blv. Adolfo Lopez Mateos s/n', '36000', '4734594141', '10', 'activo');

-- ----------------------------
-- Table structure for compras
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
-- Records of compras
-- ----------------------------

-- ----------------------------
-- Table structure for configuracion
-- ----------------------------
DROP TABLE IF EXISTS `configuracion`;
CREATE TABLE `configuracion` (
  `idconfiguracion` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idconfiguracion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of configuracion
-- ----------------------------
INSERT INTO `configuracion` VALUES ('1', '2016-09-13', 'main');

-- ----------------------------
-- Table structure for contenido
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
-- Records of contenido
-- ----------------------------

-- ----------------------------
-- Table structure for entrega
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
-- Records of entrega
-- ----------------------------

-- ----------------------------
-- Table structure for estado
-- ----------------------------
DROP TABLE IF EXISTS `estado`;
CREATE TABLE `estado` (
  `idestado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `cve` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idestado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of estado
-- ----------------------------

-- ----------------------------
-- Table structure for familia
-- ----------------------------
DROP TABLE IF EXISTS `familia`;
CREATE TABLE `familia` (
  `idfamilia` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL COMMENT '-restaurant\n-pizzeria\n-postres\n-bebidas\n',
  PRIMARY KEY (`idfamilia`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of familia
-- ----------------------------
INSERT INTO `familia` VALUES ('1', 'Pizzeria');
INSERT INTO `familia` VALUES ('2', 'Cocina');
INSERT INTO `familia` VALUES ('3', 'Bebidas');
INSERT INTO `familia` VALUES ('4', 'Postres');

-- ----------------------------
-- Table structure for grupo
-- ----------------------------
DROP TABLE IF EXISTS `grupo`;
CREATE TABLE `grupo` (
  `idgrupo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `familia_idfamilia` int(11) NOT NULL,
  PRIMARY KEY (`idgrupo`,`familia_idfamilia`),
  KEY `fk_grupo_familia1_idx` (`familia_idfamilia`),
  CONSTRAINT `fk_grupo_familia1` FOREIGN KEY (`familia_idfamilia`) REFERENCES `familia` (`idfamilia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grupo
-- ----------------------------
INSERT INTO `grupo` VALUES ('1', 'pastas', '2');
INSERT INTO `grupo` VALUES ('2', 'carnes', '2');
INSERT INTO `grupo` VALUES ('3', 'hamburguesas', '2');
INSERT INTO `grupo` VALUES ('4', 'postres', '4');
INSERT INTO `grupo` VALUES ('5', 'cremas', '2');
INSERT INTO `grupo` VALUES ('6', 'otrosplatillos', '2');
INSERT INTO `grupo` VALUES ('7', 'bebidas', '3');
INSERT INTO `grupo` VALUES ('8', 'pizzas', '1');

-- ----------------------------
-- Table structure for ingrediente
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ingrediente
-- ----------------------------
INSERT INTO `ingrediente` VALUES ('1', 'harina', 'normal', '10', 'kilogramo', '100', '10', '1');
INSERT INTO `ingrediente` VALUES ('2', 'queso manchego', 'normal', '0.5', 'gramo', '10000', '1000', '1');

-- ----------------------------
-- Table structure for localidad
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
-- Records of localidad
-- ----------------------------

-- ----------------------------
-- Table structure for mesa
-- ----------------------------
DROP TABLE IF EXISTS `mesa`;
CREATE TABLE `mesa` (
  `idmesa` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(45) DEFAULT NULL,
  `ubicacion` varchar(255) DEFAULT NULL,
  `estatus` varchar(45) DEFAULT NULL,
  `sucursal_idsucursal` int(11) NOT NULL,
  PRIMARY KEY (`idmesa`,`sucursal_idsucursal`),
  KEY `fk_mesa_sucursal1_idx` (`sucursal_idsucursal`),
  CONSTRAINT `fk_mesa_sucursal1` FOREIGN KEY (`sucursal_idsucursal`) REFERENCES `sucursal` (`idsucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mesa
-- ----------------------------
INSERT INTO `mesa` VALUES ('1', '1', 'Planta Baja', 'disponible', '1');
INSERT INTO `mesa` VALUES ('2', '2', 'Planta Baja', 'ocupada', '1');
INSERT INTO `mesa` VALUES ('3', '3', 'Planta Baja', 'disponible', '1');
INSERT INTO `mesa` VALUES ('4', '4', 'Planta Baja', 'disponible', '1');
INSERT INTO `mesa` VALUES ('5', '5', 'Planta Baja', 'disponible', '1');
INSERT INTO `mesa` VALUES ('6', '6', 'Planta Baja', 'disponible', '1');
INSERT INTO `mesa` VALUES ('7', '7', 'Planta Alta', 'disponible', '1');
INSERT INTO `mesa` VALUES ('8', '8', 'Planta Alta', 'disponible', '1');
INSERT INTO `mesa` VALUES ('9', '9', 'Planta Alta', 'disponible', '1');
INSERT INTO `mesa` VALUES ('10', '10', 'Planta Alta', 'disponible', '1');
INSERT INTO `mesa` VALUES ('11', '11', 'Planta Alta', 'disponible', '1');
INSERT INTO `mesa` VALUES ('12', '12', 'Planta Alta', 'disponible', '1');
INSERT INTO `mesa` VALUES ('13', '13', 'Planta Alta', 'disponible', '1');
INSERT INTO `mesa` VALUES ('14', '14', 'Planta Alta', 'disponible', '1');
INSERT INTO `mesa` VALUES ('15', '15', 'Planta Alta', 'disponible', '1');
INSERT INTO `mesa` VALUES ('16', '16', 'Planta Alta', 'disponible', '1');
INSERT INTO `mesa` VALUES ('17', '17', 'Planta Alta', 'disponible', '1');
INSERT INTO `mesa` VALUES ('18', '18', 'Planta Alta', 'disponible', '1');
INSERT INTO `mesa` VALUES ('19', '19', 'Planta Alta', 'disponible', '1');
INSERT INTO `mesa` VALUES ('20', '20', 'Planta Alta', 'disponible', '1');

-- ----------------------------
-- Table structure for municipio
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
-- Records of municipio
-- ----------------------------

-- ----------------------------
-- Table structure for orden
-- ----------------------------
DROP TABLE IF EXISTS `orden`;
CREATE TABLE `orden` (
  `idorden` int(11) NOT NULL AUTO_INCREMENT,
  `inicio` timestamp NULL DEFAULT NULL,
  `entregaaproximada` datetime DEFAULT NULL,
  `horaentrega` datetime DEFAULT NULL,
  `multipleingrediente` varchar(2048) DEFAULT NULL,
  `observaciones` varchar(1048) DEFAULT NULL,
  `estatus` varchar(45) DEFAULT NULL,
  `mesa_idmesa` int(11) NOT NULL,
  `porcion_idporcion` int(11) NOT NULL,
  `producto_idproducto` int(11) NOT NULL,
  `tipoorden_idtipoorden` int(11) NOT NULL,
  `familia_idfamilia` int(11) NOT NULL,
  `sucursal_idsucursal` int(11) NOT NULL,
  `cliente_idcliente` int(11) NOT NULL,
  `usuario_idusuario` int(11) NOT NULL,
  PRIMARY KEY (`idorden`,`mesa_idmesa`,`porcion_idporcion`,`producto_idproducto`,`tipoorden_idtipoorden`,`familia_idfamilia`,`sucursal_idsucursal`,`cliente_idcliente`,`usuario_idusuario`),
  KEY `fk_orden_tipoorden1_idx` (`tipoorden_idtipoorden`),
  KEY `fk_orden_familia1_idx` (`familia_idfamilia`),
  KEY `fk_orden_mesa1_idx` (`mesa_idmesa`),
  KEY `fk_orden_producto1_idx` (`producto_idproducto`),
  KEY `fk_orden_sucursal1_idx` (`sucursal_idsucursal`),
  KEY `fk_orden_usuario1_idx` (`usuario_idusuario`),
  KEY `fk_orden_cliente1_idx` (`cliente_idcliente`),
  KEY `fk_orden_porcion1_idx` (`porcion_idporcion`),
  CONSTRAINT `fk_orden_cliente1` FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente` (`idcliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orden_familia1` FOREIGN KEY (`familia_idfamilia`) REFERENCES `familia` (`idfamilia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orden_mesa1` FOREIGN KEY (`mesa_idmesa`) REFERENCES `mesa` (`idmesa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orden_porcion1` FOREIGN KEY (`porcion_idporcion`) REFERENCES `porcion` (`idporcion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orden_producto1` FOREIGN KEY (`producto_idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orden_sucursal1` FOREIGN KEY (`sucursal_idsucursal`) REFERENCES `sucursal` (`idsucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orden_tipoorden1` FOREIGN KEY (`tipoorden_idtipoorden`) REFERENCES `tipoorden` (`idtipoorden`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orden_usuario1` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orden
-- ----------------------------
INSERT INTO `orden` VALUES ('1', '2016-12-07 18:52:21', '2016-12-07 18:52:21', '2016-12-07 18:52:21', null, null, 'activo', '12', '1', '80', '1', '2', '1', '1', '1');
INSERT INTO `orden` VALUES ('2', '2016-12-07 19:17:03', '2016-12-07 19:17:03', '2016-12-07 19:17:03', null, null, 'activo', '10', '1', '15', '1', '1', '1', '1', '4');
INSERT INTO `orden` VALUES ('3', '2016-12-07 21:40:27', '2016-12-07 21:40:27', '2016-12-07 21:40:27', null, null, 'activo', '10', '1', '9', '1', '1', '1', '2', '4');
INSERT INTO `orden` VALUES ('4', '2016-12-07 21:43:08', '2016-12-07 21:43:08', '2016-12-07 21:43:08', null, null, 'activo', '10', '3', '12', '2', '1', '1', '2', '4');
INSERT INTO `orden` VALUES ('5', '2016-12-07 21:44:54', '2016-12-07 21:44:54', '2016-12-07 21:44:54', null, null, 'activo', '10', '1', '17', '2', '1', '1', '2', '4');
INSERT INTO `orden` VALUES ('6', '2016-12-07 21:50:36', '2016-12-07 21:50:36', '2016-12-07 21:50:36', null, null, 'activo', '12', '1', '78', '2', '2', '1', '1', '4');
INSERT INTO `orden` VALUES ('7', '2016-12-07 22:39:51', '2016-12-07 22:39:51', '2016-12-07 22:39:51', null, null, 'activo', '5', '1', '3', '3', '1', '1', '1', '4');
INSERT INTO `orden` VALUES ('8', '2016-12-07 23:00:38', '2016-12-07 23:00:38', '2016-12-07 23:00:38', null, null, 'activo', '14', '1', '102', '3', '2', '1', '1', '4');
INSERT INTO `orden` VALUES ('9', '2016-12-07 23:07:34', '2016-12-07 23:07:34', '2016-12-07 23:07:34', null, null, 'activo', '5', '1', '12', '3', '1', '1', '1', '4');
INSERT INTO `orden` VALUES ('10', '2016-12-07 23:10:16', '2016-12-07 23:10:16', '2016-12-07 23:10:16', null, null, 'activo', '8', '1', '11', '1', '1', '1', '1', '4');

-- ----------------------------
-- Table structure for orden_has_ingrediente
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
-- Records of orden_has_ingrediente
-- ----------------------------

-- ----------------------------
-- Table structure for porcion
-- ----------------------------
DROP TABLE IF EXISTS `porcion`;
CREATE TABLE `porcion` (
  `idporcion` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idporcion`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of porcion
-- ----------------------------
INSERT INTO `porcion` VALUES ('1', '1/1');
INSERT INTO `porcion` VALUES ('2', '1/2');
INSERT INTO `porcion` VALUES ('3', '1/3');
INSERT INTO `porcion` VALUES ('4', '1/4');
INSERT INTO `porcion` VALUES ('5', '2/3');
INSERT INTO `porcion` VALUES ('6', '3/4');

-- ----------------------------
-- Table structure for privilegios
-- ----------------------------
DROP TABLE IF EXISTS `privilegios`;
CREATE TABLE `privilegios` (
  `idprivilegios` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idprivilegios`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of privilegios
-- ----------------------------
INSERT INTO `privilegios` VALUES ('1', 'superusuario');
INSERT INTO `privilegios` VALUES ('2', 'administrador');
INSERT INTO `privilegios` VALUES ('3', 'orden');
INSERT INTO `privilegios` VALUES ('4', 'venta');
INSERT INTO `privilegios` VALUES ('5', 'compra');
INSERT INTO `privilegios` VALUES ('6', 'caja');
INSERT INTO `privilegios` VALUES ('7', 'restaurante');
INSERT INTO `privilegios` VALUES ('8', 'pizzeria');

-- ----------------------------
-- Table structure for producto
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
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of producto
-- ----------------------------
INSERT INTO `producto` VALUES ('1', 'Espaguetti al burro', null, '60', '20', '1');
INSERT INTO `producto` VALUES ('2', 'Espaguetti a la boloñesa', null, null, null, '1');
INSERT INTO `producto` VALUES ('3', '1/2 orden de Espaguetti', null, null, null, '1');
INSERT INTO `producto` VALUES ('4', 'Carne Asada', null, null, null, '2');
INSERT INTO `producto` VALUES ('5', 'Milanesa de res con papas', null, null, null, '2');
INSERT INTO `producto` VALUES ('6', 'Hamburguesa sencilla', null, null, null, '3');
INSERT INTO `producto` VALUES ('7', 'Hamburguesa Hawaiana', null, null, null, '3');
INSERT INTO `producto` VALUES ('8', 'Hamburguesa Especial', null, null, null, '3');
INSERT INTO `producto` VALUES ('9', 'Hamburguesa sencilla con papas', null, null, null, '3');
INSERT INTO `producto` VALUES ('10', 'Hamburguesa hawaiana con papas', null, null, null, '3');
INSERT INTO `producto` VALUES ('11', 'Hamburguesa especial con papas', null, null, null, '3');
INSERT INTO `producto` VALUES ('12', 'Chongos', null, null, null, '4');
INSERT INTO `producto` VALUES ('13', 'Durazno en almibar', null, null, null, '4');
INSERT INTO `producto` VALUES ('14', 'Crema de champiñones', null, null, null, '5');
INSERT INTO `producto` VALUES ('15', 'Crema de elote', null, null, null, '5');
INSERT INTO `producto` VALUES ('16', 'Crema de esparragos', null, null, null, '5');
INSERT INTO `producto` VALUES ('17', 'Ensalada de jamón', null, null, null, '6');
INSERT INTO `producto` VALUES ('18', 'Queso fundido', null, null, null, '6');
INSERT INTO `producto` VALUES ('19', 'Queso fundido (chorizo)', null, null, null, '6');
INSERT INTO `producto` VALUES ('20', 'Queso fundido (bistec)', null, null, null, '6');
INSERT INTO `producto` VALUES ('21', 'Queso fundido (champiñones)', null, null, null, '6');
INSERT INTO `producto` VALUES ('22', 'Club sandwich', null, null, null, '6');
INSERT INTO `producto` VALUES ('23', 'Orden de quesadillas', null, null, null, '6');
INSERT INTO `producto` VALUES ('24', 'Orden de papas', null, null, null, '6');
INSERT INTO `producto` VALUES ('25', 'Orden de pan de ajo', null, null, null, '6');
INSERT INTO `producto` VALUES ('26', 'Refresco', null, null, null, '7');
INSERT INTO `producto` VALUES ('27', 'Coca cola 2 ½ LT', null, null, null, '7');
INSERT INTO `producto` VALUES ('28', 'Coca cola taparrosca', null, null, null, '7');
INSERT INTO `producto` VALUES ('29', 'Nescafe', null, null, null, '7');
INSERT INTO `producto` VALUES ('30', 'Jarra de agua (Jamaica)', null, null, null, '7');
INSERT INTO `producto` VALUES ('31', 'Jarra de agua (Horchata)', null, null, null, '7');
INSERT INTO `producto` VALUES ('32', '1/2 Jarra de agua (Jamaica)', null, null, null, '7');
INSERT INTO `producto` VALUES ('33', '1/2 Jarra de agua (Horchata)', null, null, null, '7');
INSERT INTO `producto` VALUES ('34', 'Bisteck', 'Personal', null, null, '8');
INSERT INTO `producto` VALUES ('35', 'Bisteck', 'Chica', null, null, '8');
INSERT INTO `producto` VALUES ('36', 'Bisteck', 'Mediana', null, null, '8');
INSERT INTO `producto` VALUES ('37', 'Bisteck', 'Grande', null, null, '8');
INSERT INTO `producto` VALUES ('38', 'Bisteck', 'Jumbo', null, null, '8');
INSERT INTO `producto` VALUES ('39', 'Salami', 'Personal', null, null, '8');
INSERT INTO `producto` VALUES ('40', 'Salami', 'Chica', null, null, '8');
INSERT INTO `producto` VALUES ('41', 'Salami', 'Mediana', null, null, '8');
INSERT INTO `producto` VALUES ('42', 'Salami', 'Grande', null, null, '8');
INSERT INTO `producto` VALUES ('43', 'Salami', 'Jumbo', null, null, '8');
INSERT INTO `producto` VALUES ('44', 'Salami y Carne molida', 'Personal', null, null, '8');
INSERT INTO `producto` VALUES ('45', 'Salami y Carne molida', 'Chica', null, null, '8');
INSERT INTO `producto` VALUES ('46', 'Salami y Carne molida', 'Mediana', null, null, '8');
INSERT INTO `producto` VALUES ('47', 'Salami y Carne molida', 'Grande', null, null, '8');
INSERT INTO `producto` VALUES ('48', 'Salami y Carne molida', 'Jumbo', null, null, '8');
INSERT INTO `producto` VALUES ('49', 'Jamon', 'Personal', null, null, '8');
INSERT INTO `producto` VALUES ('50', 'Jamon', 'Chica', null, null, '8');
INSERT INTO `producto` VALUES ('51', 'Jamon', 'Mediana', null, null, '8');
INSERT INTO `producto` VALUES ('52', 'Jamon', 'Grande', null, null, '8');
INSERT INTO `producto` VALUES ('53', 'Jamon', 'Jumbo', null, null, '8');
INSERT INTO `producto` VALUES ('54', 'Jamon y Piña', 'Personal', null, null, '8');
INSERT INTO `producto` VALUES ('55', 'Jamon y Piña', 'Chica', null, null, '8');
INSERT INTO `producto` VALUES ('56', 'Jamon y Piña', 'Mediana', null, null, '8');
INSERT INTO `producto` VALUES ('57', 'Jamon y Piña', 'Grande', null, null, '8');
INSERT INTO `producto` VALUES ('58', 'Jamon y Piña', 'Jumbo', null, null, '8');
INSERT INTO `producto` VALUES ('59', 'Sergio\'s', 'Personal', null, null, '8');
INSERT INTO `producto` VALUES ('60', 'Sergio\'s', 'Chica', null, null, '8');
INSERT INTO `producto` VALUES ('61', 'Sergio\'s', 'Mediana', null, null, '8');
INSERT INTO `producto` VALUES ('62', 'Sergio\'s', 'Grande', null, null, '8');
INSERT INTO `producto` VALUES ('63', 'Sergio\'s', 'Jumbo', null, null, '8');
INSERT INTO `producto` VALUES ('64', 'Champiñones', 'Personal', null, null, '8');
INSERT INTO `producto` VALUES ('65', 'Champiñones', 'Chica', null, null, '8');
INSERT INTO `producto` VALUES ('66', 'Champiñones', 'Mediana', null, null, '8');
INSERT INTO `producto` VALUES ('67', 'Champiñones', 'Grande', null, null, '8');
INSERT INTO `producto` VALUES ('68', 'Champiñones', 'Jumbo', null, null, '8');
INSERT INTO `producto` VALUES ('69', 'Suprema', 'Personal', null, null, '8');
INSERT INTO `producto` VALUES ('70', 'Suprema', 'Chica', null, null, '8');
INSERT INTO `producto` VALUES ('71', 'Suprema', 'Mediana', null, null, '8');
INSERT INTO `producto` VALUES ('72', 'Suprema', 'Grande', null, null, '8');
INSERT INTO `producto` VALUES ('73', 'Suprema', 'Jumbo', null, null, '8');
INSERT INTO `producto` VALUES ('74', 'Champiñones y Carne molida', 'Personal', null, null, '8');
INSERT INTO `producto` VALUES ('75', 'Champiñones y Carne molida', 'Chica', null, null, '8');
INSERT INTO `producto` VALUES ('76', 'Champiñones y Carne molida', 'Mediana', null, null, '8');
INSERT INTO `producto` VALUES ('77', 'Champiñones y Carne molida', 'Grande', null, null, '8');
INSERT INTO `producto` VALUES ('78', 'Champiñones y Carne molida', 'Jumbo', null, null, '8');
INSERT INTO `producto` VALUES ('79', 'Mexicana', 'Personal', null, null, '8');
INSERT INTO `producto` VALUES ('80', 'Mexicana', 'Chica', null, null, '8');
INSERT INTO `producto` VALUES ('81', 'Mexicana', 'Mediana', null, null, '8');
INSERT INTO `producto` VALUES ('82', 'Mexicana', 'Grande', null, null, '8');
INSERT INTO `producto` VALUES ('83', 'Mexicana', 'Jumbo', null, null, '8');
INSERT INTO `producto` VALUES ('84', 'Tocino con cebolla', 'Personal', null, null, '8');
INSERT INTO `producto` VALUES ('85', 'Tocino con cebolla', 'Chica', null, null, '8');
INSERT INTO `producto` VALUES ('86', 'Tocino con cebolla', 'Mediana', null, null, '8');
INSERT INTO `producto` VALUES ('87', 'Tocino con cebolla', 'Grande', null, null, '8');
INSERT INTO `producto` VALUES ('88', 'Tocino con cebolla', 'Jumbo', null, null, '8');
INSERT INTO `producto` VALUES ('89', 'Chorizo con cebolla', 'Personal', null, null, '8');
INSERT INTO `producto` VALUES ('90', 'Chorizo con cebolla', 'Chica', null, null, '8');
INSERT INTO `producto` VALUES ('91', 'Chorizo con cebolla', 'Mediana', null, null, '8');
INSERT INTO `producto` VALUES ('92', 'Chorizo con cebolla', 'Grande', null, null, '8');
INSERT INTO `producto` VALUES ('93', 'Chorizo con cebolla', 'Jumbo', null, null, '8');
INSERT INTO `producto` VALUES ('94', 'Atun', 'Personal', null, null, '8');
INSERT INTO `producto` VALUES ('95', 'Atun', 'Chica', null, null, '8');
INSERT INTO `producto` VALUES ('96', 'Atun', 'Mediana', null, null, '8');
INSERT INTO `producto` VALUES ('97', 'Atun', 'Grande', null, null, '8');
INSERT INTO `producto` VALUES ('98', 'Atun', 'Jumbo', null, null, '8');
INSERT INTO `producto` VALUES ('99', 'Camarones', 'Personal', null, null, '8');
INSERT INTO `producto` VALUES ('100', 'Camarones', 'Chica', null, null, '8');
INSERT INTO `producto` VALUES ('101', 'Camarones', 'Mediana', null, null, '8');
INSERT INTO `producto` VALUES ('102', 'Camarones', 'Grande', null, null, '8');
INSERT INTO `producto` VALUES ('103', 'Camarones', 'Jumbo', null, null, '8');
INSERT INTO `producto` VALUES ('104', 'Vegetariana', 'Personal', null, null, '8');
INSERT INTO `producto` VALUES ('105', 'Vegetariana', 'Chica', null, null, '8');
INSERT INTO `producto` VALUES ('106', 'Vegetariana', 'Mediana', null, null, '8');
INSERT INTO `producto` VALUES ('107', 'Vegetariana', 'Grande', null, null, '8');
INSERT INTO `producto` VALUES ('108', 'Vegetariana', 'Jumbo', null, null, '8');
INSERT INTO `producto` VALUES ('109', 'Camarones con Champiñones', 'Personal', null, null, '8');
INSERT INTO `producto` VALUES ('110', 'Camarones con Champiñones', 'Chica', null, null, '8');
INSERT INTO `producto` VALUES ('111', 'Camarones con Champiñones', 'Mediana', null, null, '8');
INSERT INTO `producto` VALUES ('112', 'Camarones con Champiñones', 'Grande', null, null, '8');
INSERT INTO `producto` VALUES ('113', 'Camarones con Champiñones', 'Jumbo', null, null, '8');
INSERT INTO `producto` VALUES ('114', 'Salchicha Viena', 'Personal', null, null, '8');
INSERT INTO `producto` VALUES ('115', 'Salchicha Viena', 'Chica', null, null, '8');
INSERT INTO `producto` VALUES ('116', 'Salchicha Viena', 'Mediana', null, null, '8');
INSERT INTO `producto` VALUES ('117', 'Salchicha Viena', 'Grande', null, null, '8');
INSERT INTO `producto` VALUES ('118', 'Salchicha Viena', 'Jumbo', null, null, '8');
INSERT INTO `producto` VALUES ('119', 'De Mariscos', 'Personal', null, null, '8');
INSERT INTO `producto` VALUES ('120', 'De Mariscos', 'Chica', null, null, '8');
INSERT INTO `producto` VALUES ('121', 'De Mariscos', 'Mediana', null, null, '8');
INSERT INTO `producto` VALUES ('122', 'De Mariscos', 'Grande', null, null, '8');
INSERT INTO `producto` VALUES ('123', 'De Mariscos', 'Jumbo', null, null, '8');
INSERT INTO `producto` VALUES ('124', 'Especial', 'Personal', null, null, '8');
INSERT INTO `producto` VALUES ('125', 'Especial', 'Chica', null, null, '8');
INSERT INTO `producto` VALUES ('126', 'Especial', 'Mediana', null, null, '8');
INSERT INTO `producto` VALUES ('127', 'Especial', 'Grande', null, null, '8');
INSERT INTO `producto` VALUES ('128', 'Especial', 'Jumbo', null, null, '8');
INSERT INTO `producto` VALUES ('129', 'De Carnes frias', 'Personal', null, null, '8');
INSERT INTO `producto` VALUES ('130', 'De Carnes frias', 'Chica', null, null, '8');
INSERT INTO `producto` VALUES ('131', 'De Carnes frias', 'Mediana', null, null, '8');
INSERT INTO `producto` VALUES ('132', 'De Carnes frias', 'Grande', null, null, '8');
INSERT INTO `producto` VALUES ('133', 'De Carnes frias', 'Jumbo', null, null, '8');

-- ----------------------------
-- Table structure for producto_has_ingrediente
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
-- Records of producto_has_ingrediente
-- ----------------------------

-- ----------------------------
-- Table structure for proveedor
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
-- Records of proveedor
-- ----------------------------

-- ----------------------------
-- Table structure for seccion
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
-- Records of seccion
-- ----------------------------

-- ----------------------------
-- Table structure for stampticket
-- ----------------------------
DROP TABLE IF EXISTS `stampticket`;
CREATE TABLE `stampticket` (
  `idstampticket` int(11) NOT NULL AUTO_INCREMENT,
  `folioticket` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idstampticket`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stampticket
-- ----------------------------

-- ----------------------------
-- Table structure for sucursal
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
-- Records of sucursal
-- ----------------------------
INSERT INTO `sucursal` VALUES ('1', 'Matriz', 'Av. San Pedro Num. Conocido', '4771234567', '24.2685,26.6589');
INSERT INTO `sucursal` VALUES ('2', 'Centro', 'Col. Centro', '4771234567', '200.3465,100.7655434');

-- ----------------------------
-- Table structure for ticket
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
-- Records of ticket
-- ----------------------------

-- ----------------------------
-- Table structure for tipoorden
-- ----------------------------
DROP TABLE IF EXISTS `tipoorden`;
CREATE TABLE `tipoorden` (
  `idtipoorden` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtipoorden`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tipoorden
-- ----------------------------
INSERT INTO `tipoorden` VALUES ('1', 'Local');
INSERT INTO `tipoorden` VALUES ('2', 'Foranea');
INSERT INTO `tipoorden` VALUES ('3', 'Mostrador');

-- ----------------------------
-- Table structure for tipousuario
-- ----------------------------
DROP TABLE IF EXISTS `tipousuario`;
CREATE TABLE `tipousuario` (
  `idtipousuario` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL COMMENT '-administrador\n-supervisor\n-mesero\n-repartidor\n-caja',
  PRIMARY KEY (`idtipousuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tipousuario
-- ----------------------------
INSERT INTO `tipousuario` VALUES ('1', 'local');
INSERT INTO `tipousuario` VALUES ('2', 'foraneo');

-- ----------------------------
-- Table structure for usuario
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES ('1', 'superuser', 'superusergios', 'Super Usuario', 'Sergio\'s Pizza', 'superuser@sergiospizza.com', 'superuser.png', 'completo', 'activo', '1', '1', '1');
INSERT INTO `usuario` VALUES ('3', 'admin', 'adminsergios', 'Administrador', 'Sergio\'s Pizza', 'admin@sergiospizza.com', 'admin.png', 'completo', 'activo', '2', '1', '1');
INSERT INTO `usuario` VALUES ('4', 'mesero1', 'mesero123', 'Mesero 1', 'Sergio\'s Pizza', 'orden@sergiospizza.com', 'mesero1.png', 'completo', 'activo', '3', '1', '1');
INSERT INTO `usuario` VALUES ('5', 'cocina', 'cocinasergios', 'Cocina', 'Sergio\'s Pizza', 'restaurante@sergiospizza.com', 'cocina.png', 'completo', 'activo', '7', '1', '1');
INSERT INTO `usuario` VALUES ('6', 'pizzeria', 'pizzeriasergios', 'Pizzeria', 'Sergio\'s Pizza', 'pizzeria@sergiospizza.com', 'pizzeria.png', 'completo', 'activo', '8', '1', '1');
INSERT INTO `usuario` VALUES ('7', 'mostrador', 'mostradorsergios', 'Mostrador', 'Sergio\'s Pizza', 'mostrador@sergiospizza.com', 'mostrador.png', 'completo', 'activo', '4', '1', '1');

-- ----------------------------
-- Table structure for ventas
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

-- ----------------------------
-- Records of ventas
-- ----------------------------
