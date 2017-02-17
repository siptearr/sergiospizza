/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50621
 Source Host           : localhost
 Source Database       : servesp

 Target Server Type    : MySQL
 Target Server Version : 50621
 File Encoding         : utf-8

 Date: 01/20/2016 08:42:01 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `afiliado`
-- ----------------------------
DROP TABLE IF EXISTS `afiliado`;
CREATE TABLE `afiliado` (
  `idafiliado` int(11) NOT NULL AUTO_INCREMENT,
  `numafiliacion` int(11) DEFAULT NULL,
  `nombres` varchar(255) DEFAULT NULL,
  `appat` varchar(90) DEFAULT NULL,
  `apmat` varchar(90) DEFAULT NULL,
  `genero` varchar(2) DEFAULT NULL,
  `fecnac` date DEFAULT NULL,
  `numexp` varchar(90) DEFAULT NULL,
  `estado_idestado` int(11) NOT NULL,
  `municipio_idmunicipio` int(11) NOT NULL,
  `localidad_idlocalidad` int(11) NOT NULL,
  PRIMARY KEY (`idafiliado`,`estado_idestado`,`municipio_idmunicipio`,`localidad_idlocalidad`),
  KEY `fk_afiliado_estado1_idx` (`estado_idestado`),
  KEY `fk_afiliado_municipio1_idx` (`municipio_idmunicipio`),
  KEY `fk_afiliado_localidad1_idx` (`localidad_idlocalidad`),
  CONSTRAINT `fk_afiliado_localidad1` FOREIGN KEY (`localidad_idlocalidad`) REFERENCES `localidad` (`idlocalidad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `aniocauses`
-- ----------------------------
DROP TABLE IF EXISTS `aniocauses`;
CREATE TABLE `aniocauses` (
  `idaniocauses` int(11) NOT NULL AUTO_INCREMENT,
  `anio` int(11) DEFAULT NULL,
  PRIMARY KEY (`idaniocauses`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `aniocauses`
-- ----------------------------
BEGIN;
INSERT INTO `aniocauses` VALUES ('1', '2014');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `atencion`
-- ----------------------------
DROP TABLE IF EXISTS `atencion`;
CREATE TABLE `atencion` (
  `idatencion` int(11) NOT NULL AUTO_INCREMENT,
  `fecing` date DEFAULT NULL,
  `fecegr` date DEFAULT NULL,
  `diasatn` int(11) DEFAULT NULL,
  `fecingti` date DEFAULT NULL,
  `fecegrti` date DEFAULT NULL,
  `diasatnti` int(11) DEFAULT NULL,
  `surtmed` varchar(10) DEFAULT NULL,
  `pago` varchar(2) DEFAULT NULL,
  `monto` int(11) DEFAULT NULL,
  `motivopago` text,
  `estatus` varchar(45) DEFAULT NULL,
  `afiliado_idafiliado` int(11) NOT NULL,
  `servbrindados_idservbrindados` int(11) NOT NULL,
  `servegr_idservegr` int(11) NOT NULL,
  `tiposervbrindado_idtiposervbrindado` int(11) NOT NULL,
  `causes_idcauses` int(11) NOT NULL,
  `cie10_idcie10` int(11) NOT NULL,
  `cie9_idcie9` int(11) NOT NULL,
  PRIMARY KEY (`idatencion`,`afiliado_idafiliado`,`servbrindados_idservbrindados`,`servegr_idservegr`,`tiposervbrindado_idtiposervbrindado`,`causes_idcauses`,`cie10_idcie10`,`cie9_idcie9`),
  KEY `fk_atencion_afiliado1_idx` (`afiliado_idafiliado`),
  KEY `fk_atencion_servbrindados1_idx` (`servbrindados_idservbrindados`),
  KEY `fk_atencion_servegr1_idx` (`servegr_idservegr`),
  KEY `fk_atencion_tiposervbrindado1_idx` (`tiposervbrindado_idtiposervbrindado`),
  KEY `fk_atencion_causes1_idx` (`causes_idcauses`),
  KEY `fk_atencion_cie101_idx` (`cie10_idcie10`),
  KEY `fk_atencion_cie91_idx` (`cie9_idcie9`),
  CONSTRAINT `fk_atencion_afiliado1` FOREIGN KEY (`afiliado_idafiliado`) REFERENCES `afiliado` (`idafiliado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_atencion_causes1` FOREIGN KEY (`causes_idcauses`) REFERENCES `causes` (`idcauses`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_atencion_cie101` FOREIGN KEY (`cie10_idcie10`) REFERENCES `cie10` (`idcie10`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_atencion_cie91` FOREIGN KEY (`cie9_idcie9`) REFERENCES `cie9` (`idcie9`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_atencion_servbrindados1` FOREIGN KEY (`servbrindados_idservbrindados`) REFERENCES `servbrindados` (`idservbrindados`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_atencion_servegr1` FOREIGN KEY (`servegr_idservegr`) REFERENCES `servegr` (`idservegr`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_atencion_tiposervbrindado1` FOREIGN KEY (`tiposervbrindado_idtiposervbrindado`) REFERENCES `tiposervbrindado` (`idtiposervbrindado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `causes`
-- ----------------------------
DROP TABLE IF EXISTS `causes`;
CREATE TABLE `causes` (
  `idcauses` int(11) NOT NULL AUTO_INCREMENT,
  `cve` varchar(45) DEFAULT NULL,
  `nivelatn` int(11) DEFAULT NULL,
  `descripcion` varchar(512) DEFAULT NULL,
  `aniocauses_idaniocauses` int(11) NOT NULL,
  PRIMARY KEY (`idcauses`,`aniocauses_idaniocauses`),
  KEY `fk_causes_aniocauses1_idx` (`aniocauses_idaniocauses`),
  CONSTRAINT `fk_causes_aniocauses1` FOREIGN KEY (`aniocauses_idaniocauses`) REFERENCES `aniocauses` (`idaniocauses`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `causes_has_cie10`
-- ----------------------------
DROP TABLE IF EXISTS `causes_has_cie10`;
CREATE TABLE `causes_has_cie10` (
  `causes_idcauses` int(11) NOT NULL,
  `cie10_idcie10` int(11) NOT NULL,
  `cie9_idcie9` int(11) NOT NULL,
  PRIMARY KEY (`causes_idcauses`,`cie10_idcie10`,`cie9_idcie9`),
  KEY `fk_causes_has_cie10_cie101_idx` (`cie10_idcie10`),
  KEY `fk_causes_has_cie10_causes1_idx` (`causes_idcauses`),
  KEY `fk_causes_has_cie10_cie91_idx` (`cie9_idcie9`),
  CONSTRAINT `fk_causes_has_cie10_causes1` FOREIGN KEY (`causes_idcauses`) REFERENCES `causes` (`idcauses`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_causes_has_cie10_cie101` FOREIGN KEY (`cie10_idcie10`) REFERENCES `cie10` (`idcie10`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_causes_has_cie10_cie91` FOREIGN KEY (`cie9_idcie9`) REFERENCES `cie9` (`idcie9`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `causes_has_practicaclinica`
-- ----------------------------
DROP TABLE IF EXISTS `causes_has_practicaclinica`;
CREATE TABLE `causes_has_practicaclinica` (
  `causes_idcauses` int(11) NOT NULL,
  `practicaclinica_idpracticaclinica` int(11) NOT NULL,
  PRIMARY KEY (`causes_idcauses`,`practicaclinica_idpracticaclinica`),
  KEY `fk_causes_has_practicaclinica_practicaclinica1_idx` (`practicaclinica_idpracticaclinica`),
  KEY `fk_causes_has_practicaclinica_causes1_idx` (`causes_idcauses`),
  CONSTRAINT `fk_causes_has_practicaclinica_causes1` FOREIGN KEY (`causes_idcauses`) REFERENCES `causes` (`idcauses`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_causes_has_practicaclinica_practicaclinica1` FOREIGN KEY (`practicaclinica_idpracticaclinica`) REFERENCES `practicaclinica` (`idpracticaclinica`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `cie10`
-- ----------------------------
DROP TABLE IF EXISTS `cie10`;
CREATE TABLE `cie10` (
  `idcie10` int(11) NOT NULL AUTO_INCREMENT,
  `cve` varchar(45) DEFAULT NULL,
  `descripcion` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`idcie10`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `cie9`
-- ----------------------------
DROP TABLE IF EXISTS `cie9`;
CREATE TABLE `cie9` (
  `idcie9` int(11) NOT NULL AUTO_INCREMENT,
  `cve` varchar(45) DEFAULT NULL,
  `descripcion` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`idcie9`)
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
INSERT INTO `configuracion` VALUES ('1', '2016-01-13', 'main');
COMMIT;

-- ----------------------------
--  Table structure for `configuracion_aniocauses`
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_aniocauses`;
CREATE TABLE `configuracion_aniocauses` (
  `idconfiguracion_aniocauses` int(11) NOT NULL AUTO_INCREMENT,
  `aniocauses` varchar(45) DEFAULT NULL,
  `inicioaniocauses` date DEFAULT NULL,
  `finaniocauses` date DEFAULT NULL,
  PRIMARY KEY (`idconfiguracion_aniocauses`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `contenido`
-- ----------------------------
BEGIN;
INSERT INTO `contenido` VALUES ('1', '2016-01-14 10:58:52', 'REPSSEG', null, '<form method=\"post\" name=\"contactform\" id=\"contactform\">\r\n                                <p>\r\n                                    <input name=\"name\" type=\"text\" id=\"name\" placeholder=\"Your Name\">\r\n                                </p>\r\n                                <p>\r\n                                    <input name=\"email\" type=\"text\" id=\"email\" placeholder=\"Your Email\"> \r\n                                </p>\r\n                                <p>\r\n                                    <input name=\"subject\" type=\"text\" id=\"subject\" placeholder=\"Subject\"> \r\n                                </p>\r\n                                <p>\r\n                                    <textarea name=\"comments\" id=\"comments\" placeholder=\"Message\"></textarea>    \r\n                                </p>\r\n                                <input type=\"submit\" class=\"mainBtn\" id=\"submit\" value=\"Send Message\">\r\n                            </form>', 'activo', '1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `estado`
-- ----------------------------
DROP TABLE IF EXISTS `estado`;
CREATE TABLE `estado` (
  `idestado` int(11) NOT NULL AUTO_INCREMENT,
  `cve` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idestado`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `estado`
-- ----------------------------
BEGIN;
INSERT INTO `estado` VALUES ('1', null, 'Aguascalientes'), ('2', null, 'Baja California Norte'), ('3', null, 'Baja California Sur'), ('4', null, 'Campeche'), ('5', null, 'Coahuila de Zaragoza'), ('6', null, 'Colima'), ('7', null, 'Chiapas'), ('8', null, 'Chihuahua'), ('9', null, 'Distrito Federal'), ('10', null, 'Durango'), ('11', null, 'Guanajuato'), ('12', null, 'Guerrero'), ('13', null, 'Hidalgo'), ('14', null, 'Jalisco'), ('15', null, 'Mexico'), ('16', null, 'Michoacan de Ocampo'), ('17', null, 'Morelos'), ('18', null, 'Nayarit'), ('19', null, 'Nuevo Leon'), ('20', null, 'Oaxaca'), ('21', null, 'Puebla'), ('22', null, 'Queretaro Arteaga'), ('23', null, 'Quintana Roo'), ('24', null, 'San Luis Potosi'), ('25', null, 'Sinaloa'), ('26', null, 'Sonora'), ('27', null, 'Tabasco'), ('28', null, 'Tamaulipas'), ('29', null, 'Tlaxcala'), ('30', null, 'Veracruz de Ignacio de la Llave'), ('31', null, 'Yucatan'), ('32', null, 'Zacatecas');
COMMIT;

-- ----------------------------
--  Table structure for `jurisdiccion`
-- ----------------------------
DROP TABLE IF EXISTS `jurisdiccion`;
CREATE TABLE `jurisdiccion` (
  `idjurisdiccion` int(11) NOT NULL AUTO_INCREMENT,
  `numerojuris` int(11) DEFAULT NULL,
  `nombre` varchar(90) DEFAULT NULL,
  `direccion` varchar(180) DEFAULT NULL,
  `telefono` varchar(180) DEFAULT NULL,
  PRIMARY KEY (`idjurisdiccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `localidad`
-- ----------------------------
DROP TABLE IF EXISTS `localidad`;
CREATE TABLE `localidad` (
  `idlocalidad` int(11) NOT NULL AUTO_INCREMENT,
  `cve` varchar(10) DEFAULT NULL,
  `nombre` varchar(128) DEFAULT NULL,
  `municipio_idmunicipio` int(11) NOT NULL,
  PRIMARY KEY (`idlocalidad`,`municipio_idmunicipio`),
  KEY `fk_localidad_municipio1` (`municipio_idmunicipio`),
  CONSTRAINT `fk_localidad_municipio1` FOREIGN KEY (`municipio_idmunicipio`) REFERENCES `municipio` (`idmunicipio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `localidad`
-- ----------------------------
BEGIN;
INSERT INTO `localidad` VALUES ('1', '0000', 'SIN LOCALIDAD', '9999');
COMMIT;

-- ----------------------------
--  Table structure for `municipio`
-- ----------------------------
DROP TABLE IF EXISTS `municipio`;
CREATE TABLE `municipio` (
  `idmunicipio` int(11) NOT NULL AUTO_INCREMENT,
  `cve` varchar(10) DEFAULT NULL,
  `nombre` varchar(70) DEFAULT NULL,
  `jurisdiccion` int(11) DEFAULT NULL,
  `estado_idestado` int(11) NOT NULL,
  PRIMARY KEY (`idmunicipio`,`estado_idestado`),
  KEY `fk_municipio_estado` (`estado_idestado`),
  CONSTRAINT `fk_municipio_estado` FOREIGN KEY (`estado_idestado`) REFERENCES `estado` (`idestado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `municipio`
-- ----------------------------
BEGIN;
INSERT INTO `municipio` VALUES ('1', null, 'ABASOLO', '6', '11'), ('2', null, 'ACAMBARO', '4', '11'), ('3', null, 'SAN MIGUEL DE ALLENDE', '2', '11'), ('4', null, 'APASEO EL ALTO', '3', '11'), ('5', null, 'APASEO EL GRANDE', '3', '11'), ('6', null, 'ATARJEA', '2', '11'), ('7', null, 'CELAYA', '3', '11'), ('8', null, 'CIUDAD MANUEL DOBLADO', '8', '11'), ('9', null, 'COMONFORT', '3', '11'), ('10', null, 'CORONEO', '4', '11'), ('11', null, 'CORTAZAR', '3', '11'), ('12', null, 'CUERAMARO', '6', '11'), ('13', null, 'DOCTOR MORA', '2', '11'), ('14', null, 'DOLORES HIDALGO', '1', '11'), ('15', null, 'GUANAJUATO', '1', '11'), ('16', null, 'HUANIMARO', '6', '11'), ('17', null, 'IRAPUATO', '6', '11'), ('18', null, 'JARAL DEL PROGRESO', '5', '11'), ('19', null, 'JERECUARO', '4', '11'), ('20', null, 'LEÓN', '7', '11'), ('21', null, 'MOROLEON', '5', '11'), ('22', null, 'OCAMPO', '1', '11'), ('23', null, 'PENJAMO', '6', '11'), ('24', null, 'PUEBLO NUEVO', '6', '11'), ('25', null, 'PURISIMA DEL RINCON', '8', '11'), ('26', null, 'ROMITA', '8', '11'), ('27', null, 'SALAMANCA', '5', '11'), ('28', null, 'SALVATIERRA', '4', '11'), ('29', null, 'SAN DIEGO DE LA UNION', '1', '11'), ('30', null, 'SAN FELIPE', '1', '11'), ('31', null, 'SAN FRANCISCO DEL RINCON', '8', '11'), ('32', null, 'SAN JOSE ITURBIDE', '2', '11'), ('33', null, 'SAN LUIS DE LA PAZ', '2', '11'), ('34', null, 'SANTA CATARINA', '2', '11'), ('35', null, 'SANTA CRUZ DE JUVENTINO ROSAS', '3', '11'), ('36', null, 'SANTIAGO MARAVATIO', '4', '11'), ('37', null, 'SILAO', '8', '11'), ('38', null, 'TARANDACUAO', '4', '11'), ('39', null, 'TARIMORO', '3', '11'), ('40', null, 'TIERRA BLANCA', '2', '11'), ('41', null, 'URIANGATO', '5', '11'), ('42', null, 'VALLE DE SANTIAGO', '5', '11'), ('43', null, 'VICTORIA', '2', '11'), ('44', null, 'VILLAGRAN', '3', '11'), ('45', null, 'XICHU', '2', '11'), ('46', null, 'YURIRIA', '5', '11'), ('9999', null, 'SIN MUNICIPIO', '0', '11');
COMMIT;

-- ----------------------------
--  Table structure for `practicaclinica`
-- ----------------------------
DROP TABLE IF EXISTS `practicaclinica`;
CREATE TABLE `practicaclinica` (
  `idpracticaclinica` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idpracticaclinica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `privilegios`
-- ----------------------------
DROP TABLE IF EXISTS `privilegios`;
CREATE TABLE `privilegios` (
  `idprivilegios` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idprivilegios`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `privilegios`
-- ----------------------------
BEGIN;
INSERT INTO `privilegios` VALUES ('1', 'Administrador'), ('2', 'Coordinador'), ('3', 'Gestor'), ('4', 'Invitado');
COMMIT;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `seccion`
-- ----------------------------
BEGIN;
INSERT INTO `seccion` VALUES ('1', 'Contacto', 'seccion/contacto/', 'form', 'activo', '2');
COMMIT;

-- ----------------------------
--  Table structure for `servbrindados`
-- ----------------------------
DROP TABLE IF EXISTS `servbrindados`;
CREATE TABLE `servbrindados` (
  `idservbrindados` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idservbrindados`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `servegr`
-- ----------------------------
DROP TABLE IF EXISTS `servegr`;
CREATE TABLE `servegr` (
  `idservegr` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`idservegr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tiposervbrindado`
-- ----------------------------
DROP TABLE IF EXISTS `tiposervbrindado`;
CREATE TABLE `tiposervbrindado` (
  `idtiposervbrindado` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `servbrindados_idservbrindados` int(11) NOT NULL,
  PRIMARY KEY (`idtiposervbrindado`,`servbrindados_idservbrindados`),
  KEY `fk_tiposervbrindado_servbrindados1_idx` (`servbrindados_idservbrindados`),
  CONSTRAINT `fk_tiposervbrindado_servbrindados1` FOREIGN KEY (`servbrindados_idservbrindados`) REFERENCES `servbrindados` (`idservbrindados`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `um`
-- ----------------------------
DROP TABLE IF EXISTS `um`;
CREATE TABLE `um` (
  `idum` int(11) NOT NULL AUTO_INCREMENT,
  `clues` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `estado_idestado` int(11) NOT NULL,
  `municipio_idmunicipio` int(11) NOT NULL,
  `localidad_idlocalidad` int(11) NOT NULL,
  `jurisdiccion_idjurisdiccion` int(11) NOT NULL,
  PRIMARY KEY (`idum`,`estado_idestado`,`municipio_idmunicipio`,`localidad_idlocalidad`,`jurisdiccion_idjurisdiccion`),
  KEY `fk_um_estado1_idx` (`estado_idestado`),
  KEY `fk_um_municipio1_idx` (`municipio_idmunicipio`),
  KEY `fk_um_localidad1_idx` (`localidad_idlocalidad`),
  KEY `fk_um_jurisdiccion1_idx` (`jurisdiccion_idjurisdiccion`),
  CONSTRAINT `fk_um_jurisdiccion1` FOREIGN KEY (`jurisdiccion_idjurisdiccion`) REFERENCES `jurisdiccion` (`idjurisdiccion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_um_localidad1` FOREIGN KEY (`localidad_idlocalidad`) REFERENCES `localidad` (`idlocalidad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `um`
-- ----------------------------
BEGIN;
INSERT INTO `um` VALUES ('1', 'SINCLUES', 'REPSSEG', '11', '15', '1', '0');
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
  `um_idum` int(11) NOT NULL,
  `privilegios_idprivilegios` int(11) NOT NULL,
  PRIMARY KEY (`idusuario`,`um_idum`,`privilegios_idprivilegios`),
  KEY `fk_usuario_um1_idx` (`um_idum`),
  KEY `fk_usuario_privilegios1_idx` (`privilegios_idprivilegios`),
  CONSTRAINT `fk_usuario_privilegios1` FOREIGN KEY (`privilegios_idprivilegios`) REFERENCES `privilegios` (`idprivilegios`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_um1` FOREIGN KEY (`um_idum`) REFERENCES `um` (`idum`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `usuario`
-- ----------------------------
BEGIN;
INSERT INTO `usuario` VALUES ('1', 'admin', 'adminservesp', 'Administrador', 'Aplicacion Web', 'ing.teran@gmail.com', null, 'General', 'activo', '1', '1'), ('2', 'invitado', 'invitado', 'Invitado', 'Aplicacion Web', 'email@email.com', null, 'General', 'activo', '1', '4');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
