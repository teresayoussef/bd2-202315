/* FUNCIÓN QUE RETORNA TODAS LAS EVALUACIONES REALIZADAS ENTRE 
   UNA FECHA INICIAL Y UNA FINAL DE UNA CARACTERISTICA CUANTITATIVA
  PARA UN ARTICULO ESPECIFICADO */


DELIMITER $$

CREATE FUNCTION promedioEvaluaciones(
    FechaInicial DATE,
    FechaFinal DATE,
    caracteristica INT,
    codigoEnti INT
    
) RETURNS FLOAT NOT DETERMINISTIC

BEGIN
    DECLARE promedio FLOAT DEFAULT 0;
    
    SELECT Tabla.promedio INTO promedio 
    FROM (SELECT AVG(E.nota) AS promedio
	FROM CARACTERISTICAS C, EVALUACIONES EV, EVALUA E
	WHERE (EV.cod_evaluacion = V.cod_evaluacion)
	AND   (EV.fecha BETWEEN FechaInicial AND FechaFinal)
	AND   (E.cod_carac = C.cod_carac)
	AND   (C.cod_carac = caracteristica)
	AND   (C.tipo = 'cuantitativa')
	GROUP BY C.cod_carac
    ) AS Tabla;     
     
    RETURN promedio;
END $$

DELIMITER ;
