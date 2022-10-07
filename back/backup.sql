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

/*Table structure for table `Asocia` */

DROP TABLE IF EXISTS `Asocia`;

CREATE TABLE `Asocia` (
  `idEntidad` bigint(20) NOT NULL,
  `idEvaluacion` bigint(20) NOT NULL,
  PRIMARY KEY (`idEntidad`,`idEvaluacion`),
  KEY `Relationship3` (`idEvaluacion`),
  CONSTRAINT `Relationship2` FOREIGN KEY (`idEntidad`) REFERENCES `Entidades` (`idEntidad`),
  CONSTRAINT `Relationship3` FOREIGN KEY (`idEvaluacion`) REFERENCES `Evaluaciones` (`idEvaluacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `Asocia` */

insert  into `Asocia`(`idEntidad`,`idEvaluacion`) values 
(5645,1),
(6529,2),
(45623,3),
(98765,4);

/*Table structure for table `Cualitativas` */

DROP TABLE IF EXISTS `Cualitativas`;

CREATE TABLE `Cualitativas` (
  `descrip` char(20) NOT NULL,
  `valor` int(11) NOT NULL,
  `idEvaluacion` bigint(20) NOT NULL,
  PRIMARY KEY (`idEvaluacion`),
  CONSTRAINT `Relationship5` FOREIGN KEY (`idEvaluacion`) REFERENCES `Evaluaciones` (`idEvaluacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `Cualitativas` */

insert  into `Cualitativas`(`descrip`,`valor`,`idEvaluacion`) values 
('bueno',5,1),
('regular',3,2);

/*Table structure for table `Cuantitativas` */

DROP TABLE IF EXISTS `Cuantitativas`;

CREATE TABLE `Cuantitativas` (
  `min` int(11) NOT NULL,
  `max` int(11) NOT NULL,
  `idEvaluacion` bigint(20) NOT NULL,
  PRIMARY KEY (`idEvaluacion`),
  CONSTRAINT `Relationship4` FOREIGN KEY (`idEvaluacion`) REFERENCES `Evaluaciones` (`idEvaluacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `Cuantitativas` */

insert  into `Cuantitativas`(`min`,`max`,`idEvaluacion`) values 
(6,9,3),
(3,6,4);

/*Table structure for table `Entidades` */

DROP TABLE IF EXISTS `Entidades`;

CREATE TABLE `Entidades` (
  `idEntidad` bigint(20) NOT NULL,
  `tipo` char(1) NOT NULL,
  `caract` char(20) NOT NULL,
  PRIMARY KEY (`idEntidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `Entidades` */

insert  into `Entidades`(`idEntidad`,`tipo`,`caract`) values 
(5645,'I','CONMEBOL'),
(6529,'I','CAF'),
(45623,'I','AFC'),
(98765,'I','UEFA');

/*Table structure for table `Evaluaciones` */

DROP TABLE IF EXISTS `Evaluaciones`;

CREATE TABLE `Evaluaciones` (
  `idEvaluacion` bigint(20) NOT NULL,
  `tipo_evalua` char(20) NOT NULL,
  `idEvaluador` bigint(20) NOT NULL,
  PRIMARY KEY (`idEvaluacion`),
  KEY `Relationship1` (`idEvaluador`),
  CONSTRAINT `Relationship1` FOREIGN KEY (`idEvaluador`) REFERENCES `Evaluadores` (`idEvaluador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `Evaluaciones` */

insert  into `Evaluaciones`(`idEvaluacion`,`tipo_evalua`,`idEvaluador`) values 
(1,'cualitativa',25526),
(2,'cualitativa',32134),
(3,'cuantitativa',98342),
(4,'cuantitativa',98611);

/*Table structure for table `Evaluadores` */

DROP TABLE IF EXISTS `Evaluadores`;

CREATE TABLE `Evaluadores` (
  `idEvaluador` bigint(20) NOT NULL,
  PRIMARY KEY (`idEvaluador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `Evaluadores` */

insert  into `Evaluadores`(`idEvaluador`) values 
(25526),
(32134),
(98342),
(98611);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
