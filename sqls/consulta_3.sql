SET @tipo = 1;

SELECT C.cod_carac, C.desc, C.tipo
FROM CARACTERISTICAS C, ARTICULOS A, TIPO_ENTIDAD TE 
WHERE (C.cod_articulo = A.cod_articulo)
AND   (A.cod_entidad = TE.cod_entidad)
AND   (TE.cod_entidad = @tipo)
GROUP BY cod_carac;