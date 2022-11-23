DELIMITER //

CREATE PROCEDURE ELIMINAR_ARTICULO(IN cod INT)
BEGIN
    DELETE FROM EVALUA WHERE cod_articulo = cod;
    DELETE FROM EVALUACIONES WHERE cod IN (SELECT E.cod_evaluacion 
                                          FROM EVALUACIONES E, EVALUA EV
                                          WHERE E.cod_evaluacion = EV.cod_evaluacion
                                          GROUP BY E.id_evaluacion);
    DELETE FROM ARTICULOS WHERE cod_articulo = cod;
END; //

DELIMITER ;