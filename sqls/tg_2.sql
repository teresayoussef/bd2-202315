DELIMITER $$

CREATE TRIGGER impCuant BEFORE INSERT ON EVALUA FOR EACH ROW 
BEGIN
    SET @mini = (
        SELECT minimo
        FROM CUANTITATIVAS 
        WHERE new.cod_carac = cod_carac    
    );
    SET @maxi = (
        SELECT maximo
        FROM CUANTITATIVAS 
        WHERE new.cod_carac = cod_carac    
    );
    
    IF (new.nota NOT BETWEEN @mini AND @maxi) THEN
	SIGNAL SQLSTATE '45000';
    END IF;   
END$$

DELIMITER ;
//-------------------------------------------------
DELIMITER $$

CREATE TRIGGER Impcuant_update BEFORE UPDATE ON EVALUA FOR EACH ROW 
BEGIN
    SET @mini = (
        SELECT minimo
        FROM CUANTITATIVAS 
        WHERE new.cod_carac = cod_carac    
    );
    SET @maxi = (
        SELECT maximo
        FROM CUANTITATIVAS 
        WHERE new.cod_carac = cod_carac    
    );
    
    IF (new.nota NOT BETWEEN @mini AND @maxi) THEN
	SIGNAL SQLSTATE '45000';
    END IF;   
END$$

DELIMITER ;