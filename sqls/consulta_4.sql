SET @tipo = 2;
SET @caracteristica = 1;

SELECT E.cod_articulo, AVG(E.nota) AS Prom_Evaluaciones
FROM TIPO_ENTIDAD TE, ARTICULOS A, CARACTERISTICAS C, EVALUA E
WHERE (TE.cod_entidad = A.cod_entidad)
AND   (A.cod_articulo = C.cod_articulo)
AND   (A.cod_entidad = @tipo)
AND   (C.cod_carac = E.cod_carac) 
AND   (E.cod_carac = @caracteristica)
AND   (C.tipo = 'Cuantitativa')
GROUP BY cod_articulo;