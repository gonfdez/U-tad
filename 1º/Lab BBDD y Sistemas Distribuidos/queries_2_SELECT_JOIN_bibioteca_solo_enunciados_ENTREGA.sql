## Queries para biblioteca

## Si estuvieramos desde el cliente de  MariaDB (mysql) ejecutar.
## show databases;
## use  biblioteca;
## show tables;

## En DBeaver, establcer conexión con BD y ejecutar script

## 1) Cuales son las distintas salas en las que hay estantenias  dentro de la biblioteca
SELECT DISTINCT sala FROM estanteria D;


## 2) En que planta se encuentra cada sala
SELECT DISTINCT sala , planta FROM estanteria;

## 3) Cuantas estanterías hay 
SELECT COUNT(cod_estanteria) FROM estanteria;

## 4) Cuales son esas estanterías y en que planta y sala está ubicada cada una
SELECT cod_estanteria, planta, sala FROM estanteria;

## 5) Obtener las estanterías que aún no están ubicadas en la bibilioteca
 SELECT cod_estanteria FROM estanteria WHERE sala IS NULL AND planta IS NULL;

## 6) Cuantos ejemplares hay en cada planta
SELECT planta , COUNT(cod_ejemplar_estanteria) FROM estanteria GROUP BY planta;

## 7) cuantos ejemplares tiene o ha tenido prestados cada alumno, ordernados de mayor a menor
SELECT num_matricula_prestamo, COUNT(cod_ejemplar_prestamo) FROM prestamo GROUP BY num_matricula_prestamo
ORDER BY COUNT(cod_ejemplar_prestamo) DESC;

## 8)  cod del ejemplares que están prestados con el nombre y curso del alumno que lo tiene prestado 
SELECT nombre, curso, prestamo.cod_ejemplar_prestamo FROM alumno LEFT JOIN prestamo ON num_matricula = prestamo.num_matricula_prestamo;


## 9) Nombre, curso y numero de ejemplares que tiene prestado cada alumno
SELECT nombre, curso, COUNT(prestamo.cod_ejemplar_prestamo) FROM alumno INNER JOIN prestamo ON num_matricula = prestamo.num_matricula_prestamo
GROUP BY nombre;

## 10) Lista de ejemplares que nunca han sido prestados
SELECT cod_ejemplar, prestamo.cod_ejemplar_prestamo FROM ejemplar LEFT JOIN prestamo ON cod_ejemplar = prestamo.cod_ejemplar_prestamo
WHERE prestamo.cod_ejemplar_prestamo IS NULL;


