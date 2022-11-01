SELECT te.desc, COUNT(*) AS cantidad
FROM TIPO_ENTIDAD te, ARTICULOS a
WHERE (te.cod_entidad = a.cod_entidad)
GROUP BY te.desc;