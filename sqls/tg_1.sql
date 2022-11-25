DELIMITER $$

CREATE TRIGGER checkDuplicado_
BEFORE INSERT ON ARTICULOS 

FOR EACH ROW 

BEGIN 

DECLARE cont INT;

SELECT COUNT (descr)
INTO cont
FROM ARTICULOS a
WHERE a.descr = new.descr
AND a.cod_entidad = new.cod_entidad; 

IF (@cont > 0) THEN 
	SET new.descr = CONCAT (new.descr, 'DUPLICADO(A)');
END IF;

		
END $$

DELIMITER ; 
	