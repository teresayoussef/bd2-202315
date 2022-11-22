/* CREACION DE LA TABLA */

CREATE TABLE ULTIMAS_EVALUACIONES(
    cod_entidad INT NOT NULL,
    cod_carac INT NOT NULL,
    descr VARCHAR(255) NOT NULL,
    nota FLOAT NOT NULL,
    PRIMARY KEY(cod_entidad, cod_carac),
    FOREIGN KEY(cod_entidad) REFERENCES ARTICULOS (cod_entidad) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY(cod_carac) REFERENCES CARACTERISTICAS (cod_carac) ON UPDATE CASCADE ON DELETE RESTRICT
);
    
DELIMITER $$

/* ----------------------------------- */

CREATE PROCEDURE OBT_ULTIMAS_EVALUACIONES()
BEGIN

    DELETE FROM ULTIMAS_EVALUACIONES;
    INSERT INTO ULTIMAS_EVALUACIONES(cod_entidad, cod_carac , descr, nota)
    SELECT A.cod_articulo, C.cod_carac, A.desc, EV.nota
    FROM  ARTICULOS E, CARACTERISTICAS C, EVALUA V, EVALUACIONES EV
    WHERE (E.cod_evaluacion = EV.cod_evaluacion)
    AND   (EV.cod_entidad = A.cod_entidad)
    AND   (EV.cod_carac = C.cod_carac)
    ORDER BY E.fecha DESC
    LIMIT 10;

END $$
DELIMITER ;