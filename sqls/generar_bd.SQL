/*
Created: 5/10/2022
Modified: 5/10/2022
Model: MySQL 8.0
Database: MySQL 8.0
*/

-- Create tables section -------------------------------------------------

-- Table Evaluadores

CREATE TABLE `Evaluadores`
(
  `idEvaluador` Serial NOT NULL
)
;

ALTER TABLE `Evaluadores` ADD PRIMARY KEY (`idEvaluador`)
;

-- Table Entidades

CREATE TABLE `Entidades`
(
  `idEntidad` Serial NOT NULL,
  `tipo` Char(1) NOT NULL,
  `caract` Char(20) NOT NULL
)
;

ALTER TABLE `Entidades` ADD PRIMARY KEY (`idEntidad`)
;

-- Table Asocia

CREATE TABLE `Asocia`
(
  `idEntidad` Serial NOT NULL,
  `idEvaluacion` Serial NOT NULL
)
;

ALTER TABLE `Asocia` ADD PRIMARY KEY (`idEntidad`, `idEvaluacion`)
;

-- Table Cuantitativas

CREATE TABLE `Cuantitativas`
(
  `min` Int NOT NULL,
  `max` Int NOT NULL,
  `idEvaluacion` Serial NOT NULL
)
;

ALTER TABLE `Cuantitativas` ADD PRIMARY KEY (`idEvaluacion`)
;

-- Table Cualitativas

CREATE TABLE `Cualitativas`
(
  `descrip` Char(20) NOT NULL,
  `valor` Int NOT NULL,
  `idEvaluacion` Serial NOT NULL
)
;

ALTER TABLE `Cualitativas` ADD PRIMARY KEY (`idEvaluacion`)
;

-- Table Evaluaciones

CREATE TABLE `Evaluaciones`
(
  `idEvaluacion` Serial NOT NULL,
  `tipo_evalua` Char(20) NOT NULL,
  `idEvaluador` Serial NOT NULL
)
;

ALTER TABLE `Evaluaciones` ADD PRIMARY KEY (`idEvaluacion`)
;

-- Create foreign keys (relationships) section -------------------------------------------------

ALTER TABLE `Evaluaciones` ADD CONSTRAINT `Relationship1` FOREIGN KEY (`idEvaluador`) REFERENCES `Evaluadores` (`idEvaluador`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Asocia` ADD CONSTRAINT `Relationship2` FOREIGN KEY (`idEntidad`) REFERENCES `Entidades` (`idEntidad`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Asocia` ADD CONSTRAINT `Relationship3` FOREIGN KEY (`idEvaluacion`) REFERENCES `Evaluaciones` (`idEvaluacion`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Cuantitativas` ADD CONSTRAINT `Relationship4` FOREIGN KEY (`idEvaluacion`) REFERENCES `Evaluaciones` (`idEvaluacion`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Cualitativas` ADD CONSTRAINT `Relationship5` FOREIGN KEY (`idEvaluacion`) REFERENCES `Evaluaciones` (`idEvaluacion`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

