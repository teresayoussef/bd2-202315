DELIMITER //

CREATE PROCEDURE DUPLICAR_TUPLA(IN cod INT)
BEGIN
    DECLARE cod_nuevo INT DEFAULT (SELECT MAX(cod_entidad) + 1 FROM TIPO_ENTIDAD);
    
    INSERT INTO TIPO_ENTIDAD(cod_entidad, descr)
    SELECT cod_nuevo, descr FROM TIPO_ENTIDAD
    WHERE cod_entidad = cod;
    
    INSERT INTO CARACTERISTICAS(tipo, cod_carac, descr, cod_entidad)
    SELECT tipo, cod_carac_nuevo, descr, cod_nuevo FROM CARACTERISTICAS
    WHERE cod_entidad = cod;
END; //

DELIMITER ;

