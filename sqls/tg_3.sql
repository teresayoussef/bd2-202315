DELIMITER //

CREATE TRIGGER verifEvaluaFech_insert AFTER INSERT ON ULTIMAS_EVALUACIONES FOR EACH ROW
BEGIN
    IF ((SELECT cod_entidad FROM ULTIMAS_EVALUACIONES WHERE NEW.cod_carac = cod_carac) IS NULL) THEN
	    CALL OBT_ULTIMAS_EVALUACIONES();
    END IF;
END //

DELIMITER ;

//----------------------------------------------------------------

DELIMITER //

CREATE TRIGGER verifEvaluaFech_update AFTER UPDATE ON ULTIMAS_EVALUACIONES FOR EACH ROW
BEGIN
    IF ((SELECT cod_entidad FROM ULTIMAS_EVALUACIONES WHERE NEW.cod_carac = cod_carac) IS NULL) THEN
	    CALL OBT_ULTIMAS_EVALUACIONES();
    END IF;
END //

DELIMITER ;