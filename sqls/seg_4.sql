/* Una vista, que permita obtener todas las calificaciones realizadas
 por un evaluador (Vista con parámetros) pasando el id del evaluador.*/

CREATE FUNCTION funcion1() RETURNS INTEGER DETERMINISTIC NO SQL RETURN @funcion1;

CREATE VIEW CalifEvalua AS
SELECT nota
FROM EVALUA AS E, EVALUACIONES AS EV
WHERE (EV.cod_evaluacion = funcion1()) 
AND (EV.cod_evaluacion = E.cod_evaluacion);
           
SELECT * FROM (SELECT @funcion1 := 26543421 cedulaEvaluador) alias, CalifEvalua;