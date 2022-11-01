SET @tipo = 2;

SELECT A.cod_articulo, A.desc, EV.cod_evaluacion, E.desc, EV.nota, E.fecha
FROM ARTICULOS A, CARACTERISTICAS C, EVALUACIONES E, EVALUA EV, TIPO_ENTIDAD TE
WHERE (TE.cod_entidad = @tipo)
AND   (TE.cod_entidad = A.cod_entidad)
AND   (EV.cod_evaluacion= E.cod_evaluacion)
AND   (C.tipo = 'cualitativa')
AND   (EV.cod_carac= C.cod_carac)
AND   (A.cod_articulo = EV.cod_articulo)
ORDER BY C.cod_carac ASC, EV.cod_evaluacion ASC;

