/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : softjit1_extension

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2017-02-07 17:06:38
*/

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of asignaciones
-- ----------------------------

-- ----------------------------
-- Table structure for confasist
-- ----------------------------
DROP TABLE IF EXISTS `confasist`;
CREATE TABLE `confasist` (
  `idconfasist` int(10) NOT NULL AUTO_INCREMENT,
  `usuario_idusuario` int(10) NOT NULL,
  `interfaz` varchar(254) DEFAULT NULL,
  `estatus` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`idconfasist`,`usuario_idusuario`),
  KEY `fk_confasist_usuario` (`usuario_idusuario`) USING BTREE,
  CONSTRAINT `fk_confasist_usuario` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of confasist
-- ----------------------------
INSERT INTO `confasist` VALUES ('1', '1', 'uploadasync', 'siactivo');
INSERT INTO `confasist` VALUES ('2', '2', 'uploadasync', 'siactivo');
INSERT INTO `confasist` VALUES ('3', '4', 'uploadasync', 'siactivo');
INSERT INTO `confasist` VALUES ('4', '5', 'uploadasync', 'siactivo');

-- ----------------------------
-- Table structure for confgeneral
-- ----------------------------
DROP TABLE IF EXISTS `confgeneral`;
CREATE TABLE `confgeneral` (
  `idconfgeneral` int(10) NOT NULL AUTO_INCREMENT,
  `rutabase` varchar(254) DEFAULT NULL,
  `emailadmin` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`idconfgeneral`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of confgeneral
-- ----------------------------
INSERT INTO `confgeneral` VALUES ('1', '.', 'ing.teran@gmail.com');

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
INSERT INTO `configuracion` VALUES ('1', '2016-10-28', 'main');

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
-- Table structure for permisosadminfiles
-- ----------------------------
DROP TABLE IF EXISTS `permisosadminfiles`;
CREATE TABLE `permisosadminfiles` (
  `idpermisosadminfiles` int(10) NOT NULL AUTO_INCREMENT,
  `seccion` varchar(256) DEFAULT NULL,
  `nombreseccion` varchar(256) DEFAULT NULL,
  `estatus` varchar(128) DEFAULT NULL,
  `tipousuario` varchar(128) DEFAULT NULL,
  `usuario_idusuario` int(11) NOT NULL,
  PRIMARY KEY (`idpermisosadminfiles`,`usuario_idusuario`),
  KEY `fk_permisosadminfiles_usuario1_idx` (`usuario_idusuario`),
  CONSTRAINT `fk_permisosadminfiles_usuario1` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of permisosadminfiles
-- ----------------------------
INSERT INTO `permisosadminfiles` VALUES ('1', 'archivogeneral', 'Archivo DEC', 'activo', 'admin', '1');
INSERT INTO `permisosadminfiles` VALUES ('2', 'archivogeneral', 'Archivo DEC', 'activo', 'admin', '2');
INSERT INTO `permisosadminfiles` VALUES ('6', 'archivogeneral', 'Archivo DEC', 'activo', 'admin', '4');
INSERT INTO `permisosadminfiles` VALUES ('7', 'archivo/insapro', 'Archivo INSAPRO', 'activo', 'admin', '1');
INSERT INTO `permisosadminfiles` VALUES ('8', 'archivo/insapro', 'Archivo INSAPRO', 'activo', 'admin', '2');
INSERT INTO `permisosadminfiles` VALUES ('9', 'archivo/insapro', 'Archivo INSAPRO', 'activo', 'admin', '4');
INSERT INTO `permisosadminfiles` VALUES ('10', 'archivo/insapro/01.Juris_I', 'Archivo INSAPRO - JURIS I', 'activo', 'admin', '5');
INSERT INTO `permisosadminfiles` VALUES ('11', 'archivo/insapro/02.Juris_II', 'Archivo INSAPRO - JURIS II', 'activo', 'admin', '6');
INSERT INTO `permisosadminfiles` VALUES ('12', 'archivo/insapro/03.Juris_III', 'Archivo INSAPRO - JURIS III', 'activo', 'admin', '7');
INSERT INTO `permisosadminfiles` VALUES ('13', 'archivo/insapro/04.Juris_IV', 'Archivo INSAPRO - JURIS IV', 'activo', 'admin', '8');
INSERT INTO `permisosadminfiles` VALUES ('14', 'archivo/insapro/05.Juris_V', 'Archivo INSAPRO - JURIS V', 'activo', 'admin', '9');
INSERT INTO `permisosadminfiles` VALUES ('15', 'archivo/insapro/06.Juris_VI', 'Archivo INSAPRO - JURIS VI', 'activo', 'admin', '10');
INSERT INTO `permisosadminfiles` VALUES ('16', 'archivo/insapro/07.Juris_VII', 'Archivo INSAPRO - JURIS VII', 'activo', 'admin', '11');
INSERT INTO `permisosadminfiles` VALUES ('17', 'archivo/insapro/08.Juris_VIII', 'Archivo INSAPRO - JURIS VIII', 'activo', 'admin', '12');
INSERT INTO `permisosadminfiles` VALUES ('18', 'archivo/insapro/01.Juris_I/14-DOLORES_HIDALGO', 'Archivo INSAPRO - JURIS I - DOLORES HIDALGO', 'activo', 'moderador', '13');
INSERT INTO `permisosadminfiles` VALUES ('19', 'archivo/insapro/01.Juris_I/15-GUANAJUATO', 'Archivo INSAPRO - JURIS I - GUANAJUATO', 'activo', 'moderador', '14');
INSERT INTO `permisosadminfiles` VALUES ('20', 'archivo/insapro/01.Juris_I/22-OCAMPO', 'Archivo INSAPRO - JURIS I - OCAMPO', 'activo', 'moderador', '15');
INSERT INTO `permisosadminfiles` VALUES ('21', 'archivo/insapro/01.Juris_I/29-SAN_DIEGO_DE_LA_UNION', 'Archivo INSAPRO - JURIS I - SAN DIEGO DE LA UNION', 'activo', 'moderador', '16');
INSERT INTO `permisosadminfiles` VALUES ('22', 'archivo/insapro/01.Juris_I/30-SAN_FELIPE', 'Archivo INSAPRO - JURIS I - SAN FELIPE', 'activo', 'moderador', '17');
INSERT INTO `permisosadminfiles` VALUES ('23', 'archivo/insapro/02.Juris_II/03-SAN_MIGUEL_DE_ALLENDE', 'Archivo INSAPRO - JURIS II - SAN MIGUEL DE ALLENDE', 'activo', 'moderador', '18');
INSERT INTO `permisosadminfiles` VALUES ('24', 'archivo/insapro/02.Juris_II/06-ATARJEA', 'Archivo INSAPRO - JURIS II - ATARJEA', 'activo', 'moderador', '19');
INSERT INTO `permisosadminfiles` VALUES ('25', 'archivo/insapro/02.Juris_II/13-DOCTOR_MORA', 'Archivo INSAPRO - JURIS II - DOCTOR MORA', 'activo', 'moderador', '20');
INSERT INTO `permisosadminfiles` VALUES ('26', 'archivo/insapro/02.Juris_II/32-SAN_JOSE_ITURBIDE', 'Archivo INSAPRO - JURIS II - SAN JOSE ITURBIDE', 'activo', 'moderador', '21');
INSERT INTO `permisosadminfiles` VALUES ('27', 'archivo/insapro/02.Juris_II/33-SAN_LUIS_DE_LA_PAZ', 'Archivo INSAPRO - JURIS II - SAN LUIS DE LA PAZ', 'activo', 'moderador', '22');
INSERT INTO `permisosadminfiles` VALUES ('28', 'archivo/insapro/02.Juris_II/34-SANTA_CATARINA', 'Archivo INSAPRO - JURIS II - SANTA CATARINA', 'activo', 'moderador', '23');
INSERT INTO `permisosadminfiles` VALUES ('29', 'archivo/insapro/02.Juris_II/40-TIERRA_BLANCA', 'Archivo INSAPRO - JURIS II - TIERRA BLANCA', 'activo', 'moderador', '24');
INSERT INTO `permisosadminfiles` VALUES ('30', 'archivo/insapro/02.Juris_II/43-VICTORIA', 'Archivo INSAPRO - JURIS II - VICTORIA', 'activo', 'moderador', '25');
INSERT INTO `permisosadminfiles` VALUES ('31', 'archivo/insapro/02.Juris_II/45-XICHU', 'Archivo INSAPRO - JURIS II - XICHU', 'activo', 'moderador', '26');
INSERT INTO `permisosadminfiles` VALUES ('32', 'archivo/insapro/03.Juris_III/04-APASEO_EL_ALTO', 'Archivo INSAPRO - JURIS III - APASEO EL ALTO', 'activo', 'moderador', '27');
INSERT INTO `permisosadminfiles` VALUES ('33', 'archivo/insapro/03.Juris_III/05-APASEO_EL_GRANDE', 'Archivo INSAPRO - JURIS III - APASEO EL GRANDE', 'activo', 'moderador', '28');
INSERT INTO `permisosadminfiles` VALUES ('34', 'archivo/insapro/03.Juris_III/07-CELAYA', 'Archivo INSAPRO - JURIS III - CELAYA', 'activo', 'moderador', '29');
INSERT INTO `permisosadminfiles` VALUES ('35', 'archivo/insapro/03.Juris_III/09-COMONFORT', 'Archivo INSAPRO - JURIS III - COMONFORT ', 'activo', 'moderador', '30');
INSERT INTO `permisosadminfiles` VALUES ('36', 'archivo/insapro/03.Juris_III/11-CORTAZAR', 'Archivo INSAPRO - JURIS III - CORTAZAR ', 'activo', 'moderador', '31');
INSERT INTO `permisosadminfiles` VALUES ('37', 'archivo/insapro/03.Juris_III/35-SANTA_CRUZ_DE_JUVENTINO_ROSAS', 'Archivo INSAPRO - JURIS III - SANTA CRUZ DE JUVENTINO ROSAS ', 'activo', 'moderador', '32');
INSERT INTO `permisosadminfiles` VALUES ('38', 'archivo/insapro/03.Juris_III/39-TARIMORO', 'Archivo INSAPRO - JURIS III - TARIMORO ', 'activo', 'moderador', '33');
INSERT INTO `permisosadminfiles` VALUES ('39', 'archivo/insapro/03.Juris_III/44-VILLAGRAN', 'Archivo INSAPRO - JURIS III - VILLAGRAN ', 'activo', 'moderador', '34');
INSERT INTO `permisosadminfiles` VALUES ('40', 'archivo/insapro/04.Juris_IV/02-ACAMBARO', 'Archivo INSAPRO - JURIS IV - ACAMBARO', 'activo', 'moderador', '35');
INSERT INTO `permisosadminfiles` VALUES ('41', 'archivo/insapro/04.Juris_IV/10-CORONEO', 'Archivo INSAPRO - JURIS IV - CORONEO', 'activo', 'moderador', '36');
INSERT INTO `permisosadminfiles` VALUES ('42', 'archivo/insapro/04.Juris_IV/19-JERECUARO', 'Archivo INSAPRO - JURIS IV - JERECUARO ', 'activo', 'moderador', '37');
INSERT INTO `permisosadminfiles` VALUES ('43', 'archivo/insapro/04.Juris_IV/28-SALVATIERRA', 'Archivo INSAPRO - JURIS IV - SALVATIERRA', 'activo', 'moderador', '38');
INSERT INTO `permisosadminfiles` VALUES ('44', 'archivo/insapro/04.Juris_IV/36-SANTIAGO_MARAVATIO', 'Archivo INSAPRO - JURIS IV - SANTIAGO MARAVATIO', 'activo', 'moderador', '39');
INSERT INTO `permisosadminfiles` VALUES ('45', 'archivo/insapro/04.Juris_IV/38-TARANDACUAO', 'Archivo INSAPRO - JURIS IV - TARANDACUAO', 'activo', 'moderador', '40');
INSERT INTO `permisosadminfiles` VALUES ('46', 'archivo/insapro/05.Juris_V/18-JARAL_DEL_PROGRESO', 'Archivo INSAPRO - JURIS V - JARAL DEL PROGRESO ', 'activo', 'moderador', '41');
INSERT INTO `permisosadminfiles` VALUES ('47', 'archivo/insapro/05.Juris_V/21-MOROLEON', 'Archivo INSAPRO - JURIS V - MOROLEON ', 'activo', 'moderador', '42');
INSERT INTO `permisosadminfiles` VALUES ('48', 'archivo/insapro/05.Juris_V/27-SALAMANCA', 'Archivo INSAPRO - JURIS V - SALAMANCA', 'activo', 'moderador', '43');
INSERT INTO `permisosadminfiles` VALUES ('49', 'archivo/insapro/05.Juris_V/41-URIANGATO', 'Archivo INSAPRO - JURIS V - URIANGATO', 'activo', 'moderador', '44');
INSERT INTO `permisosadminfiles` VALUES ('50', 'archivo/insapro/05.Juris_V/42-VALLE_DE_SANTIAGO', 'Archivo INSAPRO - JURIS V - VALLE DE SANTIAGO', 'activo', 'moderador', '45');
INSERT INTO `permisosadminfiles` VALUES ('51', 'archivo/insapro/05.Juris_V/46-YURIRIA', 'Archivo INSAPRO - JURIS V - YURIRIA ', 'activo', 'moderador', '46');
INSERT INTO `permisosadminfiles` VALUES ('52', 'archivo/insapro/06.Juris_VI/01-ABASOLO', 'Archivo INSAPRO - JURIS VI - ABASOLO ', 'activo', 'moderador', '47');
INSERT INTO `permisosadminfiles` VALUES ('53', 'archivo/insapro/06.Juris_VI/12-CUERAMARO', 'Archivo INSAPRO - JURIS VI - CUERAMARO', 'activo', 'moderador', '48');
INSERT INTO `permisosadminfiles` VALUES ('54', 'archivo/insapro/06.Juris_VI/16-HUANIMARO', 'Archivo INSAPRO - JURIS VI - HUANIMARO ', 'activo', 'moderador', '49');
INSERT INTO `permisosadminfiles` VALUES ('55', 'archivo/insapro/06.Juris_VI/17-IRAPUATO', 'Archivo INSAPRO - JURIS VI - IRAPUATO', 'activo', 'moderador', '50');
INSERT INTO `permisosadminfiles` VALUES ('56', 'archivo/insapro/06.Juris_VI/23-PENJAMO', 'Archivo INSAPRO - JURIS VI - PENJAMO', 'activo', 'moderador', '51');
INSERT INTO `permisosadminfiles` VALUES ('57', 'archivo/insapro/06.Juris_VI/24-PUEBLO_NUEVO', 'Archivo INSAPRO - JURIS VI - PUEBLO NUEVO', 'activo', 'moderador', '52');
INSERT INTO `permisosadminfiles` VALUES ('58', 'archivo/insapro/07.Juris_VII/20-LEON_SECTOR_I', 'Archivo INSAPRO - JURIS VII - LEON SECTOR I', 'activo', 'moderador', '53');
INSERT INTO `permisosadminfiles` VALUES ('59', 'archivo/insapro/07.Juris_VII/20-LEON_SECTOR_II', 'Archivo INSAPRO - JURIS VII - LEON SECTOR II', 'activo', 'moderador', '54');
INSERT INTO `permisosadminfiles` VALUES ('60', 'archivo/insapro/07.Juris_VII/20-LEON_SECTOR_III', 'Archivo INSAPRO - JURIS VII - LEON SECTOR III', 'activo', 'moderador', '55');
INSERT INTO `permisosadminfiles` VALUES ('61', 'archivo/insapro/07.Juris_VII/20-LEON_SECTOR_IV', 'Archivo INSAPRO - JURIS VII - LEON SECTOR IV', 'activo', 'moderador', '56');
INSERT INTO `permisosadminfiles` VALUES ('62', 'archivo/insapro/08.Juris_VIII/08-MANUEL_DOBLADO', 'Archivo INSAPRO - JURIS VIII - MANUEL DOBLADO ', 'activo', 'moderador', '57');
INSERT INTO `permisosadminfiles` VALUES ('63', 'archivo/insapro/08.Juris_VIII/25-PURISIMA_DEL_RINCON', 'Archivo INSAPRO - JURIS VIII - PURISIMA DEL RINCON ', 'activo', 'moderador', '58');
INSERT INTO `permisosadminfiles` VALUES ('64', 'archivo/insapro/08.Juris_VIII/26-ROMITA', 'Archivo INSAPRO - JURIS VIII - ROMITA ', 'activo', 'moderador', '59');
INSERT INTO `permisosadminfiles` VALUES ('65', 'archivo/insapro/08.Juris_VIII/31-SAN_FRANCISCO_DEL_RINCON', 'Archivo INSAPRO - JURIS VIII - SAN FRANCISCO DEL RINCON ', 'activo', 'moderador', '60');
INSERT INTO `permisosadminfiles` VALUES ('66', 'archivo/insapro/08.Juris_VIII/37-SILAO', 'Archivo INSAPRO - JURIS VIII - SILAO', 'activo', 'moderador', '61');
INSERT INTO `permisosadminfiles` VALUES ('67', 'archivo/sinos', 'Archivo SINOS', 'activo', 'admin', '1');
INSERT INTO `permisosadminfiles` VALUES ('68', 'archivo/sinos', 'Archivo SINOS', 'activo', 'admin', '2');
INSERT INTO `permisosadminfiles` VALUES ('69', 'archivo/sinos', 'Archivo SINOS', 'activo', 'admin', '4');
INSERT INTO `permisosadminfiles` VALUES ('70', 'archivo/sinos', 'Archivo SINOS', 'activo', 'admin', '62');
INSERT INTO `permisosadminfiles` VALUES ('71', 'archivo/sinos/01.Juris_I', 'Archivo SINOS - JURIS I', 'activo', 'admin', '5');
INSERT INTO `permisosadminfiles` VALUES ('72', 'archivo/sinos/02.Juris_II', 'Archivo SINOS - JURIS II', 'activo', 'admin', '6');
INSERT INTO `permisosadminfiles` VALUES ('73', 'archivo/sinos/03.Juris_III', 'Archivo SINOS - JURIS III', 'activo', 'admin', '7');
INSERT INTO `permisosadminfiles` VALUES ('74', 'archivo/sinos/04.Juris_IV', 'Archivo SINOS - JURIS IV', 'activo', 'admin', '8');
INSERT INTO `permisosadminfiles` VALUES ('75', 'archivo/sinos/05.Juris_V', 'Archivo SINOS - JURIS V', 'activo', 'admin', '9');
INSERT INTO `permisosadminfiles` VALUES ('76', 'archivo/sinos/06.Juris_VI', 'Archivo SINOS - JURIS VI', 'activo', 'admin', '10');
INSERT INTO `permisosadminfiles` VALUES ('77', 'archivo/sinos/07.Juris_VII', 'Archivo SINOS - JURIS VII', 'activo', 'admin', '11');
INSERT INTO `permisosadminfiles` VALUES ('78', 'archivo/sinos/08.Juris_VIII', 'Archivo SINOS - JURIS VIII', 'activo', 'admin', '12');

-- ----------------------------
-- Table structure for privilegios
-- ----------------------------
DROP TABLE IF EXISTS `privilegios`;
CREATE TABLE `privilegios` (
  `idprivilegios` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idprivilegios`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of privilegios
-- ----------------------------
INSERT INTO `privilegios` VALUES ('1', 'superusuario');
INSERT INTO `privilegios` VALUES ('2', 'administrador');
INSERT INTO `privilegios` VALUES ('3', 'moderador');
INSERT INTO `privilegios` VALUES ('4', 'invitado');

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
-- Table structure for sucursal
-- ----------------------------
DROP TABLE IF EXISTS `sucursal`;
CREATE TABLE `sucursal` (
  `idsucursal` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `gps` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idsucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sucursal
-- ----------------------------
INSERT INTO `sucursal` VALUES ('1', 'Extension de Cobertura', 'Carr. Yerbabuena a Puentecillas Km. 0.725, Guanajuato, Gto. CP 36250.', '01(473) 734 76 35, 734 73 48', '20.96277887,-101.2810459');
INSERT INTO `sucursal` VALUES ('2', 'Juris I', 'Juris I', 's/n', '21.0194163,-101.2631137');
INSERT INTO `sucursal` VALUES ('3', 'Juris II', 'Juris II', 's/n', null);
INSERT INTO `sucursal` VALUES ('4', 'Juris III', 'Juris III', 's/n', null);
INSERT INTO `sucursal` VALUES ('5', 'Juris IV', 'Juris IV', 's/n', null);
INSERT INTO `sucursal` VALUES ('6', 'Juris V', 'Juris V', 's/n', null);
INSERT INTO `sucursal` VALUES ('7', 'Juris VI', 'Juris VI', 's/n', null);
INSERT INTO `sucursal` VALUES ('8', 'Juris VII', 'Juris VII', 's/n', null);
INSERT INTO `sucursal` VALUES ('9', 'Juris VIII', 'Juris VIII', 's/n', null);
INSERT INTO `sucursal` VALUES ('10', 'Dolores Hidalgo', 'Municipio Dolores Hidalgo', 's/n', null);
INSERT INTO `sucursal` VALUES ('11', 'Guanajuato', 'Municipio Guanajuato', 's/n', null);
INSERT INTO `sucursal` VALUES ('12', 'Ocampo', 'Municipio Ocampo', 's/n', null);
INSERT INTO `sucursal` VALUES ('13', 'San Diego de la Union', 'Municipio San Diego de la Union', 's/n', null);
INSERT INTO `sucursal` VALUES ('14', 'San Felipe', 'Municipio San Felipe', 's/n', null);
INSERT INTO `sucursal` VALUES ('15', 'San Miguel de Allende', 'Municipio San Miguel de Allende', 's/n', null);
INSERT INTO `sucursal` VALUES ('16', 'Atarjea', 'Municipio Atarjea', 's/n', null);
INSERT INTO `sucursal` VALUES ('17', 'Doctor Mora', 'Municipio Doctor Mora', 's/n', null);
INSERT INTO `sucursal` VALUES ('18', 'San Jose Iturbide', 'Municipio San Jose Iturbide', 's/n', null);
INSERT INTO `sucursal` VALUES ('19', 'San Luis de la Paz', 'Municipio San Luis de la Paz', 's/n', null);
INSERT INTO `sucursal` VALUES ('20', 'Santa Catarina', 'Municipio Santa Catarina', 's/n', null);
INSERT INTO `sucursal` VALUES ('21', 'Tierra Blanca', 'Municipio Tierra Blanca', 's/n', null);
INSERT INTO `sucursal` VALUES ('22', 'Victoria', 'Municipio Victoria', 's/n', null);
INSERT INTO `sucursal` VALUES ('23', 'Xichu', 'Municipio Xichu', 's/n', null);
INSERT INTO `sucursal` VALUES ('24', 'Apaseo el Alto', 'Municipio Apaseo el Alto', 's/n', null);
INSERT INTO `sucursal` VALUES ('25', 'Apaseo el Grande', 'Municipio Apaseo el Grande', 's/n', null);
INSERT INTO `sucursal` VALUES ('26', 'Celaya', 'Municipio Celaya', 's/n', null);
INSERT INTO `sucursal` VALUES ('27', 'Comonfort', 'Municipio Comonfort', 's/n', null);
INSERT INTO `sucursal` VALUES ('28', 'Cortazar', 'Municipio Cortazar', 's/n', null);
INSERT INTO `sucursal` VALUES ('29', 'Santa Cruz de Juventino Rosas', 'Municipio Santa Cruz de Juventino Rosas', 's/n', null);
INSERT INTO `sucursal` VALUES ('30', 'Tarimoro', 'Municipio Tarimoro', 's/n', null);
INSERT INTO `sucursal` VALUES ('31', 'Villagran', 'Municipio Villagran', 's/n', null);
INSERT INTO `sucursal` VALUES ('32', 'Acambaro', 'Municipio Acambaro', 's/n', null);
INSERT INTO `sucursal` VALUES ('33', 'Coroneo', 'Municipio Coroneo', 's/n', null);
INSERT INTO `sucursal` VALUES ('34', 'Jerecuaro', 'Municipio Jerecuaro', 's/n', null);
INSERT INTO `sucursal` VALUES ('35', 'Salvatierra', 'Municipio Salvatierra', 's/n', null);
INSERT INTO `sucursal` VALUES ('36', 'Santiago Maravatio', 'Municipio Santiago Maravatio', 's/n', null);
INSERT INTO `sucursal` VALUES ('37', 'Tarandacuao', 'Municipio Tarandacuao', 's/n', null);
INSERT INTO `sucursal` VALUES ('38', 'Jaral del Progreso', 'Municipio Jaral del Progreso', 's/n', null);
INSERT INTO `sucursal` VALUES ('39', 'Moroleon', 'Municipio Moroleon', 's/n', null);
INSERT INTO `sucursal` VALUES ('40', 'Salamanca', 'Municipio Salamanca', 's/n', null);
INSERT INTO `sucursal` VALUES ('41', 'Uriangato', 'Municipio Uriangato', 's/n', null);
INSERT INTO `sucursal` VALUES ('42', 'Valle de Santiago', 'Municipio Valle de Santiago', 's/n', null);
INSERT INTO `sucursal` VALUES ('43', 'Yuriria', 'Municipio Yuriria', 's/n', null);
INSERT INTO `sucursal` VALUES ('44', 'Abasolo', 'Municipio Abasolo', 's/n', null);
INSERT INTO `sucursal` VALUES ('45', 'Cueramaro', 'Municipio Cueramaro', 's/n', null);
INSERT INTO `sucursal` VALUES ('46', 'Huanimaro', 'Municipio Huanimaro', 's/n', null);
INSERT INTO `sucursal` VALUES ('47', 'Irapuato', 'Municipio Irapuato', 's/n', null);
INSERT INTO `sucursal` VALUES ('48', 'Penjamo', 'Municipio Penjamo', 's/n', null);
INSERT INTO `sucursal` VALUES ('49', 'Pueblo Nuevo', 'Municipio Pueblo Nuevo', 's/n', null);
INSERT INTO `sucursal` VALUES ('50', 'Leon Sector I', 'Zona Leon Sector I', 's/n', null);
INSERT INTO `sucursal` VALUES ('51', 'Leon Sector II', 'Zona Leon Sector II', 's/n', null);
INSERT INTO `sucursal` VALUES ('52', 'Leon Sector III', 'Zona Leon Sector III', 's/n', null);
INSERT INTO `sucursal` VALUES ('53', 'Leon Sector IV', 'Zona Leon Sector IV', 's/n', null);
INSERT INTO `sucursal` VALUES ('54', 'Manuel Doblado', 'Municipio Manuel Doblado', 's/n', null);
INSERT INTO `sucursal` VALUES ('55', 'Purisima del Rincon', 'Municipio Purisima del Rincon', 's/n', null);
INSERT INTO `sucursal` VALUES ('56', 'Romita', 'Municipio Romita', 's/n', null);
INSERT INTO `sucursal` VALUES ('57', 'San Francisco del Rincon', 'Municipio San Francisco del Rincon', 's/n', null);
INSERT INTO `sucursal` VALUES ('58', 'Silao', 'Municipio Silao', 's/n', null);
INSERT INTO `sucursal` VALUES ('59', 'REPSSEG', 'Camino antiguo num. 12, Marfil', '473 73 3 30 34', '20.9991425,-101.2859025');

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
INSERT INTO `tipousuario` VALUES ('1', 'admin');
INSERT INTO `tipousuario` VALUES ('2', 'moderador');

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
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES ('1', 'superuser', 'superuser234', 'WebMaster', 'Extension de Cobertura', 'webmaster@extensiondecobertura.com', null, 'general', 'activo', '1', '1', '1');
INSERT INTO `usuario` VALUES ('2', 'rterana', 'admin234', 'Ricardo', 'Teran Arcibar', 'rteranarc@guanajuato.gob.mx', null, 'general', 'activo', '2', '1', '1');
INSERT INTO `usuario` VALUES ('4', 'iicarrilloa', 'admin123', 'Irving Israel', 'Carrillo Ayala', 'iicarrilloa@guanajuato.gob.mx', null, 'general', 'activo', '2', '1', '1');
INSERT INTO `usuario` VALUES ('5', 'sistemas1', 'admin234', 'Ricardo de Jesus', 'Rivera Juarez', 'rriveraj@guanajuato.gob.mx', null, 'general', 'activo', '2', '1', '2');
INSERT INTO `usuario` VALUES ('6', 'sistemas2', 'admin234', 'Francisco', 'Mendoza Grifaldo', 'paco1921@gmail.com', null, 'general', 'activo', '2', '1', '3');
INSERT INTO `usuario` VALUES ('7', 'sistemas3', 'admin234', 'José Guadalupe', 'Nolasco Valle', 'jgpenv@hotmail.com', null, 'general', 'activo', '2', '1', '4');
INSERT INTO `usuario` VALUES ('8', 'sistemas4', 'admin234', 'Arturo', 'Rivera Morales', 'arturorivera201184@gmail.com', null, 'general', 'activo', '2', '1', '5');
INSERT INTO `usuario` VALUES ('9', 'sistemas5', 'admin234', 'Joel', 'Butanda Olvera', 'joe_elim@hotmail.com', null, 'general', 'activo', '2', '1', '6');
INSERT INTO `usuario` VALUES ('10', 'sistemas6', 'admin234', 'Leticia Andromeda', 'Rodriguez Torres', 'lety.andromeda@gmail.com', null, 'general', 'activo', '2', '1', '7');
INSERT INTO `usuario` VALUES ('11', 'sistemas7', 'admin234', 'Nadia', 'Juarez', 'nadisjo30@gmail.com', null, 'general', 'activo', '2', '1', '8');
INSERT INTO `usuario` VALUES ('12', 'sistemas8', 'admin234', 'Rogelio', 'Meza Rosas', 'rmeza451@gmail.com', null, 'general', 'activo', '2', '1', '9');
INSERT INTO `usuario` VALUES ('13', 'doloreshidalgo', 'doloreshidalgo', 'DOLORES HIDALGO', 'Municipio DOLORES HIDALGO', 's/n', null, 'general', 'activo', '3', '2', '10');
INSERT INTO `usuario` VALUES ('14', 'guanajuato', 'guanajuato', 'GUANAJUATO', 'Municipio GUANAJUATO', 's/n', null, 'general', 'activo', '3', '2', '11');
INSERT INTO `usuario` VALUES ('15', 'ocampo', 'ocampo', 'OCAMPO', 'Municipio OCAMPO', 's/n', null, 'general', 'activo', '3', '2', '12');
INSERT INTO `usuario` VALUES ('16', 'sandiegodelaunion', 'sandiegodelaunion', 'SAN DIEGO DE LA UNION', 'Municipio SAN DIEGO DE LA UNION', 's/n', null, 'general', 'activo', '3', '2', '13');
INSERT INTO `usuario` VALUES ('17', 'sanfelipe', 'sanfelipe', 'SAN FELIPE', 'Municipio SAN FELIPE', 's/n', null, 'general', 'activo', '3', '2', '14');
INSERT INTO `usuario` VALUES ('18', 'sanmigueldeallende', 'sanmigueldeallende', 'SAN MIGUEL DE ALLENDE', 'Municipio SAN MIGUEL DE ALLENDE', 's/n', null, 'general', 'activo', '3', '2', '15');
INSERT INTO `usuario` VALUES ('19', 'atarjea', 'atarjea', 'ATARJEA', 'Municipio ATARJEA', 's/n', null, 'general', 'activo', '3', '2', '16');
INSERT INTO `usuario` VALUES ('20', 'doctormora', 'doctormora', 'DOCTOR MORA', 'Municipio DOCTOR MORA', 's/n', null, 'general', 'activo', '3', '2', '17');
INSERT INTO `usuario` VALUES ('21', 'sanjoseiturbide', 'sanjoseiturbide', 'SAN JOSE ITURBIDE', 'Municipio SAN JOSE ITURBIDE', 's/n', null, 'general', 'activo', '3', '2', '18');
INSERT INTO `usuario` VALUES ('22', 'sanluisdelapaz', 'sanluisdelapaz', 'SAN LUIS DE LA PAZ', 'Municipio SAN LUIS DE LA PAZ', 's/n', null, 'general', 'activo', '3', '2', '19');
INSERT INTO `usuario` VALUES ('23', 'santacatarina', 'santacatarina', 'SANTA CATARINA', 'Municipio SANTA CATARINA', 's/n', null, 'general', 'activo', '3', '2', '20');
INSERT INTO `usuario` VALUES ('24', 'tierrablanca', 'tierrablanca', 'TIERRA BLANCA', 'Municipio TIERRA BLANCA', 's/n', null, 'general', 'activo', '3', '2', '21');
INSERT INTO `usuario` VALUES ('25', 'victoria', 'victoria', 'VICTORIA', 'Municipio VICTORIA', 's/n', null, 'general', 'activo', '3', '2', '22');
INSERT INTO `usuario` VALUES ('26', 'xichu', 'xichu', 'XICHU', 'Municipio XICHU', 's/n', null, 'general', 'activo', '3', '2', '23');
INSERT INTO `usuario` VALUES ('27', 'apaseoelalto', 'apaseoelalto', 'APASEO EL ALTO', 'Municipio APASEO EL ALTO', 's/n', null, 'general', 'activo', '3', '2', '24');
INSERT INTO `usuario` VALUES ('28', 'apaseoelgrande', 'apaseoelgrande', 'APASEO EL GRANDE', 'Municipio APASEO EL GRANDE', 's/n', null, 'general', 'activo', '3', '2', '25');
INSERT INTO `usuario` VALUES ('29', 'celaya', 'celaya', 'CELAYA', 'Municipio CELAYA', 's/n', null, 'general', 'activo', '3', '2', '26');
INSERT INTO `usuario` VALUES ('30', 'comonfort', 'comonfort', 'COMONFORT ', 'Municipio COMONFORT ', 's/n', null, 'general', 'activo', '3', '2', '27');
INSERT INTO `usuario` VALUES ('31', 'cortazar', 'cortazar', 'CORTAZAR ', 'Municipio CORTAZAR ', 's/n', null, 'general', 'activo', '3', '2', '28');
INSERT INTO `usuario` VALUES ('32', 'santacruzdejuventinorosas', 'santacruzdejuventinorosas', 'SANTA CRUZ DE JUVENTINO ROSAS ', 'Municipio SANTA CRUZ DE JUVENTINO ROSAS ', 's/n', null, 'general', 'activo', '3', '2', '29');
INSERT INTO `usuario` VALUES ('33', 'tarimoro', 'tarimoro', 'TARIMORO ', 'Municipio TARIMORO ', 's/n', null, 'general', 'activo', '3', '2', '30');
INSERT INTO `usuario` VALUES ('34', 'villagran', 'villagran', 'VILLAGRAN ', 'Municipio VILLAGRAN ', 's/n', null, 'general', 'activo', '3', '2', '31');
INSERT INTO `usuario` VALUES ('35', 'acambaro', 'acambaro', 'ACAMBARO', 'Municipio ACAMBARO', 's/n', null, 'general', 'activo', '3', '2', '32');
INSERT INTO `usuario` VALUES ('36', 'coroneo', 'coroneo', 'CORONEO', 'Municipio CORONEO', 's/n', null, 'general', 'activo', '3', '2', '33');
INSERT INTO `usuario` VALUES ('37', 'jerecuaro', 'jerecuaro', 'JERECUARO ', 'Municipio JERECUARO ', 's/n', null, 'general', 'activo', '3', '2', '34');
INSERT INTO `usuario` VALUES ('38', 'salvatierra', 'salvatierra', 'SALVATIERRA', 'Municipio SALVATIERRA', 's/n', null, 'general', 'activo', '3', '2', '35');
INSERT INTO `usuario` VALUES ('39', 'santiagomaravatio', 'santiagomaravatio', 'SANTIAGO MARAVATIO', 'Municipio SANTIAGO MARAVATIO', 's/n', null, 'general', 'activo', '3', '2', '36');
INSERT INTO `usuario` VALUES ('40', 'tarandacuao', 'tarandacuao', 'TARANDACUAO', 'Municipio TARANDACUAO', 's/n', null, 'general', 'activo', '3', '2', '37');
INSERT INTO `usuario` VALUES ('41', 'jaraldelprogreso', 'jaraldelprogreso', 'JARAL DEL PROGRESO ', 'Municipio JARAL DEL PROGRESO ', 's/n', null, 'general', 'activo', '3', '2', '38');
INSERT INTO `usuario` VALUES ('42', 'moroleon', 'moroleon', 'MOROLEON ', 'Municipio MOROLEON ', 's/n', null, 'general', 'activo', '3', '2', '39');
INSERT INTO `usuario` VALUES ('43', 'salamanca', 'salamanca', 'SALAMANCA', 'Municipio SALAMANCA', 's/n', null, 'general', 'activo', '3', '2', '40');
INSERT INTO `usuario` VALUES ('44', 'uriangato', 'uriangato', 'URIANGATO', 'Municipio URIANGATO', 's/n', null, 'general', 'activo', '3', '2', '41');
INSERT INTO `usuario` VALUES ('45', 'valledesantiago', 'valledesantiago', 'VALLE DE SANTIAGO', 'Municipio VALLE DE SANTIAGO', 's/n', null, 'general', 'activo', '3', '2', '42');
INSERT INTO `usuario` VALUES ('46', 'yuriria', 'yuriria', 'YURIRIA ', 'Municipio YURIRIA ', 's/n', null, 'general', 'activo', '3', '2', '43');
INSERT INTO `usuario` VALUES ('47', 'abasolo', 'abasolo', 'ABASOLO ', 'Municipio ABASOLO ', 's/n', null, 'general', 'activo', '3', '2', '44');
INSERT INTO `usuario` VALUES ('48', 'cueramaro', 'cueramaro', 'CUERAMARO', 'Municipio CUERAMARO', 's/n', null, 'general', 'activo', '3', '2', '45');
INSERT INTO `usuario` VALUES ('49', 'huanimaro', 'huanimaro', 'HUANIMARO ', 'Municipio HUANIMARO ', 's/n', null, 'general', 'activo', '3', '2', '46');
INSERT INTO `usuario` VALUES ('50', 'irapuato', 'irapuato', 'IRAPUATO', 'Municipio IRAPUATO', 's/n', null, 'general', 'activo', '3', '2', '47');
INSERT INTO `usuario` VALUES ('51', 'penjamo', 'penjamo', 'PENJAMO', 'Municipio PENJAMO', 's/n', null, 'general', 'activo', '3', '2', '48');
INSERT INTO `usuario` VALUES ('52', 'pueblonuevo', 'pueblonuevo', 'PUEBLO NUEVO', 'Municipio PUEBLO NUEVO', 's/n', null, 'general', 'activo', '3', '2', '49');
INSERT INTO `usuario` VALUES ('53', 'leonsectori', 'leonsectori', 'LEON SECTOR I', 'Zona LEON SECTOR I', 's/n', null, 'general', 'activo', '3', '2', '50');
INSERT INTO `usuario` VALUES ('54', 'leonsectorii', 'leonsectorii', 'LEON SECTOR II', 'Zona LEON SECTOR II', 's/n', null, 'general', 'activo', '3', '2', '51');
INSERT INTO `usuario` VALUES ('55', 'leonsectoriii', 'leonsectoriii', 'LEON SECTOR III', 'Zona LEON SECTOR III', 's/n', null, 'general', 'activo', '3', '2', '52');
INSERT INTO `usuario` VALUES ('56', 'leonsectoriv', 'leonsectoriv', 'LEON SECTOR IV', 'Zona LEON SECTOR IV', 's/n', null, 'general', 'activo', '3', '2', '53');
INSERT INTO `usuario` VALUES ('57', 'manueldoblado', 'manueldoblado', 'MANUEL DOBLADO ', 'Municipio MANUEL DOBLADO ', 's/n', null, 'general', 'activo', '3', '2', '54');
INSERT INTO `usuario` VALUES ('58', 'purisimadelrincon', 'purisimadelrincon', 'PURISIMA DEL RINCON ', 'Municipio PURISIMA DEL RINCON ', 's/n', null, 'general', 'activo', '3', '2', '55');
INSERT INTO `usuario` VALUES ('59', 'romita', 'romita', 'ROMITA ', 'Municipio ROMITA ', 's/n', null, 'general', 'activo', '3', '2', '56');
INSERT INTO `usuario` VALUES ('60', 'sanfranciscodelrincon', 'sanfranciscodelrincon', 'SAN FRANCISCO DEL RINCON ', 'Municipio SAN FRANCISCO DEL RINCON ', 's/n', null, 'general', 'activo', '3', '2', '57');
INSERT INTO `usuario` VALUES ('61', 'silao', 'silao', 'SILAO', 'Municipio SILAO', 's/n', null, 'general', 'activo', '3', '2', '58');
INSERT INTO `usuario` VALUES ('62', 'nacho', 'liceaga123', 'Ignacio', 'Liceaga', null, null, 'general', 'activo', '2', '1', '59');
