DELIMITER $$

CREATE TRIGGER verif_evalau_fech BEFORE INSERT ON EVALUACIONES FOR EACH ROW 
BEGIN

SET @PrinEvalua = (SELECT cod_evaluacion
               FROM EVALUACIONES AS EV, EVALUA AS t, CARACTERISTICAS AS c, ARTICULOS AS o
               WHERE 
            EV.cod_evaluacion = E.cod_evaluacion 
            AND C.cod_carac = E.cod_carac 
            AND A.cod_articulo   = E.cod_articulo   
            AND new.Fecha = EV.Fecha);
         
IF ( new.cod_evaluacion = @PrinEvalua) THEN

   SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: no se permite mas de una evaluacion por dia';
            
END IF;    
  
END$$

DELIMITER ;