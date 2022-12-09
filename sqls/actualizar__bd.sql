/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 10.5.7-MariaDB-1:10.5.7+maria~focal : Database - bd2_202315_28611853
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bd2_202315_28611853` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `bd2_202315_28611853`;

/*Table structure for table `ARTICULOS` */

DROP TABLE IF EXISTS `ARTICULOS`;

CREATE TABLE `ARTICULOS` (
  `cod_articulo` int(11) NOT NULL,
  `descr` varchar(200) NOT NULL,
  `tipo` char(1) NOT NULL,
  `cod_entidad` int(11) NOT NULL,
  PRIMARY KEY (`cod_articulo`),
  KEY `Relationship4` (`cod_entidad`),
  CONSTRAINT `Relationship4` FOREIGN KEY (`cod_entidad`) REFERENCES `TIPO_ENTIDAD` (`cod_entidad`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `CARACTERISTICAS` */

DROP TABLE IF EXISTS `CARACTERISTICAS`;

CREATE TABLE `CARACTERISTICAS` (
  `tipo` char(50) NOT NULL,
  `cod_carac` int(11) NOT NULL,
  `descr` varchar(200) NOT NULL,
  `cod_entidad` int(11) NOT NULL,
  PRIMARY KEY (`cod_carac`),
  KEY `cod_entidad` (`cod_entidad`),
  CONSTRAINT `CARACTERISTICAS_ibfk_1` FOREIGN KEY (`cod_entidad`) REFERENCES `TIPO_ENTIDAD` (`cod_entidad`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `CUALITATIVAS` */

DROP TABLE IF EXISTS `CUALITATIVAS`;

CREATE TABLE `CUALITATIVAS` (
  `cod_carac` int(11) NOT NULL,
  `valor` char(20) NOT NULL,
  PRIMARY KEY (`cod_carac`,`valor`),
  KEY `Relationship3` (`valor`),
  CONSTRAINT `Relationship2` FOREIGN KEY (`cod_carac`) REFERENCES `CARACTERISTICAS` (`cod_carac`) ON UPDATE CASCADE,
  CONSTRAINT `Relationship3` FOREIGN KEY (`valor`) REFERENCES `NOTAS_CUALITATIVAS` (`valor`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `CUANTITATIVAS` */

DROP TABLE IF EXISTS `CUANTITATIVAS`;

CREATE TABLE `CUANTITATIVAS` (
  `cod_carac` int(11) NOT NULL,
  `minimo` int(11) NOT NULL,
  `maximo` int(11) NOT NULL,
  PRIMARY KEY (`cod_carac`),
  CONSTRAINT `Relationship1` FOREIGN KEY (`cod_carac`) REFERENCES `CARACTERISTICAS` (`cod_carac`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `EVALUA` */

DROP TABLE IF EXISTS `EVALUA`;

CREATE TABLE `EVALUA` (
  `cod_entidad` int(11) NOT NULL,
  `cod_articulo` int(11) NOT NULL,
  `cod_carac` int(11) NOT NULL,
  `cod_evaluacion` int(11) NOT NULL,
  `nota` int(11) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`cod_entidad`,`cod_articulo`,`cod_carac`,`cod_evaluacion`),
  KEY `Relationship8` (`cod_articulo`),
  KEY `Relationship9` (`cod_carac`),
  KEY `Relationship10` (`cod_evaluacion`),
  CONSTRAINT `Relationship10` FOREIGN KEY (`cod_evaluacion`) REFERENCES `EVALUACIONES` (`cod_evaluacion`) ON UPDATE CASCADE,
  CONSTRAINT `Relationship7` FOREIGN KEY (`cod_entidad`) REFERENCES `TIPO_ENTIDAD` (`cod_entidad`) ON UPDATE CASCADE,
  CONSTRAINT `Relationship8` FOREIGN KEY (`cod_articulo`) REFERENCES `ARTICULOS` (`cod_articulo`) ON UPDATE CASCADE,
  CONSTRAINT `Relationship9` FOREIGN KEY (`cod_carac`) REFERENCES `CARACTERISTICAS` (`cod_carac`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `EVALUACIONES` */

DROP TABLE IF EXISTS `EVALUACIONES`;

CREATE TABLE `EVALUACIONES` (
  `cod_evaluacion` int(11) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `cedula` int(11) DEFAULT NULL,
  `fecha` date NOT NULL,
  `cod_entidad` int(11) NOT NULL,
  `mejor_reciente` int(11) NOT NULL,
  PRIMARY KEY (`cod_evaluacion`),
  KEY `IX_Relationship6` (`cedula`),
  KEY `cod_entidad` (`cod_entidad`),
  CONSTRAINT `EVALUACIONES_ibfk_1` FOREIGN KEY (`cod_entidad`) REFERENCES `Entidades` (`cod_entidad`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `Relationship6` FOREIGN KEY (`cedula`) REFERENCES `EVALUADORES` (`cedula`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `EVALUADORES` */

DROP TABLE IF EXISTS `EVALUADORES`;

CREATE TABLE `EVALUADORES` (
  `cedula` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `apellido` varchar(200) NOT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `NOTAS_CUALITATIVAS` */

DROP TABLE IF EXISTS `NOTAS_CUALITATIVAS`;

CREATE TABLE `NOTAS_CUALITATIVAS` (
  `valor` char(20) NOT NULL,
  `desc` varchar(200) NOT NULL,
  PRIMARY KEY (`valor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `TIPO_ENTIDAD` */

DROP TABLE IF EXISTS `TIPO_ENTIDAD`;

CREATE TABLE `TIPO_ENTIDAD` (
  `cod_entidad` int(11) NOT NULL,
  `descr` varchar(200) NOT NULL,
  PRIMARY KEY (`cod_entidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `ULTIMAS_EVALUACIONES` */

DROP TABLE IF EXISTS `ULTIMAS_EVALUACIONES`;

CREATE TABLE `ULTIMAS_EVALUACIONES` (
  `cod_entidad` int(11) NOT NULL,
  `cod_carac` int(11) NOT NULL,
  `descr` varchar(255) NOT NULL,
  `nota` float NOT NULL,
  PRIMARY KEY (`cod_entidad`,`cod_carac`),
  KEY `cod_carac` (`cod_carac`),
  CONSTRAINT `ULTIMAS_EVALUACIONES_ibfk_1` FOREIGN KEY (`cod_entidad`) REFERENCES `ARTICULOS` (`cod_entidad`) ON UPDATE CASCADE,
  CONSTRAINT `ULTIMAS_EVALUACIONES_ibfk_2` FOREIGN KEY (`cod_carac`) REFERENCES `CARACTERISTICAS` (`cod_carac`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
