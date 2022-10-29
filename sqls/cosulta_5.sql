
SELECT A.cod_articulo, A.desc
FROM ARTICULOS A, EVALUACIONES E, EVALUA EV
WHERE (A.cod_articulo = EV.cod_articulo)
AND (EV.cod_evaluacion = E.cod_evaluacion)
AND (E.fecha NOT BETWEEN '2022-10-01' AND CURDATE())
GROUP BY cod_articulo;