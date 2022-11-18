DELIMITER //

CREATE PROCEDURE ACTUALIZAR(IN id INT, IN minimo_n INT, IN maximo_n INT)
BEGIN		
    UPDATE Cuantitativas SET minimo = minimo_n, maximo = maximo_n;
   
END; //

DELIMITER ;