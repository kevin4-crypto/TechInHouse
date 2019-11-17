-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.37-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para techinhouse
CREATE DATABASE IF NOT EXISTS `techinhouse` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `techinhouse`;

-- Volcando estructura para tabla techinhouse.calificacion
CREATE TABLE IF NOT EXISTS `calificacion` (
  `cod_calificacion` int(11) NOT NULL AUTO_INCREMENT,
  `calificacion` double DEFAULT NULL,
  PRIMARY KEY (`cod_calificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla techinhouse.calificacion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `calificacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `calificacion` ENABLE KEYS */;

-- Volcando estructura para tabla techinhouse.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `cliente_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `apellidos` varchar(40) DEFAULT NULL,
  `usuario_codigo` int(11) DEFAULT NULL,
  `celular` varchar(30) DEFAULT NULL,
  `telefono` varchar(60) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`cliente_codigo`),
  KEY `R_20` (`usuario_codigo`),
  CONSTRAINT `R_20` FOREIGN KEY (`usuario_codigo`) REFERENCES `usuario` (`usuario_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla techinhouse.cliente: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`cliente_codigo`, `nombre`, `apellidos`, `usuario_codigo`, `celular`, `telefono`, `email`) VALUES
	(1, 'Ludwin', 'Moreno Marchena', 1, '969669696', '5250000', 'kevinsa'),
	(3, 'kevin', 'salguero', NULL, '928399391', '47774343', 'elroma@gmicla.com'),
	(8, 'kevin', 'SALGUERO', NULL, '928900360', '566-459', 'kevinsalguero.t@gmail.com');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Volcando estructura para tabla techinhouse.comentarios_clientes
CREATE TABLE IF NOT EXISTS `comentarios_clientes` (
  `cod_tecnico` int(11) DEFAULT NULL,
  `cod_comentario` int(11) NOT NULL AUTO_INCREMENT,
  `comentario` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`cod_comentario`),
  KEY `R_19` (`cod_tecnico`),
  CONSTRAINT `R_19` FOREIGN KEY (`cod_tecnico`) REFERENCES `tecnico` (`cod_tecnico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla techinhouse.comentarios_clientes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `comentarios_clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentarios_clientes` ENABLE KEYS */;

-- Volcando estructura para tabla techinhouse.confirmacion_de_solicitud
CREATE TABLE IF NOT EXISTS `confirmacion_de_solicitud` (
  `cod_solictud` int(11) DEFAULT NULL,
  `cod_tecnico` int(11) DEFAULT NULL,
  `COD_CONFIRMACION` int(11) NOT NULL AUTO_INCREMENT,
  `aceptado` char(1) DEFAULT NULL,
  PRIMARY KEY (`COD_CONFIRMACION`),
  KEY `R_30` (`cod_solictud`),
  KEY `R_31` (`cod_tecnico`),
  CONSTRAINT `R_30` FOREIGN KEY (`cod_solictud`) REFERENCES `solicitud` (`cod_solicitud`),
  CONSTRAINT `R_31` FOREIGN KEY (`cod_tecnico`) REFERENCES `tecnico` (`cod_tecnico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla techinhouse.confirmacion_de_solicitud: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `confirmacion_de_solicitud` DISABLE KEYS */;
/*!40000 ALTER TABLE `confirmacion_de_solicitud` ENABLE KEYS */;

-- Volcando estructura para tabla techinhouse.especialidades
CREATE TABLE IF NOT EXISTS `especialidades` (
  `COD_ESPECIALIDADES` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_ESPECIALIDAD` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`COD_ESPECIALIDADES`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla techinhouse.especialidades: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `especialidades` DISABLE KEYS */;
/*!40000 ALTER TABLE `especialidades` ENABLE KEYS */;

-- Volcando estructura para tabla techinhouse.estado
CREATE TABLE IF NOT EXISTS `estado` (
  `cod_estado` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`cod_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla techinhouse.estado: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;

-- Volcando estructura para tabla techinhouse.historial_tecnico
CREATE TABLE IF NOT EXISTS `historial_tecnico` (
  `cod_tecnico` int(11) NOT NULL,
  `cod_reniec` int(11) DEFAULT NULL,
  `cod_policial` int(11) DEFAULT NULL,
  `cod_judicial` int(11) DEFAULT NULL,
  `cod_historial` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`cod_historial`),
  KEY `R_4` (`cod_tecnico`),
  KEY `R_1` (`cod_reniec`),
  KEY `R_2` (`cod_policial`),
  KEY `R_3` (`cod_judicial`),
  CONSTRAINT `R_1` FOREIGN KEY (`cod_reniec`) REFERENCES `reniec` (`cod_reniec`),
  CONSTRAINT `R_2` FOREIGN KEY (`cod_policial`) REFERENCES `policial` (`cod_policial`),
  CONSTRAINT `R_3` FOREIGN KEY (`cod_judicial`) REFERENCES `judicial` (`cod_judicial`),
  CONSTRAINT `R_4` FOREIGN KEY (`cod_tecnico`) REFERENCES `tecnico` (`cod_tecnico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla techinhouse.historial_tecnico: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `historial_tecnico` DISABLE KEYS */;
/*!40000 ALTER TABLE `historial_tecnico` ENABLE KEYS */;

-- Volcando estructura para tabla techinhouse.judicial
CREATE TABLE IF NOT EXISTS `judicial` (
  `cod_judicial` int(11) NOT NULL AUTO_INCREMENT,
  `informacion` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`cod_judicial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla techinhouse.judicial: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `judicial` DISABLE KEYS */;
/*!40000 ALTER TABLE `judicial` ENABLE KEYS */;

-- Volcando estructura para tabla techinhouse.medio_pago
CREATE TABLE IF NOT EXISTS `medio_pago` (
  `cod_medio_pago` int(11) NOT NULL AUTO_INCREMENT,
  `medio_pago` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`cod_medio_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla techinhouse.medio_pago: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `medio_pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `medio_pago` ENABLE KEYS */;

-- Volcando estructura para tabla techinhouse.policial
CREATE TABLE IF NOT EXISTS `policial` (
  `cod_policial` int(11) NOT NULL AUTO_INCREMENT,
  `informacion` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`cod_policial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla techinhouse.policial: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `policial` DISABLE KEYS */;
/*!40000 ALTER TABLE `policial` ENABLE KEYS */;

-- Volcando estructura para tabla techinhouse.prioridad
CREATE TABLE IF NOT EXISTS `prioridad` (
  `cod_prioridad` int(11) NOT NULL AUTO_INCREMENT,
  `prioridad` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`cod_prioridad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla techinhouse.prioridad: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `prioridad` DISABLE KEYS */;
/*!40000 ALTER TABLE `prioridad` ENABLE KEYS */;

-- Volcando estructura para tabla techinhouse.puntos
CREATE TABLE IF NOT EXISTS `puntos` (
  `cod_puntos` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` double DEFAULT NULL,
  `cod_tecnico` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_puntos`),
  KEY `R_29` (`cod_tecnico`),
  CONSTRAINT `R_29` FOREIGN KEY (`cod_tecnico`) REFERENCES `tecnico` (`cod_tecnico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla techinhouse.puntos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `puntos` DISABLE KEYS */;
/*!40000 ALTER TABLE `puntos` ENABLE KEYS */;

-- Volcando estructura para tabla techinhouse.reniec
CREATE TABLE IF NOT EXISTS `reniec` (
  `cod_reniec` int(11) NOT NULL AUTO_INCREMENT,
  `informacion` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`cod_reniec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla techinhouse.reniec: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `reniec` DISABLE KEYS */;
/*!40000 ALTER TABLE `reniec` ENABLE KEYS */;

-- Volcando estructura para tabla techinhouse.solicitud
CREATE TABLE IF NOT EXISTS `solicitud` (
  `cliente_codigo` int(11) DEFAULT NULL,
  `cod_solicitud` int(11) NOT NULL AUTO_INCREMENT,
  `cod_prioridad` int(11) DEFAULT NULL,
  `direccion` varchar(130) DEFAULT NULL,
  `referencia` varchar(60) DEFAULT NULL,
  `imagen` varchar(60) DEFAULT NULL,
  `cod_tecnico` int(11) DEFAULT NULL,
  `COD_ZONAS` int(11) DEFAULT NULL,
  `detalles` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`cod_solicitud`),
  KEY `R_21` (`cliente_codigo`),
  KEY `R_12` (`cod_prioridad`),
  KEY `R_15` (`cod_tecnico`),
  KEY `R_32` (`COD_ZONAS`),
  CONSTRAINT `R_12` FOREIGN KEY (`cod_prioridad`) REFERENCES `prioridad` (`cod_prioridad`),
  CONSTRAINT `R_15` FOREIGN KEY (`cod_tecnico`) REFERENCES `tecnico` (`cod_tecnico`),
  CONSTRAINT `R_21` FOREIGN KEY (`cliente_codigo`) REFERENCES `cliente` (`cliente_codigo`),
  CONSTRAINT `R_32` FOREIGN KEY (`COD_ZONAS`) REFERENCES `zona` (`COD_ZONAS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla techinhouse.solicitud: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `solicitud` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitud` ENABLE KEYS */;

-- Volcando estructura para tabla techinhouse.tecnico
CREATE TABLE IF NOT EXISTS `tecnico` (
  `usuario_codigo` int(11) DEFAULT NULL,
  `cod_tecnico` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(60) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `fechanac` date DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `cod_servicio` int(11) DEFAULT NULL,
  `cod_estado` int(11) DEFAULT NULL,
  `cod_calificacion` int(11) DEFAULT NULL,
  `ruc` varchar(11) DEFAULT NULL,
  `COD_ESPECIALIDADES` int(11) DEFAULT NULL,
  `COD_ZONAS` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_tecnico`),
  KEY `R_22` (`usuario_codigo`),
  KEY `R_7` (`cod_servicio`),
  KEY `R_5` (`cod_estado`),
  KEY `R_9` (`cod_calificacion`),
  KEY `R_28` (`COD_ESPECIALIDADES`),
  KEY `R_33` (`COD_ZONAS`),
  CONSTRAINT `R_22` FOREIGN KEY (`usuario_codigo`) REFERENCES `usuario` (`usuario_codigo`),
  CONSTRAINT `R_28` FOREIGN KEY (`COD_ESPECIALIDADES`) REFERENCES `especialidades` (`COD_ESPECIALIDADES`),
  CONSTRAINT `R_33` FOREIGN KEY (`COD_ZONAS`) REFERENCES `zona` (`COD_ZONAS`),
  CONSTRAINT `R_5` FOREIGN KEY (`cod_estado`) REFERENCES `estado` (`cod_estado`),
  CONSTRAINT `R_7` FOREIGN KEY (`cod_servicio`) REFERENCES `tipo_servicio` (`cod_servicio`),
  CONSTRAINT `R_9` FOREIGN KEY (`cod_calificacion`) REFERENCES `calificacion` (`cod_calificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla techinhouse.tecnico: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tecnico` DISABLE KEYS */;
/*!40000 ALTER TABLE `tecnico` ENABLE KEYS */;

-- Volcando estructura para tabla techinhouse.tipo_servicio
CREATE TABLE IF NOT EXISTS `tipo_servicio` (
  `cod_servicio` int(11) NOT NULL AUTO_INCREMENT,
  `servicio` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cod_servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla techinhouse.tipo_servicio: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_servicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_servicio` ENABLE KEYS */;

-- Volcando estructura para tabla techinhouse.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `usuario_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(18) DEFAULT NULL,
  `password` varchar(15) DEFAULT NULL,
  `usuario_perfil_cod` int(11) DEFAULT NULL,
  PRIMARY KEY (`usuario_codigo`),
  KEY `R_25` (`usuario_perfil_cod`),
  CONSTRAINT `R_25` FOREIGN KEY (`usuario_perfil_cod`) REFERENCES `usuario_perfil` (`usuario_perfil_cod`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla techinhouse.usuario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`usuario_codigo`, `usuario`, `password`, `usuario_perfil_cod`) VALUES
	(1, 'admin', '123', 1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

-- Volcando estructura para tabla techinhouse.usuario_perfil
CREATE TABLE IF NOT EXISTS `usuario_perfil` (
  `usuario_perfil_cod` int(11) NOT NULL AUTO_INCREMENT,
  `perfil` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`usuario_perfil_cod`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla techinhouse.usuario_perfil: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario_perfil` DISABLE KEYS */;
INSERT INTO `usuario_perfil` (`usuario_perfil_cod`, `perfil`) VALUES
	(1, 'admin');
/*!40000 ALTER TABLE `usuario_perfil` ENABLE KEYS */;

-- Volcando estructura para tabla techinhouse.zona
CREATE TABLE IF NOT EXISTS `zona` (
  `COD_ZONAS` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_zona` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`COD_ZONAS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla techinhouse.zona: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `zona` DISABLE KEYS */;
/*!40000 ALTER TABLE `zona` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
