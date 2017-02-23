/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50516
Source Host           : localhost:3306
Source Database       : softjitc_lapremier

Target Server Type    : MYSQL
Target Server Version : 50516
File Encoding         : 65001

Date: 2014-04-29 08:39:18
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `asignaciones`
-- ----------------------------
DROP TABLE IF EXISTS `asignaciones`;
CREATE TABLE `asignaciones` (
  `idasignaciones` int(11) NOT NULL AUTO_INCREMENT,
  `tabla` varchar(90) DEFAULT NULL,
  `escritura` varchar(45) DEFAULT 'SI' COMMENT 'checkbox',
  `lectura` varchar(45) DEFAULT 'SI',
  `modificacion` varchar(45) DEFAULT 'SI',
  `eliminacion` varchar(45) DEFAULT 'SI',
  `privilegios_idprivilegios` int(11) NOT NULL,
  PRIMARY KEY (`idasignaciones`,`privilegios_idprivilegios`),
  KEY `fk_asignaciones_privilegios1` (`privilegios_idprivilegios`),
  CONSTRAINT `fk_asignaciones_privilegios1` FOREIGN KEY (`privilegios_idprivilegios`) REFERENCES `privilegios` (`idprivilegios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of asignaciones
-- ----------------------------
INSERT INTO `asignaciones` VALUES ('5', 'equipo', 'SI', 'SI', 'SI', 'SI', '1');
INSERT INTO `asignaciones` VALUES ('6', 'umpire', 'SI', 'SI', 'SI', 'SI', '1');
INSERT INTO `asignaciones` VALUES ('7', 'campo', 'SI', 'SI', 'SI', 'SI', '1');
INSERT INTO `asignaciones` VALUES ('8', 'formato', 'SI', 'SI', 'SI', 'SI', '2');
INSERT INTO `asignaciones` VALUES ('9', 'jugador', 'SI', 'SI', 'SI', 'SI', '1');
INSERT INTO `asignaciones` VALUES ('10', 'equipo_has_jugador', 'SI', 'SI', 'SI', 'SI', '1');

-- ----------------------------
-- Table structure for `campo`
-- ----------------------------
DROP TABLE IF EXISTS `campo`;
CREATE TABLE `campo` (
  `idcampo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(90) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idcampo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of campo
-- ----------------------------
INSERT INTO `campo` VALUES ('1', 'Moreno 1', 'Moreno 1');
INSERT INTO `campo` VALUES ('2', 'Moreno 2', 'Moreno 2');
INSERT INTO `campo` VALUES ('3', 'Avalos 1', 'Avalos 1');
INSERT INTO `campo` VALUES ('4', 'Avalos 2', 'Avalos 2');
INSERT INTO `campo` VALUES ('5', 'Avalos 3', 'Avalos 3');
INSERT INTO `campo` VALUES ('6', 'San Angel', 'San Angel');
INSERT INTO `campo` VALUES ('7', 'El Alto', 'El Alto');
INSERT INTO `campo` VALUES ('8', 'La Roncha', 'La Roncha');
INSERT INTO `campo` VALUES ('9', 'Potrero', 'Potrero');

-- ----------------------------
-- Table structure for `cedula`
-- ----------------------------
DROP TABLE IF EXISTS `cedula`;
CREATE TABLE `cedula` (
  `idcedula` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL COMMENT 'Encabezado de la Cedula\n',
  `ronda_idronda` int(11) NOT NULL,
  PRIMARY KEY (`idcedula`,`ronda_idronda`),
  KEY `fk_cedula_programaciones1` (`ronda_idronda`),
  CONSTRAINT `fk_cedula_programaciones1` FOREIGN KEY (`ronda_idronda`) REFERENCES `ronda` (`idronda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cedula
-- ----------------------------

-- ----------------------------
-- Table structure for `configuraciones`
-- ----------------------------
DROP TABLE IF EXISTS `configuraciones`;
CREATE TABLE `configuraciones` (
  `idconfiguraciones` int(11) NOT NULL AUTO_INCREMENT,
  `nombreprogramaciones` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idconfiguraciones`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of configuraciones
-- ----------------------------

-- ----------------------------
-- Table structure for `credenciales`
-- ----------------------------
DROP TABLE IF EXISTS `credenciales`;
CREATE TABLE `credenciales` (
  `idcredenciales` int(11) NOT NULL AUTO_INCREMENT,
  `ligafoto` varchar(90) DEFAULT NULL,
  `equipo_idequipo` int(11) NOT NULL,
  `jugador_idjugador` int(11) NOT NULL,
  PRIMARY KEY (`idcredenciales`,`equipo_idequipo`,`jugador_idjugador`),
  KEY `fk_credenciales_equipo1` (`equipo_idequipo`),
  KEY `fk_credenciales_jugador1` (`jugador_idjugador`),
  CONSTRAINT `fk_credenciales_equipo1` FOREIGN KEY (`equipo_idequipo`) REFERENCES `equipo` (`idequipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_credenciales_jugador1` FOREIGN KEY (`jugador_idjugador`) REFERENCES `jugador` (`idjugador`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of credenciales
-- ----------------------------

-- ----------------------------
-- Table structure for `equipo`
-- ----------------------------
DROP TABLE IF EXISTS `equipo`;
CREATE TABLE `equipo` (
  `idequipo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(90) DEFAULT NULL,
  `estatus` varchar(45) DEFAULT 'Activo',
  `grupo_idgrupo` int(11) NOT NULL,
  PRIMARY KEY (`idequipo`,`grupo_idgrupo`),
  KEY `fk_equipo_grupoprogramaciones1` (`grupo_idgrupo`),
  CONSTRAINT `fk_equipo_grupoprogramaciones1` FOREIGN KEY (`grupo_idgrupo`) REFERENCES `grupo` (`idgrupo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of equipo
-- ----------------------------
INSERT INTO `equipo` VALUES ('1', 'SINDICATO SAPAL', 'Activo', '2');
INSERT INTO `equipo` VALUES ('2', 'VERGEL', 'Activo', '2');
INSERT INTO `equipo` VALUES ('3', 'PERICOS DEL CARMEN', 'Activo', '2');
INSERT INTO `equipo` VALUES ('4', 'GAVILANES', 'Activo', '2');
INSERT INTO `equipo` VALUES ('5', 'SÁNCHEZ EL ALTO', 'Activo', '1');
INSERT INTO `equipo` VALUES ('6', 'SAN CARLOS LA RONCHA', 'Activo', '1');
INSERT INTO `equipo` VALUES ('7', 'CALZADO SANDY', 'Activo', '2');
INSERT INTO `equipo` VALUES ('8', 'DEPORTIVO LOS TIGRITOS', 'Activo', '2');
INSERT INTO `equipo` VALUES ('9', 'LOS MÁRQUEZ', 'Activo', '1');
INSERT INTO `equipo` VALUES ('10', 'SAN JOSÉ', 'Activo', '1');
INSERT INTO `equipo` VALUES ('11', 'HACIENDA ARRIBA', 'Activo', '2');
INSERT INTO `equipo` VALUES ('12', 'CUADRA LÓPEZ', 'Activo', '1');
INSERT INTO `equipo` VALUES ('13', 'DODGERS DEL CARMEN', 'Activo', '1');
INSERT INTO `equipo` VALUES ('14', 'DEPORTIVO SANCHEZ', 'Activo', '1');
INSERT INTO `equipo` VALUES ('15', 'SAN CARLOS VINOS PATY', 'Activo', '1');
INSERT INTO `equipo` VALUES ('16', 'ATLETICO RAYAS', 'Activo', '1');
INSERT INTO `equipo` VALUES ('17', 'UNION LAGUNA JUNIOR', 'Activo', '2');
INSERT INTO `equipo` VALUES ('18', 'FERRETERIA LA LIBERTAD', 'Activo', '2');
INSERT INTO `equipo` VALUES ('19', 'SAN PEDRO APOSTOL', 'Activo', '1');
INSERT INTO `equipo` VALUES ('20', 'QUÍMICOS', 'Activo', '1');

-- ----------------------------
-- Table structure for `equipo_has_jugador`
-- ----------------------------
DROP TABLE IF EXISTS `equipo_has_jugador`;
CREATE TABLE `equipo_has_jugador` (
  `estatus` varchar(45) DEFAULT 'Activo',
  `equipo_idequipo` int(11) NOT NULL,
  `jugador_idjugador` int(11) NOT NULL,
  PRIMARY KEY (`equipo_idequipo`,`jugador_idjugador`),
  KEY `fk_equipo_has_jugador_jugador1` (`jugador_idjugador`),
  KEY `fk_equipo_has_jugador_equipo` (`equipo_idequipo`),
  CONSTRAINT `fk_equipo_has_jugador_equipo` FOREIGN KEY (`equipo_idequipo`) REFERENCES `equipo` (`idequipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_equipo_has_jugador_jugador1` FOREIGN KEY (`jugador_idjugador`) REFERENCES `jugador` (`idjugador`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of equipo_has_jugador
-- ----------------------------
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '1', '4');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '1', '5');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '1', '6');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '1', '7');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '1', '8');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '1', '9');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '1', '10');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '1', '11');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '1', '12');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '1', '13');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '1', '14');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '1', '15');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '1', '16');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '1', '17');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '1', '18');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '1', '19');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '1', '20');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '1', '21');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '1', '22');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '2', '23');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '2', '24');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '2', '25');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '2', '26');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '2', '27');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '2', '28');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '2', '29');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '2', '30');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '2', '31');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '2', '32');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '2', '33');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '2', '34');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '2', '35');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '2', '36');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '2', '37');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '2', '38');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '2', '39');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '2', '40');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '2', '41');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '2', '42');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '2', '43');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '3', '44');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '3', '45');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '3', '46');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '3', '47');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '3', '48');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '3', '49');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '3', '50');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '3', '51');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '3', '52');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '3', '53');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '3', '54');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '3', '55');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '3', '56');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '3', '57');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '3', '58');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '3', '59');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '3', '60');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '3', '61');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '3', '62');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '3', '63');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '3', '64');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '3', '65');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '4', '66');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '4', '67');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '4', '68');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '4', '69');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '4', '70');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '4', '71');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '4', '72');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '4', '73');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '4', '74');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '4', '75');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '4', '76');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '4', '77');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '4', '78');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '4', '79');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '4', '80');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '4', '81');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '4', '82');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '4', '83');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '4', '84');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '4', '85');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '4', '86');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '4', '87');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '5', '88');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '5', '89');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '5', '90');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '5', '91');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '5', '92');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '5', '93');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '5', '94');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '5', '95');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '5', '96');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '5', '97');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '5', '98');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '5', '99');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '5', '100');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '5', '101');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '5', '102');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '5', '103');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '5', '104');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '5', '105');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '5', '106');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '6', '107');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '6', '108');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '6', '109');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '6', '110');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '6', '111');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '6', '112');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '6', '113');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '6', '114');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '6', '115');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '6', '116');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '6', '117');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '6', '118');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '6', '119');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '6', '120');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '6', '121');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '6', '122');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '7', '123');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '7', '124');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '7', '125');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '7', '126');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '7', '127');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '7', '128');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '7', '129');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '7', '130');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '7', '131');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '7', '132');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '7', '133');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '7', '134');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '7', '135');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '7', '136');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '7', '137');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '7', '138');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '7', '139');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '7', '140');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '7', '141');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '7', '142');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '8', '143');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '8', '144');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '8', '145');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '8', '146');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '8', '147');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '8', '148');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '8', '149');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '8', '150');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '8', '151');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '8', '152');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '8', '153');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '8', '154');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '8', '155');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '8', '156');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '8', '157');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '8', '158');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '8', '159');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '8', '160');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '8', '161');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '8', '162');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '8', '163');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '9', '164');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '9', '165');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '9', '166');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '9', '167');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '9', '168');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '9', '169');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '9', '170');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '9', '171');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '9', '172');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '9', '173');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '9', '174');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '9', '175');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '9', '176');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '9', '177');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '9', '178');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '9', '179');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '9', '180');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '9', '181');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '9', '182');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '9', '183');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '9', '184');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '9', '185');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '10', '186');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '10', '187');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '10', '188');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '10', '189');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '10', '190');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '10', '191');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '10', '192');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '10', '193');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '10', '194');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '10', '195');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '10', '196');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '10', '197');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '10', '198');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '10', '199');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '10', '200');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '10', '201');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '10', '202');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '11', '203');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '11', '204');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '11', '205');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '11', '206');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '11', '207');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '11', '208');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '11', '209');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '11', '210');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '11', '211');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '11', '212');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '11', '213');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '11', '214');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '11', '215');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '11', '216');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '11', '217');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '11', '218');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '11', '219');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '11', '220');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '11', '221');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '11', '222');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '11', '223');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '11', '224');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '12', '225');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '12', '226');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '12', '227');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '12', '228');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '12', '229');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '12', '230');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '12', '231');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '12', '232');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '12', '233');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '12', '234');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '12', '235');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '12', '236');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '12', '237');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '12', '238');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '12', '239');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '12', '240');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '12', '241');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '12', '242');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '12', '243');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '12', '244');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '12', '245');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '12', '246');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '13', '247');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '13', '248');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '13', '249');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '13', '250');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '13', '251');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '13', '252');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '13', '253');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '13', '254');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '13', '255');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '13', '256');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '13', '257');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '13', '258');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '13', '259');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '13', '260');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '13', '261');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '13', '262');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '13', '263');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '13', '264');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '13', '265');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '14', '266');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '14', '267');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '14', '268');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '14', '269');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '14', '270');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '14', '271');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '14', '272');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '14', '273');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '14', '274');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '14', '275');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '14', '276');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '14', '277');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '14', '278');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '14', '279');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '14', '280');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '14', '281');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '14', '282');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '14', '283');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '14', '284');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '14', '285');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '14', '286');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '15', '287');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '15', '288');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '15', '289');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '15', '290');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '15', '291');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '15', '292');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '15', '293');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '15', '294');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '15', '295');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '15', '296');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '15', '297');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '15', '298');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '15', '299');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '15', '300');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '15', '301');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '15', '302');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '15', '303');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '15', '304');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '15', '305');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '15', '306');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '15', '307');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '15', '308');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '16', '309');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '16', '310');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '16', '311');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '16', '312');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '16', '313');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '16', '314');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '16', '315');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '16', '316');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '16', '317');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '16', '318');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '16', '319');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '16', '320');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '16', '321');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '16', '322');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '16', '323');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '16', '324');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '16', '325');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '16', '326');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '16', '327');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '16', '328');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '17', '329');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '17', '330');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '17', '331');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '17', '332');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '17', '333');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '17', '334');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '17', '335');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '17', '336');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '17', '337');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '17', '338');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '17', '339');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '17', '340');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '17', '341');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '17', '342');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '17', '343');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '17', '344');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '17', '345');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '18', '346');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '18', '347');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '18', '348');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '18', '349');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '18', '350');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '18', '351');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '18', '352');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '18', '353');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '18', '354');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '18', '355');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '18', '356');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '18', '357');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '18', '358');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '18', '359');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '18', '360');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '18', '361');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '18', '362');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '18', '363');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '18', '364');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '18', '365');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '18', '366');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '18', '367');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '19', '368');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '19', '369');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '19', '370');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '19', '371');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '19', '372');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '19', '373');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '19', '374');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '19', '375');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '19', '376');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '19', '377');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '19', '378');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '19', '379');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '19', '380');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '19', '381');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '19', '382');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '19', '383');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '19', '384');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '19', '385');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '19', '386');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '19', '387');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '19', '388');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '19', '389');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '19', '390');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '20', '391');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '20', '392');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '20', '393');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '20', '394');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '20', '395');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '20', '396');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '20', '397');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '20', '398');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '20', '399');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '20', '400');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '20', '401');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '20', '402');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '20', '403');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '20', '404');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '20', '405');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '20', '406');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '20', '407');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '20', '408');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '20', '409');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '20', '410');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '20', '411');
INSERT INTO `equipo_has_jugador` VALUES ('Activo', '20', '412');

-- ----------------------------
-- Table structure for `formato`
-- ----------------------------
DROP TABLE IF EXISTS `formato`;
CREATE TABLE `formato` (
  `idformato` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idformato`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of formato
-- ----------------------------
INSERT INTO `formato` VALUES ('1', 'Line Up');

-- ----------------------------
-- Table structure for `formato_has_privilegios`
-- ----------------------------
DROP TABLE IF EXISTS `formato_has_privilegios`;
CREATE TABLE `formato_has_privilegios` (
  `tabla` varchar(45) DEFAULT NULL,
  `formato_idformato` int(11) NOT NULL,
  `privilegios_idprivilegios` int(11) NOT NULL,
  PRIMARY KEY (`formato_idformato`,`privilegios_idprivilegios`),
  KEY `fk_formatos_has_privilegios_privilegios1` (`privilegios_idprivilegios`),
  KEY `fk_formatos_has_privilegios_formatos1` (`formato_idformato`),
  CONSTRAINT `fk_formatos_has_privilegios_formatos1` FOREIGN KEY (`formato_idformato`) REFERENCES `formato` (`idformato`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_formatos_has_privilegios_privilegios1` FOREIGN KEY (`privilegios_idprivilegios`) REFERENCES `privilegios` (`idprivilegios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of formato_has_privilegios
-- ----------------------------
INSERT INTO `formato_has_privilegios` VALUES ('ronda', '1', '1');

-- ----------------------------
-- Table structure for `grupo`
-- ----------------------------
DROP TABLE IF EXISTS `grupo`;
CREATE TABLE `grupo` (
  `idgrupo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idgrupo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of grupo
-- ----------------------------
INSERT INTO `grupo` VALUES ('1', 'Grupo A');
INSERT INTO `grupo` VALUES ('2', 'Grupo B');

-- ----------------------------
-- Table structure for `jugador`
-- ----------------------------
DROP TABLE IF EXISTS `jugador`;
CREATE TABLE `jugador` (
  `idjugador` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(90) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `estatus` varchar(45) DEFAULT 'Activo',
  PRIMARY KEY (`idjugador`)
) ENGINE=InnoDB AUTO_INCREMENT=413 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of jugador
-- ----------------------------
INSERT INTO `jugador` VALUES ('1', 'Juan Barrón Mendoza', '1', 'Activo');
INSERT INTO `jugador` VALUES ('2', 'Fernando Hernández', '2', 'Activo');
INSERT INTO `jugador` VALUES ('3', 'Miguel Rocha Zúñiga', '3', 'Activo');
INSERT INTO `jugador` VALUES ('4', 'Francisco Zúñiga López', '4', 'Activo');
INSERT INTO `jugador` VALUES ('5', 'Mario Tovar Tovar', '5', 'Activo');
INSERT INTO `jugador` VALUES ('6', 'Pedro Zúñiga Méndez', '6', 'Activo');
INSERT INTO `jugador` VALUES ('7', 'Juan José Tovar Estrada', '7', 'Activo');
INSERT INTO `jugador` VALUES ('8', 'Benito López Sierra', '8', 'Activo');
INSERT INTO `jugador` VALUES ('9', 'Anselmo Tovar Estrada', '9', 'Activo');
INSERT INTO `jugador` VALUES ('10', 'Patricio Tovar Rocha', '10', 'Activo');
INSERT INTO `jugador` VALUES ('11', 'Juan Carlos Laureano', '11', 'Activo');
INSERT INTO `jugador` VALUES ('12', 'Eustaquio Gutiérrez Vargas', '12', 'Activo');
INSERT INTO `jugador` VALUES ('13', 'Refugio Laureano', '13', 'Activo');
INSERT INTO `jugador` VALUES ('14', 'Jorge Tovar Rivera', '14', 'Activo');
INSERT INTO `jugador` VALUES ('15', 'Luz Laureano', '15', 'Activo');
INSERT INTO `jugador` VALUES ('16', 'Carlos Lozano Tovar', '16', 'Activo');
INSERT INTO `jugador` VALUES ('17', 'Leonardo Rivera Méndez', '17', 'Activo');
INSERT INTO `jugador` VALUES ('18', 'Bernardo Zúñiga Infante', '18', 'Activo');
INSERT INTO `jugador` VALUES ('19', 'Sergio Tirado Escobosa', '19', 'Activo');
INSERT INTO `jugador` VALUES ('20', 'Alberto Tovar Rocha', '20', 'Activo');
INSERT INTO `jugador` VALUES ('21', 'Renato Tovar Tovar', '21', 'Activo');
INSERT INTO `jugador` VALUES ('22', 'Hugo Ortega Cervantes', '22', 'Activo');
INSERT INTO `jugador` VALUES ('23', 'Alejandro Segura Rangel', '1', 'Activo');
INSERT INTO `jugador` VALUES ('24', 'Armando Martínez Velázquez', '2', 'Activo');
INSERT INTO `jugador` VALUES ('25', 'Mario Alberto Olmos Martínez', '3', 'Activo');
INSERT INTO `jugador` VALUES ('26', 'Luis Fernando Olmos Martínez', '4', 'Activo');
INSERT INTO `jugador` VALUES ('27', 'Saúl Rocha Alcaraz', '5', 'Activo');
INSERT INTO `jugador` VALUES ('28', 'Isaías Velázquez Zamora', '6', 'Activo');
INSERT INTO `jugador` VALUES ('29', 'Alfonso Velázquez Flores', '7', 'Activo');
INSERT INTO `jugador` VALUES ('30', 'Cristofer Velázquez Zamora', '8', 'Activo');
INSERT INTO `jugador` VALUES ('31', 'Miguel Ángel García Velázquez', '9', 'Activo');
INSERT INTO `jugador` VALUES ('32', 'Jesús Flores Martínez', '10', 'Activo');
INSERT INTO `jugador` VALUES ('33', 'Ricardo Ortíz Peña', '11', 'Activo');
INSERT INTO `jugador` VALUES ('34', 'Féliz Valle Alcaraz', '12', 'Activo');
INSERT INTO `jugador` VALUES ('35', 'Sergio Hernández', '13', 'Activo');
INSERT INTO `jugador` VALUES ('36', 'Alejandro Martínez Alfaro', '15', 'Activo');
INSERT INTO `jugador` VALUES ('37', 'Guillermo Valle', '16', 'Activo');
INSERT INTO `jugador` VALUES ('38', 'Socorro Palomo', '17', 'Activo');
INSERT INTO `jugador` VALUES ('39', 'José Ventura Padilla', '18', 'Activo');
INSERT INTO `jugador` VALUES ('40', 'Jaime Martínez', '19', 'Activo');
INSERT INTO `jugador` VALUES ('41', 'Carlos Rocha', '20', 'Activo');
INSERT INTO `jugador` VALUES ('42', 'Ramón Hernández', '21', 'Activo');
INSERT INTO `jugador` VALUES ('43', 'Valentín Hernández', '22', 'Activo');
INSERT INTO `jugador` VALUES ('44', 'Francisco Ávalos', '1', 'Activo');
INSERT INTO `jugador` VALUES ('45', 'Alberto Ramírez', '2', 'Activo');
INSERT INTO `jugador` VALUES ('46', 'Eduardo Villagómez', '3', 'Activo');
INSERT INTO `jugador` VALUES ('47', 'Salvador Gómez', '4', 'Activo');
INSERT INTO `jugador` VALUES ('48', 'Fernando Gómez', '5', 'Activo');
INSERT INTO `jugador` VALUES ('49', 'Saúl Ávalos', '6', 'Activo');
INSERT INTO `jugador` VALUES ('50', 'Lino Velázquez', '7', 'Activo');
INSERT INTO `jugador` VALUES ('51', 'Saturnino Ramírez Fonseca', '8', 'Activo');
INSERT INTO `jugador` VALUES ('52', 'Jorge Rocha', '9', 'Activo');
INSERT INTO `jugador` VALUES ('53', 'Javier Arenas', '10', 'Activo');
INSERT INTO `jugador` VALUES ('54', 'Alejandro Caudillo', '11', 'Activo');
INSERT INTO `jugador` VALUES ('55', 'Mario César Velázquez', '12', 'Activo');
INSERT INTO `jugador` VALUES ('56', 'Guadalupe Muñoz', '13', 'Activo');
INSERT INTO `jugador` VALUES ('57', 'Simón Caudillo', '14', 'Activo');
INSERT INTO `jugador` VALUES ('58', 'Guadalupe Ávalos', '15', 'Activo');
INSERT INTO `jugador` VALUES ('59', 'Juan Velázquez', '16', 'Activo');
INSERT INTO `jugador` VALUES ('60', 'Carlos Augusto Velázquez', '17', 'Activo');
INSERT INTO `jugador` VALUES ('61', 'Merced Luna Velázquez', '18', 'Activo');
INSERT INTO `jugador` VALUES ('62', 'José María Ramírez', '19', 'Activo');
INSERT INTO `jugador` VALUES ('63', 'Gerardo Torres', '20', 'Activo');
INSERT INTO `jugador` VALUES ('64', 'Benjamín Vázquez', '21', 'Activo');
INSERT INTO `jugador` VALUES ('65', 'Faustino Ramírez', '22', 'Activo');
INSERT INTO `jugador` VALUES ('66', 'Juan Macías', '1', 'Activo');
INSERT INTO `jugador` VALUES ('67', 'Javier Ponce', '2', 'Activo');
INSERT INTO `jugador` VALUES ('68', 'Antonio Ponce', '3', 'Activo');
INSERT INTO `jugador` VALUES ('69', 'Hilarión Macías', '4', 'Activo');
INSERT INTO `jugador` VALUES ('70', 'Adrián Rivera Macías', '5', 'Activo');
INSERT INTO `jugador` VALUES ('71', 'Everardo Martínez', '6', 'Activo');
INSERT INTO `jugador` VALUES ('72', 'Antonio Vázquez', '7', 'Activo');
INSERT INTO `jugador` VALUES ('73', 'Aurelio Flores', '8', 'Activo');
INSERT INTO `jugador` VALUES ('74', 'José Juan Macías Zúñiga', '9', 'Activo');
INSERT INTO `jugador` VALUES ('75', 'Miguel Ortega', '10', 'Activo');
INSERT INTO `jugador` VALUES ('76', 'Rogelio Rocha', '11', 'Activo');
INSERT INTO `jugador` VALUES ('77', 'Rubén Andrade', '12', 'Activo');
INSERT INTO `jugador` VALUES ('78', 'Luz Macías', '13', 'Activo');
INSERT INTO `jugador` VALUES ('79', 'Antonio Macías Nava', '14', 'Activo');
INSERT INTO `jugador` VALUES ('80', 'Manis Luna', '15', 'Activo');
INSERT INTO `jugador` VALUES ('81', 'Tomás Macías Rivera', '16', 'Activo');
INSERT INTO `jugador` VALUES ('82', 'Jesús Nava', '17', 'Activo');
INSERT INTO `jugador` VALUES ('83', 'Juan Manuel Macías', '18', 'Activo');
INSERT INTO `jugador` VALUES ('84', 'Baudel Rivera Macías', '19', 'Activo');
INSERT INTO `jugador` VALUES ('85', 'Miguel Hernández', '20', 'Activo');
INSERT INTO `jugador` VALUES ('86', 'Jesús Ávalos', '21', 'Activo');
INSERT INTO `jugador` VALUES ('87', 'Porfirio Pérez', '22', 'Activo');
INSERT INTO `jugador` VALUES ('88', 'Miguel Sánchez', '1', 'Activo');
INSERT INTO `jugador` VALUES ('89', 'Francisco Rodríguez Pacheco', '2', 'Activo');
INSERT INTO `jugador` VALUES ('90', 'Alberto Valdez González', '3', 'Activo');
INSERT INTO `jugador` VALUES ('91', 'Jesús Sánchez Torres', '4', 'Activo');
INSERT INTO `jugador` VALUES ('92', 'Sergio Sánchez Torres', '5', 'Activo');
INSERT INTO `jugador` VALUES ('93', 'Gerardo Muñoz', '6', 'Activo');
INSERT INTO `jugador` VALUES ('94', 'Antonio Rodríguez', '7', 'Activo');
INSERT INTO `jugador` VALUES ('95', 'Javier Sánchez Torres', '8', 'Activo');
INSERT INTO `jugador` VALUES ('96', 'Luis Sánchez Hernández', '9', 'Activo');
INSERT INTO `jugador` VALUES ('97', 'Luis Rodríguez', '10', 'Activo');
INSERT INTO `jugador` VALUES ('98', 'Francisco Sánchez Hernández', '11', 'Activo');
INSERT INTO `jugador` VALUES ('99', 'Guadalupe Sánchez Torres', '12', 'Activo');
INSERT INTO `jugador` VALUES ('100', 'Gerardo Sánchez Torres', '13', 'Activo');
INSERT INTO `jugador` VALUES ('101', 'Juan Rodríguez', '14', 'Activo');
INSERT INTO `jugador` VALUES ('102', 'Jaime Sánchez', '15', 'Activo');
INSERT INTO `jugador` VALUES ('103', 'Luis Muñoz', '16', 'Activo');
INSERT INTO `jugador` VALUES ('104', 'José Mendoza', '17', 'Activo');
INSERT INTO `jugador` VALUES ('105', 'Ismael Romero', '18', 'Activo');
INSERT INTO `jugador` VALUES ('106', 'Armando Rodríguez', '19', 'Activo');
INSERT INTO `jugador` VALUES ('107', 'Juan Alonso', '1', 'Activo');
INSERT INTO `jugador` VALUES ('108', 'José Enrique Martínez', '2', 'Activo');
INSERT INTO `jugador` VALUES ('109', 'Armando Ibarra', '3', 'Activo');
INSERT INTO `jugador` VALUES ('110', 'Carlos Zúñiga', '4', 'Activo');
INSERT INTO `jugador` VALUES ('111', 'Guadalupe Alonso', '5', 'Activo');
INSERT INTO `jugador` VALUES ('112', 'Jesús Martínez', '6', 'Activo');
INSERT INTO `jugador` VALUES ('113', 'César Alonso Palomares', '7', 'Activo');
INSERT INTO `jugador` VALUES ('114', 'Luis Alberto Alonso García', '8', 'Activo');
INSERT INTO `jugador` VALUES ('115', 'Víctor Alonso Palomares', '9', 'Activo');
INSERT INTO `jugador` VALUES ('116', 'Juan Alonso Palomares', '10', 'Activo');
INSERT INTO `jugador` VALUES ('117', 'Juan Pablo Zarate', '11', 'Activo');
INSERT INTO `jugador` VALUES ('118', 'J. Manuel Delgado', '12', 'Activo');
INSERT INTO `jugador` VALUES ('119', 'Rafael Alonso', '13', 'Activo');
INSERT INTO `jugador` VALUES ('120', 'Jesús Alonso', '14', 'Activo');
INSERT INTO `jugador` VALUES ('121', 'José Santos Muñoz', '15', 'Activo');
INSERT INTO `jugador` VALUES ('122', 'Víctor M. Araujo', '16', 'Activo');
INSERT INTO `jugador` VALUES ('123', 'José Abundes', '1', 'Activo');
INSERT INTO `jugador` VALUES ('124', 'Francisco Sánchez', '2', 'Activo');
INSERT INTO `jugador` VALUES ('125', 'Sergio Rocha', '3', 'Activo');
INSERT INTO `jugador` VALUES ('126', 'Esteban Alemán', '4', 'Activo');
INSERT INTO `jugador` VALUES ('127', 'Omar Martínez', '5', 'Activo');
INSERT INTO `jugador` VALUES ('128', 'Saúl Martínez', '6', 'Activo');
INSERT INTO `jugador` VALUES ('129', 'Juan Flores', '7', 'Activo');
INSERT INTO `jugador` VALUES ('130', 'Asunción Negrete', '8', 'Activo');
INSERT INTO `jugador` VALUES ('131', 'Francisco Javier Luna Rocha', '9', 'Activo');
INSERT INTO `jugador` VALUES ('132', 'Alejandro Sánchez', '10', 'Activo');
INSERT INTO `jugador` VALUES ('133', 'Alfredo Flores', '11', 'Activo');
INSERT INTO `jugador` VALUES ('134', 'Cirilo Luna', '12', 'Activo');
INSERT INTO `jugador` VALUES ('135', 'Luis Serrano', '13', 'Activo');
INSERT INTO `jugador` VALUES ('136', 'Alfonso Aguado', '14', 'Activo');
INSERT INTO `jugador` VALUES ('137', 'Félix Villegas', '15', 'Activo');
INSERT INTO `jugador` VALUES ('138', 'Felipe Martínez', '16', 'Activo');
INSERT INTO `jugador` VALUES ('139', 'José Rocha', '17', 'Activo');
INSERT INTO `jugador` VALUES ('140', 'Juan Ramos', '18', 'Activo');
INSERT INTO `jugador` VALUES ('141', 'J Luz Cantero', '19', 'Activo');
INSERT INTO `jugador` VALUES ('142', 'Pedro Aguado Martínez', '20', 'Activo');
INSERT INTO `jugador` VALUES ('143', 'Rafael Urrutia', '1', 'Activo');
INSERT INTO `jugador` VALUES ('144', 'Esteban Urrutia', '2', 'Activo');
INSERT INTO `jugador` VALUES ('145', 'Simón Ramos', '3', 'Activo');
INSERT INTO `jugador` VALUES ('146', 'Gregorio Hinojosa', '4', 'Activo');
INSERT INTO `jugador` VALUES ('147', 'Pedro Rocha', '5', 'Activo');
INSERT INTO `jugador` VALUES ('148', 'Manuel López', '6', 'Activo');
INSERT INTO `jugador` VALUES ('149', 'Juan Antonio Torrez', '7', 'Activo');
INSERT INTO `jugador` VALUES ('150', 'Javier Torrez', '8', 'Activo');
INSERT INTO `jugador` VALUES ('151', 'Ramiro Velázquez', '9', 'Activo');
INSERT INTO `jugador` VALUES ('152', 'Félix Gaytán', '10', 'Activo');
INSERT INTO `jugador` VALUES ('153', 'Magdaleno Ibarra', '11', 'Activo');
INSERT INTO `jugador` VALUES ('154', 'Juan Ibarra', '12', 'Activo');
INSERT INTO `jugador` VALUES ('155', 'Elias Sandoval', '13', 'Activo');
INSERT INTO `jugador` VALUES ('156', 'Vicente Sandoval', '14', 'Activo');
INSERT INTO `jugador` VALUES ('157', 'José Carranco', '15', 'Activo');
INSERT INTO `jugador` VALUES ('158', 'Antonio Mandujano', '16', 'Activo');
INSERT INTO `jugador` VALUES ('159', 'Martín Ponce', '17', 'Activo');
INSERT INTO `jugador` VALUES ('160', 'Raúl Torrez', '18', 'Activo');
INSERT INTO `jugador` VALUES ('161', 'Ángel Ibarra', '19', 'Activo');
INSERT INTO `jugador` VALUES ('162', 'Abel Rocha Hernández', '20', 'Activo');
INSERT INTO `jugador` VALUES ('163', 'José Orozco', '21', 'Activo');
INSERT INTO `jugador` VALUES ('164', 'Ezequiel Márquez', '1', 'Activo');
INSERT INTO `jugador` VALUES ('165', 'Ramiro Márquez', '2', 'Activo');
INSERT INTO `jugador` VALUES ('166', 'Jorge Márquez', '3', 'Activo');
INSERT INTO `jugador` VALUES ('167', 'Arturo Márquez', '4', 'Activo');
INSERT INTO `jugador` VALUES ('168', 'Héctor Márquez', '5', 'Activo');
INSERT INTO `jugador` VALUES ('169', 'Luis Márquez', '6', 'Activo');
INSERT INTO `jugador` VALUES ('170', 'Adán Márquez', '7', 'Activo');
INSERT INTO `jugador` VALUES ('171', 'Miguel Hernández', '8', 'Activo');
INSERT INTO `jugador` VALUES ('172', 'Abelardo Martínez', '9', 'Activo');
INSERT INTO `jugador` VALUES ('173', 'Edgar Martínez', '10', 'Activo');
INSERT INTO `jugador` VALUES ('174', 'Benjamín Buzo', '11', 'Activo');
INSERT INTO `jugador` VALUES ('175', 'Antonio Estrada', '12', 'Activo');
INSERT INTO `jugador` VALUES ('176', 'Alexis Estrada', '13', 'Activo');
INSERT INTO `jugador` VALUES ('177', 'Fernando Estrada', '14', 'Activo');
INSERT INTO `jugador` VALUES ('178', 'Guadalupe Estrada', '15', 'Activo');
INSERT INTO `jugador` VALUES ('179', 'Ernesto Quiroz', '16', 'Activo');
INSERT INTO `jugador` VALUES ('180', 'Ramón Valtierra', '17', 'Activo');
INSERT INTO `jugador` VALUES ('181', 'Adolfo Martínez', '18', 'Activo');
INSERT INTO `jugador` VALUES ('182', 'Roberto Santoyo', '19', 'Activo');
INSERT INTO `jugador` VALUES ('183', 'Ernesto Serrato', '20', 'Activo');
INSERT INTO `jugador` VALUES ('184', 'Alfredo López Márquez', '21', 'Activo');
INSERT INTO `jugador` VALUES ('185', 'Pedro Márquez', '22', 'Activo');
INSERT INTO `jugador` VALUES ('186', 'Francisco Buzo', '1', 'Activo');
INSERT INTO `jugador` VALUES ('187', 'Reynaldo Buzo', '2', 'Activo');
INSERT INTO `jugador` VALUES ('188', 'Marcos Buzo', '3', 'Activo');
INSERT INTO `jugador` VALUES ('189', 'Samuel Preciado', '4', 'Activo');
INSERT INTO `jugador` VALUES ('190', 'Oscar Ramírez', '5', 'Activo');
INSERT INTO `jugador` VALUES ('191', 'Francisco Ramírez', '6', 'Activo');
INSERT INTO `jugador` VALUES ('192', 'Socorro Muñoz', '7', 'Activo');
INSERT INTO `jugador` VALUES ('193', 'Nicolás Muñoz', '8', 'Activo');
INSERT INTO `jugador` VALUES ('194', 'Andrés Muñoz', '9', 'Activo');
INSERT INTO `jugador` VALUES ('195', 'Oscar Muñoz', '10', 'Activo');
INSERT INTO `jugador` VALUES ('196', 'Jorge Muñoz', '11', 'Activo');
INSERT INTO `jugador` VALUES ('197', 'Carlos Muñoz', '12', 'Activo');
INSERT INTO `jugador` VALUES ('198', 'Juan Muñoz', '13', 'Activo');
INSERT INTO `jugador` VALUES ('199', 'Martín Muñoz', '14', 'Activo');
INSERT INTO `jugador` VALUES ('200', 'Luis Muñoz', '15', 'Activo');
INSERT INTO `jugador` VALUES ('201', 'Miguel Muñoz', '16', 'Activo');
INSERT INTO `jugador` VALUES ('202', 'Efraín Muñoz', '17', 'Activo');
INSERT INTO `jugador` VALUES ('203', 'Francisco Arenas', '1', 'Activo');
INSERT INTO `jugador` VALUES ('204', 'Antonio Martínez', '2', 'Activo');
INSERT INTO `jugador` VALUES ('205', 'Leonardo Martínez', '3', 'Activo');
INSERT INTO `jugador` VALUES ('206', 'Jesús Aguilera', '4', 'Activo');
INSERT INTO `jugador` VALUES ('207', 'Salvador Moreno Velázquez', '5', 'Activo');
INSERT INTO `jugador` VALUES ('208', 'José Carranza', '6', 'Activo');
INSERT INTO `jugador` VALUES ('209', 'Refujio Aguilera', '7', 'Activo');
INSERT INTO `jugador` VALUES ('210', 'Isidro Aguilera', '8', 'Activo');
INSERT INTO `jugador` VALUES ('211', 'Carlos Moreno Velázquez', '9', 'Activo');
INSERT INTO `jugador` VALUES ('212', 'Concepción Arenas', '10', 'Activo');
INSERT INTO `jugador` VALUES ('213', 'Antonio Arenas', '11', 'Activo');
INSERT INTO `jugador` VALUES ('214', 'Antonio Martínez', '12', 'Activo');
INSERT INTO `jugador` VALUES ('215', 'David Arenas', '13', 'Activo');
INSERT INTO `jugador` VALUES ('216', 'Oscar Hernández', '14', 'Activo');
INSERT INTO `jugador` VALUES ('217', 'Trino Arenas', '15', 'Activo');
INSERT INTO `jugador` VALUES ('218', 'Rosendo Velázquez', '16', 'Activo');
INSERT INTO `jugador` VALUES ('219', 'Carlos Ángel', '17', 'Activo');
INSERT INTO `jugador` VALUES ('220', 'Israel Hernández', '18', 'Activo');
INSERT INTO `jugador` VALUES ('221', 'Alberto Arenas', '19', 'Activo');
INSERT INTO `jugador` VALUES ('222', 'Aurelio Ángel Moreno', '20', 'Activo');
INSERT INTO `jugador` VALUES ('223', 'Aurelio Ángel Pérez', '21', 'Activo');
INSERT INTO `jugador` VALUES ('224', 'Blas Velázquez', '22', 'Activo');
INSERT INTO `jugador` VALUES ('225', 'Mario Muñoz Muñoz', '1', 'Activo');
INSERT INTO `jugador` VALUES ('226', 'Mario De Jesús Muñoz Vera', '2', 'Activo');
INSERT INTO `jugador` VALUES ('227', 'Hugo López', '3', 'Activo');
INSERT INTO `jugador` VALUES ('228', 'Jesús Vera Muñoz', '4', 'Activo');
INSERT INTO `jugador` VALUES ('229', 'José María López Muñoz', '5', 'Activo');
INSERT INTO `jugador` VALUES ('230', 'Fernando López Muñoz', '6', 'Activo');
INSERT INTO `jugador` VALUES ('231', 'Jahaciel López Quiroz', '7', 'Activo');
INSERT INTO `jugador` VALUES ('232', 'Isaí López Quiroz', '8', 'Activo');
INSERT INTO `jugador` VALUES ('233', 'Mario López Infante', '9', 'Activo');
INSERT INTO `jugador` VALUES ('234', 'Martín Muñoz López', '10', 'Activo');
INSERT INTO `jugador` VALUES ('235', 'Jorge Romero', '11', 'Activo');
INSERT INTO `jugador` VALUES ('236', 'Benjamín Rodríguez', '12', 'Activo');
INSERT INTO `jugador` VALUES ('237', 'Mario Romero', '13', 'Activo');
INSERT INTO `jugador` VALUES ('238', 'Adán Reyes Muñoz', '14', 'Activo');
INSERT INTO `jugador` VALUES ('239', 'César Reyes Amaro', '15', 'Activo');
INSERT INTO `jugador` VALUES ('240', 'Marcelino Reyes Amaro', '16', 'Activo');
INSERT INTO `jugador` VALUES ('241', 'Misael Reyes Amaro', '17', 'Activo');
INSERT INTO `jugador` VALUES ('242', 'Rubén Cruz', '18', 'Activo');
INSERT INTO `jugador` VALUES ('243', 'Erasmo Arredondo', '19', 'Activo');
INSERT INTO `jugador` VALUES ('244', 'Ezequiel Chávez', '20', 'Activo');
INSERT INTO `jugador` VALUES ('245', 'José Reyes', '21', 'Activo');
INSERT INTO `jugador` VALUES ('246', 'Elio González', '22', 'Activo');
INSERT INTO `jugador` VALUES ('247', 'José De La Luz Arenas Ornelas', '1', 'Activo');
INSERT INTO `jugador` VALUES ('248', 'José Narciso Luna Rocha', '2', 'Activo');
INSERT INTO `jugador` VALUES ('249', 'Ricardo Velázquez Delgado', '3', 'Activo');
INSERT INTO `jugador` VALUES ('250', 'Francisco Delgado Luna', '4', 'Activo');
INSERT INTO `jugador` VALUES ('251', 'Esteban Delgado Luna', '5', 'Activo');
INSERT INTO `jugador` VALUES ('252', 'Jorge Ávalos Torres', '6', 'Activo');
INSERT INTO `jugador` VALUES ('253', 'Pablo Arenas', '7', 'Activo');
INSERT INTO `jugador` VALUES ('254', 'Sebastián Luna Rocha', '8', 'Activo');
INSERT INTO `jugador` VALUES ('255', 'Juan Alonso Rocha Alcaraz', '9', 'Activo');
INSERT INTO `jugador` VALUES ('256', 'Juan Diego Frausto Lázaro', '10', 'Activo');
INSERT INTO `jugador` VALUES ('257', 'Juan Miguel Luna Ramírez', '11', 'Activo');
INSERT INTO `jugador` VALUES ('258', 'Roberto Delgado Luna', '12', 'Activo');
INSERT INTO `jugador` VALUES ('259', 'Jaime Velázquez Delgado', '13', 'Activo');
INSERT INTO `jugador` VALUES ('260', 'Gustavo Ramírez', '14', 'Activo');
INSERT INTO `jugador` VALUES ('261', 'Ricardo Velázquez Aguirre', '15', 'Activo');
INSERT INTO `jugador` VALUES ('262', 'Antonio Delgado Luna', '16', 'Activo');
INSERT INTO `jugador` VALUES ('263', 'Gonzalo Velázquez Ávalos', '17', 'Activo');
INSERT INTO `jugador` VALUES ('264', 'David Delgado', '18', 'Activo');
INSERT INTO `jugador` VALUES ('265', 'Francisco Javier Delgado García', '19', 'Activo');
INSERT INTO `jugador` VALUES ('266', 'Trinidad Sánchez Hernández', '1', 'Activo');
INSERT INTO `jugador` VALUES ('267', 'Fernando Sánchez Hernández', '2', 'Activo');
INSERT INTO `jugador` VALUES ('268', 'Héctor Sánchez Hernández', '3', 'Activo');
INSERT INTO `jugador` VALUES ('269', 'Juan Valentín Sánchez Muñoz', '4', 'Activo');
INSERT INTO `jugador` VALUES ('270', 'Alfonso Sánchez Muñoz', '5', 'Activo');
INSERT INTO `jugador` VALUES ('271', 'Martín Sánchez Vela', '6', 'Activo');
INSERT INTO `jugador` VALUES ('272', 'Jorge Sánchez Vela', '7', 'Activo');
INSERT INTO `jugador` VALUES ('273', 'Antonio Sánchez Vela', '8', 'Activo');
INSERT INTO `jugador` VALUES ('274', 'Juan Martín Sánchez Bueno', '9', 'Activo');
INSERT INTO `jugador` VALUES ('275', 'Iván Sánchez Bueno', '10', 'Activo');
INSERT INTO `jugador` VALUES ('276', 'Lázaro Sánchez Flores', '11', 'Activo');
INSERT INTO `jugador` VALUES ('277', 'Javier Sánchez Flores', '12', 'Activo');
INSERT INTO `jugador` VALUES ('278', 'Javier Sánchez Bustamante', '13', 'Activo');
INSERT INTO `jugador` VALUES ('279', 'Osbaldo Rodríguez Rodríguez', '14', 'Activo');
INSERT INTO `jugador` VALUES ('280', 'Javier Martínez', '15', 'Activo');
INSERT INTO `jugador` VALUES ('281', 'Francisco Manríquez Buzo', '16', 'Activo');
INSERT INTO `jugador` VALUES ('282', 'Miguel Ángel Sánchez Hernández', '17', 'Activo');
INSERT INTO `jugador` VALUES ('283', 'Filiberto Sánchez Bustamante', '18', 'Activo');
INSERT INTO `jugador` VALUES ('284', 'Venino Sánchez Zúñiga', '19', 'Activo');
INSERT INTO `jugador` VALUES ('285', 'Hugo Sánchez Zúñiga', '20', 'Activo');
INSERT INTO `jugador` VALUES ('286', 'Venino Sánchez Bueno', '21', 'Activo');
INSERT INTO `jugador` VALUES ('287', 'Edgar Núñez', '1', 'Activo');
INSERT INTO `jugador` VALUES ('288', 'José Ortiz Cordero', '2', 'Activo');
INSERT INTO `jugador` VALUES ('289', 'René González Uscanga', '3', 'Activo');
INSERT INTO `jugador` VALUES ('290', 'Daniel Ortega', '4', 'Activo');
INSERT INTO `jugador` VALUES ('291', 'Armando Mares', '5', 'Activo');
INSERT INTO `jugador` VALUES ('292', 'Andrés Mares', '6', 'Activo');
INSERT INTO `jugador` VALUES ('293', 'Gustavo Ayala', '7', 'Activo');
INSERT INTO `jugador` VALUES ('294', 'José Rodríguez', '8', 'Activo');
INSERT INTO `jugador` VALUES ('295', 'Víctor Manuel Hernández Lázaro', '9', 'Activo');
INSERT INTO `jugador` VALUES ('296', 'Julio Ayala', '10', 'Activo');
INSERT INTO `jugador` VALUES ('297', 'Julio Ayala Jr.', '11', 'Activo');
INSERT INTO `jugador` VALUES ('298', 'Pedro Ponce', '12', 'Activo');
INSERT INTO `jugador` VALUES ('299', 'César Serrano', '13', 'Activo');
INSERT INTO `jugador` VALUES ('300', 'Jorge Aldo Ramírez Frausto', '14', 'Activo');
INSERT INTO `jugador` VALUES ('301', 'Víctor Ayala', '15', 'Activo');
INSERT INTO `jugador` VALUES ('302', 'Daniel Hernández', '16', 'Activo');
INSERT INTO `jugador` VALUES ('303', 'Miguel Hernández', '17', 'Activo');
INSERT INTO `jugador` VALUES ('304', 'Antonio Andrade', '18', 'Activo');
INSERT INTO `jugador` VALUES ('305', 'Manuel Hernández', '19', 'Activo');
INSERT INTO `jugador` VALUES ('306', 'Andrés Belmonte', '20', 'Activo');
INSERT INTO `jugador` VALUES ('307', 'Omar Ramírez', '21', 'Activo');
INSERT INTO `jugador` VALUES ('308', 'José Belmonte', '22', 'Activo');
INSERT INTO `jugador` VALUES ('309', 'José Luis Rayas', '1', 'Activo');
INSERT INTO `jugador` VALUES ('310', 'Roberto Carlos Arenas', '2', 'Activo');
INSERT INTO `jugador` VALUES ('311', 'Armando Muñoz Muñoz', '3', 'Activo');
INSERT INTO `jugador` VALUES ('312', 'Jaime Rocha', '4', 'Activo');
INSERT INTO `jugador` VALUES ('313', 'Luis Torres', '5', 'Activo');
INSERT INTO `jugador` VALUES ('314', 'Cesareo Rayas', '6', 'Activo');
INSERT INTO `jugador` VALUES ('315', 'Ignacio Aranda', '7', 'Activo');
INSERT INTO `jugador` VALUES ('316', 'Vicente Rayas', '8', 'Activo');
INSERT INTO `jugador` VALUES ('317', 'Leonardo Padilla', '9', 'Activo');
INSERT INTO `jugador` VALUES ('318', 'Antonio Andrade', '10', 'Activo');
INSERT INTO `jugador` VALUES ('319', 'Agustín Muñoz Muñoz', '11', 'Activo');
INSERT INTO `jugador` VALUES ('320', 'José Rayas', '12', 'Activo');
INSERT INTO `jugador` VALUES ('321', 'Gerardo Martínez', '14', 'Activo');
INSERT INTO `jugador` VALUES ('322', 'Daniel Martínez', '15', 'Activo');
INSERT INTO `jugador` VALUES ('323', 'Gabriel Valle', '17', 'Activo');
INSERT INTO `jugador` VALUES ('324', 'José Juan  Valle', '18', 'Activo');
INSERT INTO `jugador` VALUES ('325', 'Aristeo Rayas', '19', 'Activo');
INSERT INTO `jugador` VALUES ('326', 'José Jesús Luna Rocha', '20', 'Activo');
INSERT INTO `jugador` VALUES ('327', 'Rafael Rayas', '21', 'Activo');
INSERT INTO `jugador` VALUES ('328', 'Oscar Velázquez Arenas', '22', 'Activo');
INSERT INTO `jugador` VALUES ('329', 'Santos García R.', '1', 'Activo');
INSERT INTO `jugador` VALUES ('330', 'Santos García Jr.', '2', 'Activo');
INSERT INTO `jugador` VALUES ('331', 'Rubén García R.', '3', 'Activo');
INSERT INTO `jugador` VALUES ('332', 'Saúl García R.', '4', 'Activo');
INSERT INTO `jugador` VALUES ('333', 'Ernesto García R.', '5', 'Activo');
INSERT INTO `jugador` VALUES ('334', 'Fernando García R.', '6', 'Activo');
INSERT INTO `jugador` VALUES ('335', 'Antonio Rangel', '7', 'Activo');
INSERT INTO `jugador` VALUES ('336', 'Yimi Guevara', '8', 'Activo');
INSERT INTO `jugador` VALUES ('337', 'Carlos Flores', '9', 'Activo');
INSERT INTO `jugador` VALUES ('338', 'Miguel Flores', '10', 'Activo');
INSERT INTO `jugador` VALUES ('339', 'Florencio Velázquez Ramírez', '11', 'Activo');
INSERT INTO `jugador` VALUES ('340', 'Roberto Monreal', '12', 'Activo');
INSERT INTO `jugador` VALUES ('341', 'Ramón Rodríguez', '13', 'Activo');
INSERT INTO `jugador` VALUES ('342', 'Alejandro Alcaraz', '14', 'Activo');
INSERT INTO `jugador` VALUES ('343', 'Francisco Monreal', '15', 'Activo');
INSERT INTO `jugador` VALUES ('344', 'Víctor Pérez', '16', 'Activo');
INSERT INTO `jugador` VALUES ('345', 'Narciso Blanco', '18', 'Activo');
INSERT INTO `jugador` VALUES ('346', 'Miguel Estrada', '1', 'Activo');
INSERT INTO `jugador` VALUES ('347', 'José Luis Bueno', '2', 'Activo');
INSERT INTO `jugador` VALUES ('348', 'Natibidad Bueno', '3', 'Activo');
INSERT INTO `jugador` VALUES ('349', 'Francisco Bueno', '4', 'Activo');
INSERT INTO `jugador` VALUES ('350', 'Rodolfo Rodríguez', '5', 'Activo');
INSERT INTO `jugador` VALUES ('351', 'Roberto Guzmán', '6', 'Activo');
INSERT INTO `jugador` VALUES ('352', 'Isidro Lucio', '7', 'Activo');
INSERT INTO `jugador` VALUES ('353', 'Andrés López', '8', 'Activo');
INSERT INTO `jugador` VALUES ('354', 'Martín López', '9', 'Activo');
INSERT INTO `jugador` VALUES ('355', 'Manuel López', '10', 'Activo');
INSERT INTO `jugador` VALUES ('356', 'Antonio López', '11', 'Activo');
INSERT INTO `jugador` VALUES ('357', 'Luis Torres', '12', 'Activo');
INSERT INTO `jugador` VALUES ('358', 'Isidoro Preciado', '13', 'Activo');
INSERT INTO `jugador` VALUES ('359', 'Humberto Rodríguez', '14', 'Activo');
INSERT INTO `jugador` VALUES ('360', 'Francisco Romero', '15', 'Activo');
INSERT INTO `jugador` VALUES ('361', 'Víctor Preciado', '16', 'Activo');
INSERT INTO `jugador` VALUES ('362', 'Juan Eduardo Gaytán', '17', 'Activo');
INSERT INTO `jugador` VALUES ('363', 'Manuel Ibarra', '18', 'Activo');
INSERT INTO `jugador` VALUES ('364', 'Antonio Vargas', '19', 'Activo');
INSERT INTO `jugador` VALUES ('365', 'Asunción López', '20', 'Activo');
INSERT INTO `jugador` VALUES ('366', 'Beto Muñoz', '21', 'Activo');
INSERT INTO `jugador` VALUES ('367', 'Jorge Sánchez', '22', 'Activo');
INSERT INTO `jugador` VALUES ('368', 'Pablo Sánchez', '1', 'Activo');
INSERT INTO `jugador` VALUES ('369', 'Rosendo Cervera', '2', 'Activo');
INSERT INTO `jugador` VALUES ('370', 'Rosalio Torres', '3', 'Activo');
INSERT INTO `jugador` VALUES ('371', 'Pedro Rocha', '4', 'Activo');
INSERT INTO `jugador` VALUES ('372', 'Paulo Horta Ocampo', '5', 'Activo');
INSERT INTO `jugador` VALUES ('373', 'Roberto Ángel Luna Velázquez', '6', 'Activo');
INSERT INTO `jugador` VALUES ('374', 'Jorge Flores Muñoz', '7', 'Activo');
INSERT INTO `jugador` VALUES ('375', 'Juan Carlos Rocha Ibarra', '8', 'Activo');
INSERT INTO `jugador` VALUES ('376', 'Felipe De Jesús Luna Velázquez', '9', 'Activo');
INSERT INTO `jugador` VALUES ('377', 'Roberto Fernández Olmedo', '10', 'Activo');
INSERT INTO `jugador` VALUES ('378', 'Jesús Zúñiga', '11', 'Activo');
INSERT INTO `jugador` VALUES ('379', 'José Monjaraz', '12', 'Activo');
INSERT INTO `jugador` VALUES ('380', 'Felipe De Jesús Luna Rocha', '13', 'Activo');
INSERT INTO `jugador` VALUES ('381', 'José Ramón Monjaraz', '14', 'Activo');
INSERT INTO `jugador` VALUES ('382', 'Raúl Marquez', '15', 'Activo');
INSERT INTO `jugador` VALUES ('383', 'Juan Velázquez', '16', 'Activo');
INSERT INTO `jugador` VALUES ('384', 'Anacleto Ramos', '17', 'Activo');
INSERT INTO `jugador` VALUES ('385', 'Eustacio Mares', '18', 'Activo');
INSERT INTO `jugador` VALUES ('386', 'Arturo Andrade', '19', 'Activo');
INSERT INTO `jugador` VALUES ('387', 'Saúl Rodríguez', '20', 'Activo');
INSERT INTO `jugador` VALUES ('388', 'Alberto López', '21', 'Activo');
INSERT INTO `jugador` VALUES ('389', 'Noel Juárez Jaramillo', '22', 'Activo');
INSERT INTO `jugador` VALUES ('390', 'fernando méndez', '23', 'Activo');
INSERT INTO `jugador` VALUES ('391', 'Rubén Alejandro Villegas Vela', '1', 'Activo');
INSERT INTO `jugador` VALUES ('392', 'Rafael González', '2', 'Activo');
INSERT INTO `jugador` VALUES ('393', 'Octavio Silvestre Escobedo Guerra', '3', 'Activo');
INSERT INTO `jugador` VALUES ('394', 'Edgar Abraham Torres Tovar', '4', 'Activo');
INSERT INTO `jugador` VALUES ('395', 'Benedicto Villegas González', '5', 'Activo');
INSERT INTO `jugador` VALUES ('396', 'Joel Villegas Vela', '6', 'Activo');
INSERT INTO `jugador` VALUES ('397', 'Miguel Ángel Escobedo Ramírez', '7', 'Activo');
INSERT INTO `jugador` VALUES ('398', 'Nicolás Guadalupe Escobedo Ramírez', '8', 'Activo');
INSERT INTO `jugador` VALUES ('399', 'Eduardo Villegas Morales', '9', 'Activo');
INSERT INTO `jugador` VALUES ('400', 'Anselmo Villegas González', '10', 'Activo');
INSERT INTO `jugador` VALUES ('401', 'César Sánchez', '11', 'Activo');
INSERT INTO `jugador` VALUES ('402', 'César Villegas Morales', '12', 'Activo');
INSERT INTO `jugador` VALUES ('403', 'Juan González', '13', 'Activo');
INSERT INTO `jugador` VALUES ('404', 'Brian Leonardo Torres Tovar', '14', 'Activo');
INSERT INTO `jugador` VALUES ('405', 'Israel Villegas Vela', '15', 'Activo');
INSERT INTO `jugador` VALUES ('406', 'Carlos Ciénega López', '16', 'Activo');
INSERT INTO `jugador` VALUES ('407', 'Francisco Carranco', '17', 'Activo');
INSERT INTO `jugador` VALUES ('408', 'Carlos Correa', '18', 'Activo');
INSERT INTO `jugador` VALUES ('409', 'Jesús Torres', '19', 'Activo');
INSERT INTO `jugador` VALUES ('410', 'Giovanni Torres Tovar', '20', 'Activo');
INSERT INTO `jugador` VALUES ('411', 'Jonathan Eduardo Picón Torres', '21', 'Activo');
INSERT INTO `jugador` VALUES ('412', 'José Alberto Almeida', '22', 'Activo');

-- ----------------------------
-- Table structure for `nota`
-- ----------------------------
DROP TABLE IF EXISTS `nota`;
CREATE TABLE `nota` (
  `idnota` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  `lugar` varchar(90) DEFAULT NULL,
  `contenido` text,
  `estatus` varchar(45) DEFAULT NULL,
  `seccion_idseccion` int(11) NOT NULL,
  `usuario_idusuario` int(11) NOT NULL,
  PRIMARY KEY (`idnota`,`seccion_idseccion`,`usuario_idusuario`),
  KEY `fk_nota_seccion1` (`seccion_idseccion`),
  KEY `fk_nota_usuario1` (`usuario_idusuario`),
  CONSTRAINT `fk_nota_seccion1` FOREIGN KEY (`seccion_idseccion`) REFERENCES `seccion` (`idseccion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_nota_usuario1` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of nota
-- ----------------------------
INSERT INTO `nota` VALUES ('1', '2014-02-06 12:00:00', 'Leon, Gto.', '<b><span class=\"Estilo2\" style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;\">Bienvenidos al portal de La Premier de Leon, Guanajuato.</span></span></b>\r\n<br />\r\n	<img src=\"seccion/portada/imagenes/bienvenida.jpg\" width=\"600\" />\r\n    <p class=MsoNormal>Liga de Beisbol La Premier de Leon...</p>\r\n    <p class=MsoNormal style=\'text-align:justify;line-height:150%\'><span\r\nstyle=\'font-family:\"Arial\",\"sans-serif\"\'>Leon, Gto., Febrero 06 del 2014.-\r\nLes damos la bienvenida al portal de La Premier de Leon</span></p>\r\n<p class=MsoNormal style=\'text-align:justify;line-height:150%\'><span\r\nstyle=\'font-family:\"Arial\",\"sans-serif\"\'>Aqui podrán encontrar información sobre lo mas relevante con respecto a la liga de Beisbol La Premier de Leon, Guanajuato.</span></p>\r\n<p class=MsoNormal style=\'text-align:justify;line-height:150%\'><span\r\nstyle=\'font-family:\"Arial\",\"sans-serif\"\'>Aqui tambien podras utilizar las herramientas de posteo o carga de clasificados si eres parte de liga.</span></p>\r\n<p class=MsoNormal style=\'text-align:justify;line-height:150%\'><span\r\nstyle=\'font-family:\"Arial\",\"sans-serif\"\'>Puedes acceder a las secciones que estan en la parte de arriba para navegar dentro de este sitio.</span></p>\r\n<p class=MsoNormal style=\'text-align:justify;line-height:150%\'><span\r\nstyle=\'font-family:\"Arial\",\"sans-serif\"\'>En la seccion de multimedios, podras visualizar lo mas relevnate de las fechas grabado en video.</span></p>\r\n<p class=MsoNormal style=\'text-align:justify;line-height:150%\'><span\r\nstyle=\'font-family:\"Arial\",\"sans-serif\"\'>Podras ver tambien los clasificados y publicidad con ofertas sobre items para tu equipo, asi como tus propias publicaciones.</span></p>', 'activo', '1', '1');
INSERT INTO `nota` VALUES ('2', '2014-02-06 17:51:18', 'youtube', '_3UCj4dsPXw', 'activo', '8', '1');
INSERT INTO `nota` VALUES ('3', '2014-02-06 17:51:48', 'youtube', 'V9Tl93Pjc3A', 'activo', '8', '1');
INSERT INTO `nota` VALUES ('4', '2014-02-06 17:52:33', 'Leon, Gto.', '<b><span class=\"Estilo2\" style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;\">Seccion en Construccion</span></b>\r\n<br /><img src=\"seccion/banners/imagenes/seccionenconstruccion.jpg\" width=\"600\" /><br />\r\n<p style=\'text-align:justify;line-height:150%\'><span lang=ES\r\nstyle=\'font-size:10.0pt;line-height:150%;font-family:\"Arial\",\"sans-serif\"\'>Esta seccion esta en construccion.</span></p>\r\n<p style=\'text-align:justify;line-height:150%\'><span lang=ES\r\nstyle=\'font-size:10.0pt;line-height:150%;font-family:\"Arial\",\"sans-serif\"\'>Gracias por su comprension</span></p>', 'activo', '9', '1');

-- ----------------------------
-- Table structure for `privilegios`
-- ----------------------------
DROP TABLE IF EXISTS `privilegios`;
CREATE TABLE `privilegios` (
  `idprivilegios` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`idprivilegios`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of privilegios
-- ----------------------------
INSERT INTO `privilegios` VALUES ('1', 'administrador');
INSERT INTO `privilegios` VALUES ('2', 'superusuario');
INSERT INTO `privilegios` VALUES ('3', 'usuario');
INSERT INTO `privilegios` VALUES ('4', 'invitado');
INSERT INTO `privilegios` VALUES ('5', 'multimedios');

-- ----------------------------
-- Table structure for `recibos`
-- ----------------------------
DROP TABLE IF EXISTS `recibos`;
CREATE TABLE `recibos` (
  `idrecibos` int(11) NOT NULL AUTO_INCREMENT,
  `cverecibo` varchar(90) DEFAULT NULL,
  `estatus` varchar(45) DEFAULT 'Pendiente' COMMENT '-Pendiente\n-Pagado\n-Cancelado\n',
  `monto` float DEFAULT NULL,
  `equipo_idequipo` int(11) NOT NULL,
  `cedula_idcedula` int(11) NOT NULL,
  PRIMARY KEY (`idrecibos`,`equipo_idequipo`,`cedula_idcedula`),
  KEY `fk_recibos_equipo1` (`equipo_idequipo`),
  KEY `fk_recibos_cedula1` (`cedula_idcedula`),
  CONSTRAINT `fk_recibos_cedula1` FOREIGN KEY (`cedula_idcedula`) REFERENCES `cedula` (`idcedula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_recibos_equipo1` FOREIGN KEY (`equipo_idequipo`) REFERENCES `equipo` (`idequipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of recibos
-- ----------------------------

-- ----------------------------
-- Table structure for `resultadoequipo`
-- ----------------------------
DROP TABLE IF EXISTS `resultadoequipo`;
CREATE TABLE `resultadoequipo` (
  `idresultadoequipo` int(11) NOT NULL AUTO_INCREMENT,
  `carreras` int(11) DEFAULT NULL,
  `ronda_idronda` int(11) NOT NULL,
  `equipo_idequipo` int(11) NOT NULL,
  `jugador_idjugador` int(11) NOT NULL,
  `umpire_idumpire` int(11) NOT NULL,
  PRIMARY KEY (`idresultadoequipo`,`ronda_idronda`,`equipo_idequipo`,`jugador_idjugador`,`umpire_idumpire`),
  KEY `fk_resultadoequipo_equipo1` (`equipo_idequipo`),
  KEY `fk_resultadoequipo_umpire1` (`umpire_idumpire`),
  KEY `fk_resultadoequipo_programaciones1` (`ronda_idronda`),
  KEY `fk_resultadoequipo_jugador1` (`jugador_idjugador`),
  CONSTRAINT `fk_resultadoequipo_equipo1` FOREIGN KEY (`equipo_idequipo`) REFERENCES `equipo` (`idequipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_resultadoequipo_jugador1` FOREIGN KEY (`jugador_idjugador`) REFERENCES `jugador` (`idjugador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_resultadoequipo_programaciones1` FOREIGN KEY (`ronda_idronda`) REFERENCES `ronda` (`idronda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_resultadoequipo_umpire1` FOREIGN KEY (`umpire_idumpire`) REFERENCES `umpire` (`idumpire`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of resultadoequipo
-- ----------------------------

-- ----------------------------
-- Table structure for `ronda`
-- ----------------------------
DROP TABLE IF EXISTS `ronda`;
CREATE TABLE `ronda` (
  `idronda` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) DEFAULT NULL COMMENT '-Jornada\n-Fecha\n-Encuentro\n-Contienda\n-Etc...\nDespues poner entre equipo y equipo',
  `fecha` date DEFAULT NULL,
  `horario` time DEFAULT NULL,
  `campo_idcampo` int(11) NOT NULL,
  `grupo_idgrupo` int(11) NOT NULL,
  `equipo_idequipo1` int(11) NOT NULL,
  `equipo_idequipo2` int(11) NOT NULL,
  `umpire_idumpire` int(11) NOT NULL,
  PRIMARY KEY (`idronda`,`campo_idcampo`,`grupo_idgrupo`,`equipo_idequipo1`,`equipo_idequipo2`,`umpire_idumpire`),
  KEY `fk_programaciones_equipo1` (`equipo_idequipo1`),
  KEY `fk_programaciones_equipo2` (`equipo_idequipo2`),
  KEY `fk_programaciones_grupoprogramaciones1` (`grupo_idgrupo`),
  KEY `fk_ronda_umpire1` (`umpire_idumpire`),
  KEY `fk_programaciones_sede1` (`campo_idcampo`),
  CONSTRAINT `fk_programaciones_equipo1` FOREIGN KEY (`equipo_idequipo1`) REFERENCES `equipo` (`idequipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_programaciones_equipo2` FOREIGN KEY (`equipo_idequipo2`) REFERENCES `equipo` (`idequipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_programaciones_grupoprogramaciones1` FOREIGN KEY (`grupo_idgrupo`) REFERENCES `grupo` (`idgrupo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_programaciones_sede1` FOREIGN KEY (`campo_idcampo`) REFERENCES `campo` (`idcampo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ronda_umpire1` FOREIGN KEY (`umpire_idumpire`) REFERENCES `umpire` (`idumpire`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ronda
-- ----------------------------
INSERT INTO `ronda` VALUES ('1', '12', '2014-04-27', '10:00:00', '6', '2', '4', '1', '3');
INSERT INTO `ronda` VALUES ('2', '12', '2014-04-27', '12:00:00', '6', '2', '19', '9', '2');
INSERT INTO `ronda` VALUES ('3', '12', '2014-04-27', '12:30:00', '6', '1', '17', '7', '4');

-- ----------------------------
-- Table structure for `seccion`
-- ----------------------------
DROP TABLE IF EXISTS `seccion`;
CREATE TABLE `seccion` (
  `idseccion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(90) DEFAULT NULL,
  `ruta` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idseccion`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of seccion
-- ----------------------------
INSERT INTO `seccion` VALUES ('1', 'Portada', 'seccion/portada/');
INSERT INTO `seccion` VALUES ('2', 'Publicaciones', 'seccion/publicaciones/');
INSERT INTO `seccion` VALUES ('3', 'Noticias', 'seccion/noticias/');
INSERT INTO `seccion` VALUES ('4', 'Ubicacion', 'seccion/ubicacion/');
INSERT INTO `seccion` VALUES ('5', 'Clasificados', 'seccion/clasificadosgratis/');
INSERT INTO `seccion` VALUES ('6', 'Contacto', 'seccion/contacto/');
INSERT INTO `seccion` VALUES ('7', 'Sesion', 'seccion/sesion/');
INSERT INTO `seccion` VALUES ('8', 'Multimedia', 'seccion/multimedia/');
INSERT INTO `seccion` VALUES ('9', 'Banners', 'seccion/banners/');

-- ----------------------------
-- Table structure for `umpire`
-- ----------------------------
DROP TABLE IF EXISTS `umpire`;
CREATE TABLE `umpire` (
  `idumpire` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idumpire`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of umpire
-- ----------------------------
INSERT INTO `umpire` VALUES ('2', 'Guillermo Luna Rocha');
INSERT INTO `umpire` VALUES ('3', ' Jaime Tavares');
INSERT INTO `umpire` VALUES ('4', '');

-- ----------------------------
-- Table structure for `usuario`
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `usr` varchar(45) DEFAULT NULL,
  `pwd` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `privilegios_idprivilegios` int(11) NOT NULL,
  PRIMARY KEY (`idusuario`,`privilegios_idprivilegios`),
  KEY `fk_usuario_privilegios1` (`privilegios_idprivilegios`),
  CONSTRAINT `fk_usuario_privilegios1` FOREIGN KEY (`privilegios_idprivilegios`) REFERENCES `privilegios` (`idprivilegios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES ('1', 'admin', 'lapremieradmin', 'Administrador', '', 'admin@lapremierdeleon.com', '1');
INSERT INTO `usuario` VALUES ('2', '', '', 'Invitado', '', 'sin@mail.com', '4');
INSERT INTO `usuario` VALUES ('3', 'superusuario', 'lapremiersuperuser', 'Super Usuario', '', 'superusuario@lapremierdeleon.com', '2');
