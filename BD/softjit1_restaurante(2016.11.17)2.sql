/*
Navicat MySQL Data Transfer

Source Server         : restaurant
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : softjit1_restaurante

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2016-11-17 23:33:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for almacen
-- ----------------------------
DROP TABLE IF EXISTS `almacen`;
CREATE TABLE `almacen` (
  `idalmacen` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idalmacen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of almacen
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

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
INSERT INTO `cliente` VALUES ('1', 'Persona Fisica', 'PUB160920', 'Publico General', 'N/A', 'N/A', 'N/A', '0', 'activo');
INSERT INTO `cliente` VALUES ('2', 'Publico en general', 'SIN RFC', 'Publico en general', 'N/A', 'N/A', 'N/A', '10', 'activo');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of familia
-- ----------------------------
INSERT INTO `familia` VALUES ('1', 'restaurante');
INSERT INTO `familia` VALUES ('2', 'pizzeria');
INSERT INTO `familia` VALUES ('3', 'otros');

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grupo
-- ----------------------------
INSERT INTO `grupo` VALUES ('1', 'pastas', '1');
INSERT INTO `grupo` VALUES ('2', 'carnes', '1');
INSERT INTO `grupo` VALUES ('3', 'hamburguesas', '1');
INSERT INTO `grupo` VALUES ('4', 'postres', '1');
INSERT INTO `grupo` VALUES ('5', 'cremas', '1');
INSERT INTO `grupo` VALUES ('6', 'otros', '1');
INSERT INTO `grupo` VALUES ('7', 'pizzas', '2');
INSERT INTO `grupo` VALUES ('8', 'bebidas', '1');

-- ----------------------------
-- Table structure for ingrediente
-- ----------------------------
DROP TABLE IF EXISTS `ingrediente`;
CREATE TABLE `ingrediente` (
  `idingrediente` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ingrediente
-- ----------------------------

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
  PRIMARY KEY (`idmesa`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mesa
-- ----------------------------
INSERT INTO `mesa` VALUES ('1', '1', 'planta baja');
INSERT INTO `mesa` VALUES ('2', '2', 'planta baja');
INSERT INTO `mesa` VALUES ('3', '3', 'planta baja');
INSERT INTO `mesa` VALUES ('4', '4', 'planta baja');
INSERT INTO `mesa` VALUES ('5', '5', 'planta baja');
INSERT INTO `mesa` VALUES ('6', '6', 'planta baja');
INSERT INTO `mesa` VALUES ('7', '7', 'planta baja');
INSERT INTO `mesa` VALUES ('8', '8', 'planta baja');
INSERT INTO `mesa` VALUES ('9', '9', 'planta baja');
INSERT INTO `mesa` VALUES ('10', '10', 'planta baja');
INSERT INTO `mesa` VALUES ('11', '11', 'planta baja');
INSERT INTO `mesa` VALUES ('12', '12', 'planta baja');
INSERT INTO `mesa` VALUES ('13', '13', 'planta baja');
INSERT INTO `mesa` VALUES ('14', '14', 'planta baja');
INSERT INTO `mesa` VALUES ('15', '15', 'planta baja');
INSERT INTO `mesa` VALUES ('16', '16', 'planta baja');
INSERT INTO `mesa` VALUES ('17', '17', 'planta baja');
INSERT INTO `mesa` VALUES ('18', '18', 'planta baja');
INSERT INTO `mesa` VALUES ('19', '19', 'planta baja');
INSERT INTO `mesa` VALUES ('20', '20', 'planta baja');

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
  `estatus` varchar(45) DEFAULT NULL,
  `tipoorden_idtipoorden` int(11) NOT NULL,
  `familia_idfamilia` int(11) NOT NULL,
  `mesa_idmesa` int(11) NOT NULL,
  `producto_idproducto` int(11) NOT NULL,
  `sucursal_idsucursal` int(11) NOT NULL,
  PRIMARY KEY (`idorden`,`tipoorden_idtipoorden`,`familia_idfamilia`,`mesa_idmesa`,`producto_idproducto`,`sucursal_idsucursal`),
  KEY `fk_orden_tipoorden1_idx` (`tipoorden_idtipoorden`),
  KEY `fk_orden_familia1_idx` (`familia_idfamilia`),
  KEY `fk_orden_mesa1_idx` (`mesa_idmesa`),
  KEY `fk_orden_producto1_idx` (`producto_idproducto`),
  KEY `fk_orden_sucursal1_idx` (`sucursal_idsucursal`),
  CONSTRAINT `fk_orden_familia1` FOREIGN KEY (`familia_idfamilia`) REFERENCES `familia` (`idfamilia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orden_mesa1` FOREIGN KEY (`mesa_idmesa`) REFERENCES `mesa` (`idmesa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orden_producto1` FOREIGN KEY (`producto_idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orden_sucursal1` FOREIGN KEY (`sucursal_idsucursal`) REFERENCES `sucursal` (`idsucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orden_tipoorden1` FOREIGN KEY (`tipoorden_idtipoorden`) REFERENCES `tipoorden` (`idtipoorden`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orden
-- ----------------------------
INSERT INTO `orden` VALUES ('1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'activo', '1', '1', '1', '1', '1');
INSERT INTO `orden` VALUES ('2', '2016-11-17 16:14:57', '2016-11-17 16:14:57', '2016-11-17 16:14:57', 'activo', '1', '1', '1', '1', '1');
INSERT INTO `orden` VALUES ('3', '2016-11-17 22:05:10', '2016-11-17 22:05:10', '2016-11-17 22:05:10', 'activo', '1', '2', '14', '85', '1');
INSERT INTO `orden` VALUES ('4', '2016-11-17 22:18:41', '2016-11-17 22:18:41', '2016-11-17 22:18:41', 'activo', '1', '2', '15', '38', '1');
INSERT INTO `orden` VALUES ('5', '2016-11-17 22:19:42', '2016-11-17 22:19:42', '2016-11-17 22:19:42', 'activo', '1', '1', '15', '14', '1');
INSERT INTO `orden` VALUES ('6', '2016-11-17 22:39:32', '2016-11-17 22:39:32', '2016-11-17 22:39:32', 'activo', '1', '1', '10', '11', '1');
INSERT INTO `orden` VALUES ('7', '2016-11-17 22:43:25', '2016-11-17 22:43:25', '2016-11-17 22:43:25', 'activo', '1', '2', '10', '110', '1');
INSERT INTO `orden` VALUES ('8', '2016-11-17 22:43:54', '2016-11-17 22:43:54', '2016-11-17 22:43:54', 'activo', '1', '2', '10', '126', '1');

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
  `tiempopreparacion` varchar(45) DEFAULT NULL,
  `tamaño` varchar(45) DEFAULT NULL,
  `precio` varchar(45) DEFAULT NULL,
  `grupo_idgrupo` int(11) NOT NULL,
  PRIMARY KEY (`idproducto`,`grupo_idgrupo`),
  KEY `fk_producto_grupo1_idx` (`grupo_idgrupo`),
  CONSTRAINT `fk_producto_grupo1` FOREIGN KEY (`grupo_idgrupo`) REFERENCES `grupo` (`idgrupo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of producto
-- ----------------------------
INSERT INTO `producto` VALUES ('1', 'Espaguetti al burro', '20', 'mediano', '60', '1');
INSERT INTO `producto` VALUES ('3', 'Espaguetti a la boloñesa', '20', 'mediano', '60', '1');
INSERT INTO `producto` VALUES ('4', '1/2 orden de Espaguetti', '20', 'chico', '60', '1');
INSERT INTO `producto` VALUES ('5', 'Carne Asada', '30', 'mediano', '60', '2');
INSERT INTO `producto` VALUES ('6', 'Milanesa de Res con papas', '30', 'mediano', '60', '2');
INSERT INTO `producto` VALUES ('7', 'Hamburguesa sencilla', '20', 'mediano', '60', '3');
INSERT INTO `producto` VALUES ('8', 'Hamburguesa Hawaiana', '20', 'mediano', '60', '3');
INSERT INTO `producto` VALUES ('9', 'Hamburguesa especial', '20', 'mediano', '60', '3');
INSERT INTO `producto` VALUES ('11', 'Hamburguesa sencilla con papas', '30', 'mediano', '80', '3');
INSERT INTO `producto` VALUES ('12', 'Hamburguesa hawaiana con papas', '30', 'mediano', '80', '3');
INSERT INTO `producto` VALUES ('13', 'Hamburguesa especial con papas', '30', 'mediano', '80', '3');
INSERT INTO `producto` VALUES ('14', 'Chongos', '10', 'chico', '30', '4');
INSERT INTO `producto` VALUES ('15', 'Durazno en almibar', '10', 'chico', '30', '4');
INSERT INTO `producto` VALUES ('16', 'Crema de champiñones', '20', 'chico', '30', '5');
INSERT INTO `producto` VALUES ('17', 'Crema de elote', '20', 'chico', '30', '5');
INSERT INTO `producto` VALUES ('18', 'Crema de esparragos', '20', 'chico', '30', '5');
INSERT INTO `producto` VALUES ('19', 'Ensalada de jamon', '10', 'mediano', '30', '6');
INSERT INTO `producto` VALUES ('20', 'Queso fundido', null, null, null, '6');
INSERT INTO `producto` VALUES ('21', 'Queso fundido (chorizo)', null, null, null, '6');
INSERT INTO `producto` VALUES ('22', 'Queso fundido (bistec)', null, null, null, '6');
INSERT INTO `producto` VALUES ('23', 'Queso fundido (champiñones)', null, null, null, '6');
INSERT INTO `producto` VALUES ('24', 'Orden de quesadillas', null, null, null, '6');
INSERT INTO `producto` VALUES ('25', 'Orden de papas', null, null, null, '6');
INSERT INTO `producto` VALUES ('26', 'Orden de pan de ajo', null, null, null, '6');
INSERT INTO `producto` VALUES ('27', 'Refresco', null, null, null, '8');
INSERT INTO `producto` VALUES ('28', 'Coca cola 2 ½ LT', null, null, null, '8');
INSERT INTO `producto` VALUES ('29', 'Coca taparrosca', null, null, null, '8');
INSERT INTO `producto` VALUES ('30', 'Nescafe', null, null, null, '8');
INSERT INTO `producto` VALUES ('31', 'Jarra de agua (Jamaica)', null, null, null, '8');
INSERT INTO `producto` VALUES ('32', 'Jarra de agua (Horchata)', null, null, null, '8');
INSERT INTO `producto` VALUES ('33', '1/2 Jarra de agua (Jamaica)', null, null, null, '8');
INSERT INTO `producto` VALUES ('35', '1/2 Jarra de agua (Horchata)', null, null, null, '8');
INSERT INTO `producto` VALUES ('36', 'Bisteck (personal)', null, null, null, '7');
INSERT INTO `producto` VALUES ('37', 'Bisteck (chica)', null, null, null, '7');
INSERT INTO `producto` VALUES ('38', 'Bisteck (mediana)', null, null, null, '7');
INSERT INTO `producto` VALUES ('39', 'Bisteck (grande)', null, null, null, '7');
INSERT INTO `producto` VALUES ('40', 'Bisteck (jumbo)', null, null, null, '7');
INSERT INTO `producto` VALUES ('41', 'Salami (personal)', null, null, null, '7');
INSERT INTO `producto` VALUES ('42', 'Salami (chica)', null, null, null, '7');
INSERT INTO `producto` VALUES ('43', 'Salami (mediana)', null, null, null, '7');
INSERT INTO `producto` VALUES ('44', 'Salami (grande)', null, null, null, '7');
INSERT INTO `producto` VALUES ('45', 'Salami (jumbo)', null, null, null, '7');
INSERT INTO `producto` VALUES ('46', 'Salami y Carne molida (personal)', null, null, null, '7');
INSERT INTO `producto` VALUES ('47', 'Salami y Carne molida (chica)', null, null, null, '7');
INSERT INTO `producto` VALUES ('48', 'Salami y Carne molida (mediana)', null, null, null, '7');
INSERT INTO `producto` VALUES ('49', 'Salami y Carne molida (grande)', null, null, null, '7');
INSERT INTO `producto` VALUES ('50', 'Salami y Carne molida (jumbo)', null, null, null, '7');
INSERT INTO `producto` VALUES ('51', 'Jamon (personal)', null, null, null, '7');
INSERT INTO `producto` VALUES ('52', 'Jamon (chica)', null, null, null, '7');
INSERT INTO `producto` VALUES ('53', 'Jamon (mediana)', null, null, null, '7');
INSERT INTO `producto` VALUES ('54', 'Jamon (grande)', null, null, null, '7');
INSERT INTO `producto` VALUES ('55', 'Jamon (jumbo)', null, null, null, '7');
INSERT INTO `producto` VALUES ('56', 'Jamon y Piña (personal)', null, null, null, '7');
INSERT INTO `producto` VALUES ('57', 'Jamon y Piña (chica)', null, null, null, '7');
INSERT INTO `producto` VALUES ('58', 'Jamon y Piña (mediana)', null, null, null, '7');
INSERT INTO `producto` VALUES ('59', 'Jamon y Piña (grande)', null, null, null, '7');
INSERT INTO `producto` VALUES ('60', 'Jamon y Piña (jumbo)', null, null, null, '7');
INSERT INTO `producto` VALUES ('61', 'Sergios (personal)', null, null, null, '7');
INSERT INTO `producto` VALUES ('62', 'Sergios (chica)', null, null, null, '7');
INSERT INTO `producto` VALUES ('63', 'Sergios (mediana)', null, null, null, '7');
INSERT INTO `producto` VALUES ('64', 'Sergios (grande)', null, null, null, '7');
INSERT INTO `producto` VALUES ('65', 'Sergios (jumbo)', null, null, null, '7');
INSERT INTO `producto` VALUES ('66', 'Champiñones (personal)', null, null, null, '7');
INSERT INTO `producto` VALUES ('67', 'Champiñones (chica)', null, null, null, '7');
INSERT INTO `producto` VALUES ('68', 'Champiñones (mediana)', null, null, null, '7');
INSERT INTO `producto` VALUES ('69', 'Champiñones (grande)', null, null, null, '7');
INSERT INTO `producto` VALUES ('71', 'Champiñones (jumbo)', null, null, null, '7');
INSERT INTO `producto` VALUES ('72', 'Suprema (personal)', null, null, null, '7');
INSERT INTO `producto` VALUES ('73', 'Suprema (chica)', null, null, null, '7');
INSERT INTO `producto` VALUES ('74', 'Suprema (mediana)', null, null, null, '7');
INSERT INTO `producto` VALUES ('75', 'Suprema (grande)', null, null, null, '7');
INSERT INTO `producto` VALUES ('76', 'Suprema (jumbo)', null, null, null, '7');
INSERT INTO `producto` VALUES ('77', 'Champiñones y Carne molida (personal)', null, null, null, '7');
INSERT INTO `producto` VALUES ('78', 'Champiñones y Carne molida (chica)', null, null, null, '7');
INSERT INTO `producto` VALUES ('79', 'Champiñones y Carne molida (mediana)', null, null, null, '7');
INSERT INTO `producto` VALUES ('80', 'Champiñones y Carne molida (grande)', null, null, null, '7');
INSERT INTO `producto` VALUES ('81', 'Champiñones y Carne molida (jumbo)', null, null, null, '7');
INSERT INTO `producto` VALUES ('82', 'Mexicana (personal)', null, null, null, '7');
INSERT INTO `producto` VALUES ('83', 'Mexicana (chica)', null, null, null, '7');
INSERT INTO `producto` VALUES ('84', 'Mexicana (mediana)', null, null, null, '7');
INSERT INTO `producto` VALUES ('85', 'Mexicana (grande)', null, null, null, '7');
INSERT INTO `producto` VALUES ('86', 'Mexicana (jumbo)', null, null, null, '7');
INSERT INTO `producto` VALUES ('87', 'Tocino con cebolla (personal)', null, null, null, '7');
INSERT INTO `producto` VALUES ('88', 'Tocino con cebolla (chica)', null, null, null, '7');
INSERT INTO `producto` VALUES ('89', 'Tocino con cebolla (mediana)', null, null, null, '7');
INSERT INTO `producto` VALUES ('90', 'Tocino con cebolla (grande)', null, null, null, '7');
INSERT INTO `producto` VALUES ('91', 'Tocino con cebolla (jumbo)', null, null, null, '7');
INSERT INTO `producto` VALUES ('92', 'Chorizo con cebolla (personal)', null, null, null, '7');
INSERT INTO `producto` VALUES ('93', 'Chorizo con cebolla (chica)', null, null, null, '7');
INSERT INTO `producto` VALUES ('94', 'Chorizo con cebolla (mediana)', null, null, null, '7');
INSERT INTO `producto` VALUES ('95', 'Chorizo con cebolla (grande)', null, null, null, '7');
INSERT INTO `producto` VALUES ('96', 'Chorizo con cebolla (jumbo)', null, null, null, '7');
INSERT INTO `producto` VALUES ('97', 'Atun (personal)', null, null, null, '7');
INSERT INTO `producto` VALUES ('98', 'Atun (chica)', null, null, null, '7');
INSERT INTO `producto` VALUES ('99', 'Atun (mediana)', null, null, null, '7');
INSERT INTO `producto` VALUES ('100', 'Atun (grande)', null, null, null, '7');
INSERT INTO `producto` VALUES ('101', 'Atun (jumbo)', null, null, null, '7');
INSERT INTO `producto` VALUES ('102', 'Camarones (personal)', null, null, null, '7');
INSERT INTO `producto` VALUES ('103', 'Camarones (chica)', null, null, null, '7');
INSERT INTO `producto` VALUES ('104', 'Camarones (mediana)', null, null, null, '7');
INSERT INTO `producto` VALUES ('105', 'Camarones (grande)', null, null, null, '7');
INSERT INTO `producto` VALUES ('106', 'Camarones (jumbo)', null, null, null, '7');
INSERT INTO `producto` VALUES ('107', 'Vegetariana (personal)', null, null, null, '7');
INSERT INTO `producto` VALUES ('108', 'Vegetariana (chica)', null, null, null, '7');
INSERT INTO `producto` VALUES ('109', 'Vegetariana (mediana)', null, null, null, '7');
INSERT INTO `producto` VALUES ('110', 'Vegetariana (grande)', null, null, null, '7');
INSERT INTO `producto` VALUES ('111', 'Vegetariana (jumbo)', null, null, null, '7');
INSERT INTO `producto` VALUES ('112', 'Camarones con Champiñones (personal)', null, null, null, '7');
INSERT INTO `producto` VALUES ('113', 'Camarones con Champiñones (chica)', null, null, null, '7');
INSERT INTO `producto` VALUES ('114', 'Camarones con Champiñones (mediana)', null, null, null, '7');
INSERT INTO `producto` VALUES ('115', 'Camarones con Champiñones (grande)', null, null, null, '7');
INSERT INTO `producto` VALUES ('116', 'Camarones con Champiñones (jumbo)', null, null, null, '7');
INSERT INTO `producto` VALUES ('117', 'Salchicha Viena (personal)', null, null, null, '7');
INSERT INTO `producto` VALUES ('118', 'Salchicha Viena (chica)', null, null, null, '7');
INSERT INTO `producto` VALUES ('119', 'Salchicha Viena (mediana)', null, null, null, '7');
INSERT INTO `producto` VALUES ('120', 'Salchicha Viena (grande)', null, null, null, '7');
INSERT INTO `producto` VALUES ('121', 'Salchicha Viena (jumbo)', null, null, null, '7');
INSERT INTO `producto` VALUES ('122', 'De Mariscos (personal)', null, null, null, '7');
INSERT INTO `producto` VALUES ('123', 'De Mariscos (chica)', null, null, null, '7');
INSERT INTO `producto` VALUES ('124', 'De Mariscos (mediana)', null, null, null, '7');
INSERT INTO `producto` VALUES ('125', 'De Mariscos (grande)', null, null, null, '7');
INSERT INTO `producto` VALUES ('126', 'De Mariscos (jumbo)', null, null, null, '7');
INSERT INTO `producto` VALUES ('127', 'Especial (personal)', null, null, null, '7');
INSERT INTO `producto` VALUES ('128', 'Especial (chica)', null, null, null, '7');
INSERT INTO `producto` VALUES ('129', 'Especial (mediana)', null, null, null, '7');
INSERT INTO `producto` VALUES ('130', 'Especial (grande)', null, null, null, '7');
INSERT INTO `producto` VALUES ('131', 'Especial (jumbo)', null, null, null, '7');
INSERT INTO `producto` VALUES ('132', 'De Carnes frias (personal)', null, null, null, '7');
INSERT INTO `producto` VALUES ('133', 'De Carnes frias (chica)', null, null, null, '7');
INSERT INTO `producto` VALUES ('134', 'De Carnes frias (mediana)', null, null, null, '7');
INSERT INTO `producto` VALUES ('135', 'De Carnes frias (grande)', null, null, null, '7');
INSERT INTO `producto` VALUES ('136', 'De Carnes frias (jumbo)', null, null, null, '7');
INSERT INTO `producto` VALUES ('142', 'Club Sandwich', null, null, null, '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tipoorden
-- ----------------------------
INSERT INTO `tipoorden` VALUES ('1', 'local');
INSERT INTO `tipoorden` VALUES ('2', 'foranea');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES ('1', 'superuser', 'superusergios', 'Super Usuario', null, 'superuser@sergiospizza.com', null, 'completo', 'activo', '1', '1', '1');
INSERT INTO `usuario` VALUES ('3', 'admin', 'adminsergios', 'Administrador', null, 'admin@sergiospizza.com', null, 'completo', 'activo', '2', '1', '1');
INSERT INTO `usuario` VALUES ('4', 'orden', 'ordensergios', 'Ordenes', 'Sergio\'s Pizza', 'orden@sergiospizza.com', null, 'completo', 'activo', '3', '1', '1');
INSERT INTO `usuario` VALUES ('5', 'restaurante', 'restaurantesergios', 'Restaurante', 'Sergio\'s Pizza', 'restaurante@sergiospizza.com', null, 'completo', 'activo', '7', '1', '1');
INSERT INTO `usuario` VALUES ('6', 'pizzeria', 'pizzeriasergios', 'Pizzeria', 'Sergio\'s Pizza', 'pizzeria@sergiospizza.com', null, 'completo', 'activo', '8', '1', '1');

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
