/* FUNCIÓN QUE RETORNA LA CANTIDAD DE DÍAS QUE SE HA EVALUADO UN ARTICULO*/

DELIMITER $$

CREATE FUNCTION diasEvaluados(
    codiArti INT
) RETURNS INT NOT DETERMINISTIC
BEGIN
    DECLARE dias INT;
    
    SELECT COUNT(DISTINCT EV.fecha) INTO dias
    FROM ARTICULOS A, EVALUA E, EVALUACIONES EV
    WHERE (A.cod_articulo = codiArti)
    AND   (A.cod_articulo = E.cod_articulo)
    AND   (E.cod_evaluacion = EV.cod_evaluacion)
    GROUP BY E.cod_articulo;
    
    RETURN dias;
END $$

DELIMITER ;