## Queries para biblioteca

## Si estuvieramos desde el cliente de  MariaDB (mysql) ejecutar.
## show databases;
## use  biblioteca;
## show tables;

## En DBeaver, establcer conexión con BD y ejecutar script

## 1) Insertar tres filas en la tabla autor con todos sus datos rellenos (los datos pueden ser los que cada uno quiera)
 insert into autor (nombre_autor , ciudad , pais )
values ('Asimov', 'Petrovichi', 'Rusia'),
('Umbert Eco', 'Milan', 'Italia'), 
('Garcia Lorca', 'Granada', 'España');


## 2) Insertar un autor nuevo cuyo nombre es 'Claudio' del que se desconoce su ciudad y pais.
insert into autor (nombre_autor )
values ('Claudio');

## 3) Actulizar la tabla autor indicando que la ciudad y el país del autor 'Claudio' es Lyon y Francia respectivamente
 update autor 
 set ciudad = 'Lyon', pais = 'Francia' 
 where nombre_autor = 'Claudio';


## 4) Hoy se han comprado tres ejemplares nuevos del libro  "Leer es lo que importa" 
## cuya area temática es "Lengua". 
## De momento del libro solo se conoce el titulo y el área tematica. 
## De los ejemplares se sabe que se han comprado en la fecha de hoy y que fueron editados el 25/02/2017. 
## Actualizar las tablas correspondientes.
insert into libro (cod_libro ,titulo, area_tematica )
values ('L-008', 'Leer es lo que importa', 'Lengua');

insert into ejemplar (cod_ejemplar , cod_libro_ej , fecha_compra , fecha_edicion )
values ('L', 'L-008', CURDATE(), '2017-02-25'), 
('M', 'L-008', CURDATE(), '2017-02-25'), 
('N', 'L-008', CURDATE(), '2017-02-25');

## Otra forma de hacer la sentencia anterior en dos pasos:
## Paso 1: 
## insert into ejemplar (cod_ejemplar, fecha_compra , fecha_edicion )
## values ('L', CURDATE(),'2017-02-25'),
## ('M', CURDATE(),'2017-02-25'),
## ('N', CURDATE(),'2017-02-25');

## Paso 2: 
## update ejemplar 
## set cod_libro_ej = (select cod_libro from libro where titulo = 'Leer es lo que importa')
## where cod_ejemplar = 'L' or cod_ejemplar = 'M' or cod_ejemplar = 'N';


## 4.1) Actualizar la información del libro que falta sabiendo que es el autor es 'Claudio'
## y la editorial 'Anaya'
 UPDATE libro 
 set editorial = 'Anaya', 
 cod_autor_lib = (select cod_autor from autor where nombre_autor = 'Claudio') 
 where cod_libro = 'L-008'


## 5) El alumno cuyo numero matricula es 5 ha devuelto HOY todos los libros que tenía prestados.  
## Actualizar la tabla correspondiente
UPDATE prestamo
SET fecha_devolucion = CURRENT_DATE()
WHERE num_matricula_prestamo = 5;


## 6) Hay 3 nuevos alumnos (Alba, Marta, Rosa) que se han dado de alta en la biblioteca. 
## Uno es de CUARTO curso y los otros 2 son de PRIMERO. Actualizar la tabla correspondiente. 
INSERT INTO alumno (Nombre,curso)
VALUES ('ALBA','CUARTO'),
('ROSA','PRIMERO'),
('MARTA','PRIMERO');

## 7) El libro "Le petit maison" ha sido dado de baja de la biblioteca. 
## Actualizr la tabla correspondiente y ver que pasa. 
DELETE FROM libro WHERE titulo = 'Le petit maison';

##No me deja borrarlo, sale un error que tiene que ver con las claves foraneas y primarias
## que se ven afectadas por este cambio


## 8) Se va a reformar la Sala10 de la planta 1 por lo que los ejemplares que estaban allí ubicados serán 
## cambiados a la Sala11 de la misma planta.  ## Actualizar la BD sabiendo dicha información. 
UPDATE estanteria SET sala='Sala11' WHERE sala='Sala10';


## 9) Obetener el el libro y el codigo del ejemplar de aquellos ejemplares que no tienen ubicación (planta y sala)
## Si hay alguno, entonces  actualizar la BD para colocarlo en la planta 1 y Sala11.
## Lo ejecutaremos por pasos: 
## Paso 1: buscamos los libros y los ejemplares que no tienen asignada ubicacion
SELECT cod_ejemplar FROM ejemplar
LEFT JOIN estanteria ON cod_ejemplar=cod_ejemplar_estanteria 
WHERE cod_ejemplar_estanteria IS NUll;
# Paso 2: actulizamos su ubicacion
 INSERT INTO estanteria (cod_ejemplar_estanteria,planta,sala)
 values ('L','1','Sala11'),
 ('M','1','Sala11'),
 ('N','1','Sala11');
## el ejemplar K esta presente en la tabla estanteria pero no tiene asignada ninguna planta ni sala
##por lo que lo actualizo tambien
UPDATE estanteria
SET planta=1 , sala='Sala11'
WHERE cod_ejemplar_estanteria = 'K';

## 10)  Se han comprado dos estanterías nuevas que se ubicarán en la planta 5 de la biblioteca 
## aunque está por determianar la sala. Actualizar la BD con esta información. 
INSERT INTO estanteria (planta)
VALUES (5),(5);


   
