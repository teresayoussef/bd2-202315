DELIMITER //

CREATE TRIGGER verifMejorArticulo AFTER INSERT ON EVALUA FOR EACH ROW
BEGIN
    IF (mejorArticulo(NEW.cod_carac) = NEW.cod_entidad) THEN
        UPDATE ARTICULOS
        SET mejor = NEW.cod_carac
        WHERE (cod_articulo = NEW.cod_articulo);
    END IF;    
END //

DELIMITER ;