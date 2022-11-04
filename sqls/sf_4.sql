/* FUNCIÓN QUE RETORNA EL MEJOR ARTICULO EVALUADO EN FUNCIÓN AL PROMEDIO
   DE UNA CARACTERISTICA CUANTITATIVA. SI EL PUNTAJE LLEGASE A SER IGUAL
   SE TOMARA EL QUE HAYA SIDO EVALUADO MÁS RECIENGTEMENTE Y SI SIGUE SIENDO
   EL MISMO DÍA SE ELIGIRA DE MANEREA ALEATORIA*/


DELIMITER $$

CREATE FUNCTION mejorArticulo(codigoCarac INT)
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE mejor INT;
    
    SELECT A.cod_articulo INTO mejor
    FROM ARTICULOS A, EVALUA E, EVALUACIONES EV, CARACTERISTICAS C
    WHERE  
    A.cod_articulo = E.cod_articulo AND
    E.cod_evaluacion = EV.cod_evaluacion AND
    C.cod_carac = E.cod_carac AND
    C.cod_carac = codigoCarac AND 
    C.tipo = 'cuantitativa'
    GROUP BY (A.cod_articulo)
    HAVING (AVG(E.nota) = (SELECT MAX(Promedio)
	FROM (SELECT AVG(E1.nota) AS Promedio
		FROM EVALUA E1
			WHERE (E1.cod_carac = codigoCarac)
				GROUP BY (E1.cod_articulo)
				)AS tabla )) 
    ORDER BY EV.fecha
    LIMIT 1;
    
    RETURN (mejor);
END$$

DELIMITER ;
