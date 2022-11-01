/*
Created: 28/10/2022
Modified: 28/10/2022
Model: MySQL 8.0
Database: MySQL 8.0
*/

-- Create tables section -------------------------------------------------

-- Table TIPO_ENTIDAD

CREATE TABLE `TIPO_ENTIDAD`
(
  `cod_entidad` Int NOT NULL,
  `desc` Varchar(200) NOT NULL
)
;

ALTER TABLE `TIPO_ENTIDAD` ADD PRIMARY KEY (`cod_entidad`)
;

-- Table ARTICULOS

CREATE TABLE `ARTICULOS`
(
  `cod_articulo` Int NOT NULL,
  `desc` Varchar(200) NOT NULL,
  `tipo` Char(1) NOT NULL,
  `cod_entidad` Int NOT NULL
)
;

ALTER TABLE `ARTICULOS` ADD PRIMARY KEY (`cod_articulo`)
;

-- Table CARACTERISTICAS

CREATE TABLE `CARACTERISTICAS`
(
  `cod_carac` Int NOT NULL,
  `desc` Varchar(200) NOT NULL,
  `cod_articulo` Int
)
;

CREATE INDEX `IX_Relationship5` ON `CARACTERISTICAS` (`cod_articulo`)
;

ALTER TABLE `CARACTERISTICAS` ADD PRIMARY KEY (`cod_carac`)
;

-- Table CUANTITATIVAS

CREATE TABLE `CUANTITATIVAS`
(
  `Attribute1` Char(20),
  `cod_carac` Int NOT NULL
)
;

ALTER TABLE `CUANTITATIVAS` ADD PRIMARY KEY (`cod_carac`)
;

-- Table CUALITATIVAS

CREATE TABLE `CUALITATIVAS`
(
  `cod_carac` Int NOT NULL,
  `valor` Char(20) NOT NULL
)
;

ALTER TABLE `CUALITATIVAS` ADD PRIMARY KEY (`cod_carac`, `valor`)
;

-- Table EVALUACIONES

CREATE TABLE `EVALUACIONES`
(
  `cod_evaluacion` Int NOT NULL,
  `desc` Varchar(200) NOT NULL,
  `nota` Decimal(10,2) NOT NULL,
  `cedula` Int
)
;

CREATE INDEX `IX_Relationship6` ON `EVALUACIONES` (`cedula`)
;

ALTER TABLE `EVALUACIONES` ADD PRIMARY KEY (`cod_evaluacion`)
;

-- Table EVALUADORES

CREATE TABLE `EVALUADORES`
(
  `cedula` Int NOT NULL,
  `nombre` Varchar(200) NOT NULL,
  `apellido` Varchar(200) NOT NULL
)
;

ALTER TABLE `EVALUADORES` ADD PRIMARY KEY (`cedula`)
;

-- Table NOTAS_CUALITATIVAS

CREATE TABLE `NOTAS_CUALITATIVAS`
(
  `valor` Char(20) NOT NULL,
  `desc` Varchar(200) NOT NULL
)
;

ALTER TABLE `NOTAS_CUALITATIVAS` ADD PRIMARY KEY (`valor`)
;

-- Table EVALUA

CREATE TABLE `EVALUA`
(
  `cod_entidad` Int NOT NULL,
  `cod_articulo` Int NOT NULL,
  `cod_carac` Int NOT NULL,
  `cod_evaluacion` Int NOT NULL,
  `nota` Int NOT NULL
)
;

ALTER TABLE `EVALUA` ADD PRIMARY KEY (`cod_entidad`, `cod_articulo`, `cod_carac`, `cod_evaluacion`)
;

-- Create foreign keys (relationships) section -------------------------------------------------

ALTER TABLE `CUANTITATIVAS` ADD CONSTRAINT `Relationship1` FOREIGN KEY (`cod_carac`) REFERENCES `CARACTERISTICAS` (`cod_carac`) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE `CUALITATIVAS` ADD CONSTRAINT `Relationship2` FOREIGN KEY (`cod_carac`) REFERENCES `CARACTERISTICAS` (`cod_carac`) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE `CUALITATIVAS` ADD CONSTRAINT `Relationship3` FOREIGN KEY (`valor`) REFERENCES `NOTAS_CUALITATIVAS` (`valor`) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE `ARTICULOS` ADD CONSTRAINT `Relationship4` FOREIGN KEY (`cod_entidad`) REFERENCES `TIPO_ENTIDAD` (`cod_entidad`) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE `CARACTERISTICAS` ADD CONSTRAINT `Relationship5` FOREIGN KEY (`cod_articulo`) REFERENCES `ARTICULOS` (`cod_articulo`) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE `EVALUACIONES` ADD CONSTRAINT `Relationship6` FOREIGN KEY (`cedula`) REFERENCES `EVALUADORES` (`cedula`) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE `EVALUA` ADD CONSTRAINT `Relationship7` FOREIGN KEY (`cod_entidad`) REFERENCES `TIPO_ENTIDAD` (`cod_entidad`) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE `EVALUA` ADD CONSTRAINT `Relationship8` FOREIGN KEY (`cod_articulo`) REFERENCES `ARTICULOS` (`cod_articulo`) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE `EVALUA` ADD CONSTRAINT `Relationship9` FOREIGN KEY (`cod_carac`) REFERENCES `CARACTERISTICAS` (`cod_carac`) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE `EVALUA` ADD CONSTRAINT `Relationship10` FOREIGN KEY (`cod_evaluacion`) REFERENCES `EVALUACIONES` (`cod_evaluacion`) ON DELETE RESTRICT ON UPDATE CASCADE
;

