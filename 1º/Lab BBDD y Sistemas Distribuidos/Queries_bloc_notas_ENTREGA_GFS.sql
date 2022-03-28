## Queries para el bloc de notas

show databases;
use  BD_bloc_de_notas;
show tables;

## 1) Nota con mayor número de caracteres
SELECT texto, length(texto)
FROM nota
ORDER BY length(texto) DESC LIMIT 1;

## 2) Usuarios con más blocs de notas 
SELECT COUNT(id_bloc), id_usr_bloc
FROM bloc GROUP BY id_usr_bloc
ORDER BY COUNT(id_bloc) DESC;

## 3) Obtener las 5 notas más recientes y las más antiguas
## 3.1) 5 notas más recientes
SELECT * FROM nota
ORDER BY fecha_creacion DESC LIMIT 5;

## 3.2) 5 notas más antiguas
SELECT * FROM nota
ORDER BY fecha_creacion ASC LIMIT 5;

## 4) Notas cuyo título o texto contenga la palabra “ becas”
SELECT * FROM nota
WHERE texto = '%becas%';

## 5) Cuantos tags tiene cada nota ordenados de forma descentdente
SELECT id_nota_tag, count(id_tag) FROM tag 
GROUP BY id_nota_tag ORDER BY count(id_tag) DESC;


## 6)Tags más populares
## 6.1) obtener el Tag que aparece en más notas
SELECT id_tag, COUNT(id_nota_tag) FROM tag
GROUP BY id_tag ORDER BY COUNT(id_nota_tag) DESC LIMIT 1;
## 6.2) Los 5 Tags que aparecen en más notas  
SELECT id_tag, COUNT(id_nota_tag) FROM tag
GROUP BY id_tag ORDER BY COUNT(id_nota_tag) DESC LIMIT 5;


## 7) EL bloc con mayor número de notas
 SELECT id_bloc_nota, COUNT(id_nota) FROM nota 
 GROUP BY id_bloc_nota ORDER BY COUNT(id_nota) DESC LIMIT 1;

## 8) La nota más modificada
SELECT id_nota_mod, COUNT(id_mod) FROM modificacion
GROUP BY id_nota_mod ORDER BY COUNT(id_mod) DESC LIMIT 1;

## 9) Crear una vista en la que tengamos el id de la nota, su titulo, su texto, el id del bloc al que pertence y el id del usuario que creo dicho bloque
SELECT id_nota, texto, id_bloc_nota, bloc.id_usr_bloc FROM nota
INNER JOIN bloc WHERE id_bloc_nota = bloc.id_bloc;

## 10) Obtener (utilizando la vista creada anteriormente) cual es el nombre del usuario que creo cada nota
SELECT id_nota, texto, id_bloc_nota, bloc.id_usr_bloc, usuario.nombre_user FROM nota
INNER JOIN bloc, usuario WHERE id_bloc_nota = bloc.id_bloc AND bloc.id_usr_bloc = usuario.id_usr;

## 11) Eliminar todos los adjuntos de la nota cuyo titulo contiene la palabra 'Talentum' 
DELETE FROM adjunto
WHERE id_adj = (SELECT id_adj FROM adjunto INNER JOIN nota WHERE nota.texto = '%Talentum%');
## 12) Insertar tres nuevos blocs de notas (los que se quieran) 
INSERT INTO bloc(nombre_bloc,fecha_creacion,id_usr_bloc)
VALUES
('NombresDeAlumnos','2020-03-25 12:45:30',6),
('AtencionAlAlumno','2020-03-15 23:42:02',3),
('ComoSeUsaElBlocDeNotas','2020-03-27 14:13:50',4);

## 13)  Actualizar la nota cuyo titulo contiene la palabra 'Carnaval' con el siguiente texto:
## 'Por motivos ajenos a la universidad se suspenden las Fiestas de Carnaval'
UPDATE nota
SET texto='Por motivos ajenos a la universidad se suspenden las Fiestas de Carnaval'
WHERE texto = '%Carnaval%';
 
## 14) Cuales son los países distintos de los que tenemos usuarios
SELECT pais FROM usuario GROUP BY pais;

## 15) Número de países distintos de los que tenemos usuarios
SELECT COUNT(DISTINCT pais) FROM usuario;

## 16) Cuantos usuarios hay de cada pais
SELECT pais, COUNT(id_usr) FROM usuario GROUP BY pais;

## 17) Actualizar la BD para cambiar de bloc la nota cuyo titulo contiene la palabra 'Bocadillos' , 
## debe cambiarse al bloc de notas cuyo nombre es 'ocio'
UPDATE nota 
SET id_bloc_nota=(SELECT id_bloc FROM bloc WHERE nombre_bloc = 'ocio')
WHERE texto='%Bocadillos%';
## 18) Cuales son los blocs de notas que están vacios (ninguna nota)

SELECT id_bloc, nota.id_bloc_nota FROM bloc
LEFT JOIN nota ON id_bloc = nota.id_bloc_nota WHERE id_bloc_nota IS NULL;

## 19) Cuales son las notas que no tienen adjuntos
SELECT id_nota, adjunto.id_adj FROM nota
LEFT JOIN adjunto ON id_nota = adjunto.id_adj WHERE id_adj IS NULL;


## 20) Cual es la nota con mayor número de modificaciones
SELECT id_nota, COUNT(modificacion.id_mod) FROM nota 
LEFT JOIN modificacion ON id_nota = id_nota_mod 
GROUP BY id_nota 
ORDER BY COUNT(modificacion.id_mod) DESC LIMIT 1;

