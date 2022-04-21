-- # Autor: Gonzalo Fernandez Suarez

-- 5.1

SELECT  nombre as nombre_cliente, email, isbn, titulo, precio, autor_nombre FROM
    (SELECT nombre, email, isbn, titulo, precio FROM 
        (SELECT nombre, email, libro_isbn FROM clientes JOIN
        ejemplares ON email = cesta_cliente_mail) 
    as t1 JOIN libros ON t1.libro_isbn = isbn) 
as t1 JOIN escrito ON libro_isbn = isbn
ORDER BY precio DESC;

-- 5.2

SELECT database(), table_name,table_type, table_rows, create_time  
FROM INFORMATION_SCHEMA.TABLES where table_schema = "practica2";


-- 5.3

CREATE VIEW 
precario AS 
SELECT titulo,precio,autor_nombre FROM libros JOIN escrito 
ON isbn = libro_isbn;

CREATE VIEW 
lista_cliente AS 
SELECT nombre FROM clientes;

-- Creacion de usuario y asignacion de privilegios

CREATE USER 'monitor1' IDENTIFIED BY 'monitor1';
REVOKE ALL PRIVILEGES ON *.* FROM 'monitor1';
GRANT SELECT ON practica2.precario TO 'monitor1';
GRANT SELECT ON practica2.lista_cliente TO 'monitor1';
