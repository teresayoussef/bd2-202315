SET @fechaInicio = DATE(CURDATE() - INTERVAL 1 MONTH);
SET @fechaFinal = CURDATE();

SELECT A.cod_articulo, A.desc
FROM ARTICULOS A, EVALUACIONES EV, EVALUA E 
WHERE (A.cod_articulo = E.cod_articulo)
AND (E.cod_evaluacion = EV.cod_evaluacion)
AND (EV.fecha NOT BETWEEN @fechaInicio AND @fechaFinal)
GROUP BY cod_articulo; 