## Queries para biblioteca

## Si estuvieramos desde el cliente de  MariaDB (mysql) ejecutar.
## show databases;
## use  biblioteca;
## show tables;

## En DBeaver, establcer conexión con BD y ejecutar script

## 1) Consultar todos los autores (su nombre y cuidad) de la biblioteca
 SELECT nombre_autor , ciudad FROM autor; 

## 2) obtener el cod del ejemplar más antiguo de la biblioteca
SELECT cod_ejemplar FROM ejemplar ORDER BY fecha_edicion LIMIT 1;

## 2.1) Ejemplar más reciente
SELECT cod_ejemplar FROM ejemplar ORDER BY fecha_edicion DESC LIMIT 1;

## 3) Nombre de autor cuyo nombre contenga la cadena de caracteres 'th'
SELECT nombre_autor FROM autor WHERE nombre_autor LIKE '%th';


## 4) Auoteres de Francia
SELECT nombre_autor FROM autor WHERE  pais = 'Francia';

## 5) Países distintos de los que tenemos autores en la biblioteca
select DISTINCT pais
from autor;

## 6) El número de países distintos 
SELECT COUNT( DISTINCT pais ) FROM autor;

## 7) Cuantos autores tenemos de cada pais (group by)
SELECT COUNT( nombre_autor ) , pais FROM autor GROUP BY pais;

## 8) Cuantos ejemplares tenenemos de cada libro
SELECT COUNT( cod_ejemplar ) , cod_libro_ej FROM ejemplar GROUP BY cod_libro_ej;

## 9)  Cuantos ejemplares tenemos prestados
SELECT COUNT( cod_ejemplar_prestamo ) FROM prestamo WHERE fecha_devolucion IS NULL; 

## 10)  Cuales son esos ejemplare
SELECT cod_ejemplar_prestamo FROM prestamo WHERE fecha_devolucion IS NULL;


## 11) Numero de ejemplares prestados a cada alumno ordenados según el numero de libros
## que tienen en orden descendente
SELECT num_matricula_prestamo , COUNT( cod_ejemplar_prestado ) FROM prestamo 
GROUP BY num_matricula_prestamo ORDER BY COUNT( cod_ejemplar_prestado ) DESC;


## INNER JOIN 
## 12) titulo de cada uno de los ejemplares que tenemos en la biblioteca
SELECT cod_ejemplar , cod_libro , titulo FROM ejemplar INNER JOIN libro
ON ejemplar.cod_libro_ej = libro.cod_libro;
   
## RIGHT JOIN
## 13) codigos de los ejemplares que están prestados
SELECT cod_ejemplar , cod_libro_ej FROM ejemplar RIGHT JOIN prestamo ON
ejemplar.cod_ejemplar = prestamo.cod_ejemplar_prestamo WHERE fecha_devolucion IS NULL;
   
