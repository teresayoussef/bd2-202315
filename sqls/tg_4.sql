DELIMITER //

CREATE TRIGGER verifcEvaluacion_fecha BEFORE INSERT ON EVALUACIONES FOR EACH ROW 
BEGIN
    DECLARE codTemporal INT DEFAULT (
        SELECT cedula
        FROM ARTICULOS A, EVALUACIONES E_V, CARACTERISTICAS C, EVALUADORES EV, EVALUA E
        WHERE (A.cod_entidad = E.cod_entidad)
        AND   (E.cod_carac = C.cod_carac)
        AND   (E.cod_evaluacion = E_V.cod_evaluacion)
        AND   (E_V.cedula = EV.cedula)
        AND   (E_V.fecha = NEW.fecha) 
    );
    
    IF (codTemporal = NEW.cedula) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ERROR: no se permite mas de una evaluacion por dia';    
    END IF;
END //

DELIMITER ;