/* Una vista de lectura que muestre el listado
 de el último objeto de cada tipo que ha sido evaluados 
en todas sus características. */

CREATE VIEW LECTURA AS 
SELECT A.cod_articulo, TE.cod_entidad 
FROM TIPO_ENTIDAD TE, ARTICULOS A
WHERE 