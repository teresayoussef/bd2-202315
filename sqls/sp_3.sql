
DELIMITER //

CREATE PROCEDURE ACTUALIZAR_MIN_MAX(IN cod INT, IN new_min INT, IN new_max INT)
BEGIN
    DECLARE maxi INT DEFAULT (SELECT maximo FROM CUANTITATIVAS WHERE cod_carac = cod);
    
    UPDATE CUANTITATIVAS  
    SET minimo = new_min, maximo = new_max
    WHERE cod_carac = cod;
    
    UPDATE EVALUA
    SET nota = nota * (new_min + new_max) / maxi
    WHERE cod_carac = cod;
END; //

DELIMITER ;