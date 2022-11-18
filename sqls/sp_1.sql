DELIMITER //
CREATE PROCEDURE ELIMINAR_TUPLA(IN codArticulo)
BEGIN
    DELETE FROM EVALUACIONES IN (
    SELECT cod_evaluacion 
    FROM EVALUA 
    WHERE (cod_articulo = codArticulo)
    )
    DELETE FROM CARACTERISTICAS WHERE (cod_articulo = codArticulo)
    DELETE FROM EVALUA WHERE (cod_articulo = codArticulo);
END //
    
DELIMITER ;