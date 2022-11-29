/* Realice las sentencias SQL para definir el usuario "usr_sitio_web_<cédula>"
 con acceso de lectura a todas las tablas de la base de datos respectiva a la <cédula> 
 y que, además, posea permisos de escritura sobre la tabla de ventas siempre que se conecte 
 desde el equipo "serverweb".*/

CREATE USER 'usr_sitio_web_28611853'
GRANT SELECT ON bd2_202315_28611853.* TO 'usr_sitio_web_28611853';
GRANT SELECT, INSERT ON bd2_202315_28611853.EVALUACIONES TO 'usr_sitio_web_28611853'@'serverweb';
FLUSH PRIVILEGES;

