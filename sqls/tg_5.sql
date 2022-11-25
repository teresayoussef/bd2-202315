DELIMITER $$

CREATE TRIGGER VerifMejorArt AFTER INSERT ON EVALUA FOR EACH ROW
BEGIN
    DECLARE NotaMax INT DEFAULT (
        SELECT MAX(E.nota)
        FROM ARTICULOS E, CARACTERISTICAS C, EVALUA V, EVALUACIONES EV
        WHERE (A.cod_articulo = new.cod_articulo)
        AND   (A.cod_articulo = E.cod_articulo)
        AND   (E.cod_evaluacion = EV.cod_evaluacion)
        AND   (EV.cod_evaluacion = new.cod_evaluacion)
        AND   (E.cod_carac = C.cod_carac)
        AND   (C.cod_carac = new.cod_carac)
    );

    SELECT EV.mejor_reciente INTO NotaMax
    FROM EVALUACIONES EV
    WHERE new.cod_evaluacion = EV.cod_evaluacion;
END $$

DELIMITER ;