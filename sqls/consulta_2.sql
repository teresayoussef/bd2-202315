SET @FechaInicial = '2022-07-05';
SET @FechaFinal = '2022-10-19';
SET @caracteristica = 1;

SELECT COUNT(*) AS cantidad, AVG(EV.nota) AS promedio, MAX(EV.nota) AS maximo, MIN(EV.nota) AS minimo
FROM CARACTERISTICAS C, EVALUACIONES E, EVALUA EV, CUANTITATIVAS CUAN 
WHERE (E.cod_evaluacion = EV.cod_evaluacion)
AND   (EV.cod_carac = C.cod_carac)
AND   (E.fecha BETWEEN @FechaInicial AND @FechaFinal)
AND   (C.cod_carac = CUAN.cod_carac)
AND   (C.cod_carac = @caracteristica);