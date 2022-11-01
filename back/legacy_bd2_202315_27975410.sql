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

/*Data for the table `Asocia` */

insert  into `Asocia`(`idEntidad`,`idEvaluacion`) values 
(5645,1),
(6529,2),
(6543,5),
(7654,6),
(9876,7),
(45623,3),
(67544,8),
(98765,4);

/*Data for the table `Cualitativas` */

insert  into `Cualitativas`(`descrip`,`valor`,`idEvaluacion`) values 
('bueno','5',1),
('regular','3',2),
('bueno para principiantes','8',7),
('Aumenta el Aprendizaje Continuo','4',8);

/*Data for the table `Cuantitativas` */

insert  into `Cuantitativas`(`min`,`max`,`idEvaluacion`) values 
(6,9,3),
(3,6,4),
(10,30,5),
(1,5,6);

/*Data for the table `Entidades` */

insert  into `Entidades`(`idEntidad`,`tipo`,`caract`,`tipoEnti`) values 
(5645,'I','Cristiano Ronaldo','Jugadores de futbol'),
(6529,'I','Lionel Messi','Jugadores de futbol'),
(6543,'I','Introduccion al hacking etico','Cursos virtuales'),
(7654,'I','Fundamenos JavaScript','Cursos virtuales'),
(9876,'I','HTML y CSS Avanzado','Cursos virtuales'),
(45623,'I','Neymar','Jugadores de futbol'),
(67544,'I','Analisis de datos en phyton','Cursos virtuales'),
(98765,'I','Mbappe','Jugadores de futbol');

/*Data for the table `Evaluaciones` */

insert  into `Evaluaciones`(`idEvaluacion`,`tipo_evalua`,`idEvaluador`) values 
(1,'cualitativas',25526),
(2,'cualitativas',32134),
(3,'cuantitativas',98342),
(4,'cuantitativas',98611),
(5,'cuantitativa',1),
(6,'cuantitativa',2),
(7,'cualitativa',3),
(8,'cualitativa',4);

/*Data for the table `Evaluadores` */

insert  into `Evaluadores`(`idEvaluador`,`NombreEvalu`) values 
(1,'Anthony barrios'),
(2,'Ricardo Fernandez'),
(3,'Abril Vargas'),
(4,'Francisco Ricardi'),
(25526,'Cesar Rojas'),
(32134,'Joumana Abi saba'),
(98342,'Fady Georges'),
(98611,'Paolo Youssef');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
