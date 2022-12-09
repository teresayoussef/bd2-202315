DELIMITER //

CREATE TRIGGER checkDuplicado_ 
BEFORE INSERT ON ARTICULOS
FOR EACH ROW

BEGIN
    DECLARE cont INT;

    SELECT COUNT(cod_articulo) INTO cont
    FROM ARTICULOS
    WHERE (NEW.cod_entidad = cod_entidad)
    AND (NEW.descr = descr);

    IF (cont > 0) THEN
	SET NEW.descr = CONCAT(NEW.descr, 'DUPLICADO(A)');
    END IF;
END //

DELIMITER ;