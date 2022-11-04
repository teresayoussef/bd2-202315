/* FUNCIÓN QUE RETORNA LA CANTIDAD DE DÍAS QUE SE HA EVALUADO UNA ENTIDAD*/

DELIMITER $$

CREATE FUNCTION diasEvaluados (
codigoArti INT
) RETURNS INT DETERMINISTIC
BEGIN
DECLARE dias INT;

SELECT COUNT(EV.fecha) INTO dias
FROM ARTICULOS A, EVALUA E, EVALUACIONES EV
WHERE (A.cod_articulo = codigoArti)
AND (A.cod_articulo = E.cod_articulo)
AND (E.cod_evaluacion = EV.cod_evaluacion);

RETURN dias;
END $$

DELIMITER ;