-- # Autor: Gonzalo Fernandez Suarez
-- # Creacion, construccion y rellenado de la BBDD

-- DROP DATABASE practica2;
-- CREATE DATABASE practica2;

USE practica2;

CREATE TABLE autores (
    nombre varchar(50) NOT NULL,
    direccion varchar(70),
    nacimiento YEAR,
    PRIMARY KEY(nombre)
);

CREATE TABLE clientes (
    email varchar(50) NOT NULL,
    nombre varchar(50),
    direccion varchar(70),
    telefono int,
    PRIMARY KEY(email)
);

CREATE TABLE editores (
    nombre varchar(50) NOT NULL,
    direccion varchar(70),
    telefono int,
    web varchar(70),
    PRIMARY KEY(nombre)
);

CREATE TABLE libros (
    isbn varchar(30) NOT NULL,
    precio float,
    titulo varchar(30),
    publicacion YEAR,
    editor_nombre varchar(50) NOT NULL,
    PRIMARY KEY(isbn),
    FOREIGN KEY (editor_nombre) REFERENCES editores (nombre)
);

CREATE TABLE almacen (
    nombre varchar(50) NOT NULL,
    PRIMARY KEY(nombre)
);

CREATE TABLE ejemplares (
    id int NOT NULL AUTO_INCREMENT,
    n_edicion int,
    libro_isbn varchar(30) NOT NULL,
    almacen_nombre varchar(50),
    cesta_cliente_mail varchar(50),
    INDEX(id), PRIMARY KEY(id),
    FOREIGN KEY(libro_isbn) REFERENCES libros(isbn),
    FOREIGN KEY(almacen_nombre) REFERENCES almacen(nombre),
    FOREIGN KEY(cesta_cliente_mail) REFERENCES clientes(email)
);

CREATE TABLE escrito (
    libro_isbn varchar(30) NOT NULL,
    autor_nombre varchar(50) NOT NULL,
    FOREIGN KEY(libro_isbn) REFERENCES libros(isbn),
    FOREIGN KEY(autor_nombre) REFERENCES autores(nombre),
    PRIMARY KEY(libro_isbn, autor_nombre)
);

INSERT INTO autores (nombre,direccion,nacimiento) VALUES 
    ("Diana Andreu","Calle Gael, 06, Bajo 4º",1980),
    ("Lic. Raúl Ruiz","Camino Calvillo, 741, Bajos",1984),
    ("Miriam Rael","Paseo Calvo, 87, 8º F",1996),
    ("Marcos Carmona","Travesía Lidia, 10, Bajo 3º",1994),
    ("Saúl Ulibarri Tercero","Ruela Preciado, 3, 6º E",1997),
    ("Iván Cisneros","Avenida Aguirre, 8, Bajo 3º",1990),
    ("Naia Acuña","Passeig Limón, 8, Bajos",1990),
    ("Sra. Alma Pérez Tercero","Avenida Jáquez, 7, 0º F",1999),
    ("Sr. Yeray Velásquez","Travesía Martínez, 617, 1º 8º",1982),
    ("Marina Vanegas","Paseo Álvaro, 4, 3º B",1980),
    ("Saúl Apodaca","Praza Alicia, 057, 3º",1996);

INSERT INTO clientes (email,nombre,direccion,telefono) VALUES
    ("rcastano@escobedo.net","Juan Cortez Hijo","Travessera Cervantes, 12, 8º D",643085452),
    ("teresa.aguilera@terra.com","Adriana Tijerina","Plaça Jorge, 0, 0º D",926834090),
    ("malarcon@macias.org","Óscar Luna","Avinguda Isaac, 7, 46º A",605782894),
    ("aina.luna@hotmail.es","Lidia Carranza","Carrer Aina, 545, 4º E",691209830),
    ("iker52@caldera.es","Ing. Ismael Villar","Rúa Alarcón, 9, 42º 0º",698482358),
    ("joan31@duenas.com.es","Aleix Anaya","Praza Manuel, 4, 5º A",906081669),
    ("biel46@yahoo.com","Srita. Abril Llamas","Calle Alex, 849, 1º B", 960874125),
    ("wsolorio@linares.com","Irene Juan Segundo","Praza Carrión, 10, 5º",900139258),
    ("gutierrez.ian@sepulveda.es","Anaya del Penedès","Travessera Noelia, 5, Bajo 0º",672559206),
    ("puente.carmen@quintana.net","Ing. Rayan Oliver Tercero","Travesía Noa, 413, Ático 2º",665249971),
    ("oscar.fernandez@yahoo.es","Gerard Urías","Carrer Quintana, 768, Bajos",998941498);

INSERT INTO editores (nombre,direccion,telefono,web) VALUES
    ("Srita. Candela Quintanilla","Avinguda Pabón, 157, 3º E",602177454,"enrique41.es"),
    ("Alex Centeno","Camino Enrique, 6, 2º E",695948029,"gilaleixquezada.es"),
    ("Nuria Cuevas","Plaça Martín, 6, 34º B",925294633,"ycasanova.com"),
    ("Lic. Enrique De la Torre","Plaza Peralta, 1, 92º F",633689386,"csuarezvidal.com.es"),
    ("Luis Bernal","Camiño Juan José, 7, 94º E",696256551,"soria-helena-latinmail.com"),
    ("Elena Cedillo","Ronda Serna, 7, 1º A",631040454,"reina.victoria.com"),
    ("Marco Báez","Plaza Escobar, 199, 12º A",637343734,"caro.julia-manzano.com"),
    ("Sr. Martín Arenas Hijo","Plaça Deleón, 9, 5º 3º",964373130,"kmacias.com"),
    ("Patricia Galán","Travessera Expósito, 8, 3º A",644393605,"maria.fonseca.net"),
    ("Alma Dueñas Segundo","Camiño Rey, 9, Entre suelo 4º",683880355,"jaragon.com");

INSERT INTO libros (isbn,precio,titulo,publicacion,editor_nombre) VALUES
    ("897-423432-324-32",15.5,"Preparing For The Leaders",1998,"Alma Dueñas Segundo"),
    ("654-56458768-7870",23,"Raised By The Night",2002,"Patricia Galán"),
    ("64-565-65-4564-56",25.75,"Visiting The Animals",1980,"Sr. Martín Arenas Hijo"),
    ("46564-5-5-454-656",12.89,"Jumping Into Myself",2010,"Marco Báez"),
    ("54-324-324-324348",43.76,"Searching At My Leader",1978,"Elena Cedillo"),
    ("453-43324-54365-6",23.98,"Controlling My Leader",1999,"Luis Bernal"),
    ("45436-56-76-756-7",11.99,"Raised By The Elements",2008,"Lic. Enrique De la Torre"),
    ("543-545-3465-67-7",22.5,"Signs At My Friends",2011,"Nuria Cuevas"),
    ("998786-88797856-5",26.68,"Separated By The Commander",2015,"Alex Centeno"),
    ("566-767-867876-34",31.7,"Force Of The Stars",2020,"Srita. Candela Quintanilla");

INSERT INTO almacen (nombre) VALUES
    ("Pepe Almacenes"),
    ("Hermanos Rioja");

INSERT INTO ejemplares (n_edicion,libro_isbn,almacen_nombre,cesta_cliente_mail) VALUES
    (1,"566-767-867876-34","Pepe Almacenes",NULL),
    (1,"566-767-867876-34","Pepe Almacenes","aina.luna@hotmail.es"),
    (8,"45436-56-76-756-7","Pepe Almacenes","aina.luna@hotmail.es"),
    (8,"45436-56-76-756-7","Pepe Almacenes","aina.luna@hotmail.es"),
    (10,"654-56458768-7870","Hermanos Rioja","aina.luna@hotmail.es"),
    (2,"543-545-3465-67-7","Pepe Almacenes","teresa.aguilera@terra.com"),
    (8,"998786-88797856-5","Pepe Almacenes","teresa.aguilera@terra.com"),
    (3,"64-565-65-4564-56","Hermanos Rioja","oscar.fernandez@yahoo.es"),
    (6,"897-423432-324-32","Pepe Almacenes","joan31@duenas.com.es"),
    (12,"453-43324-54365-6","Pepe Almacenes","joan31@duenas.com.es");

INSERT INTO escrito (libro_isbn, autor_nombre) VALUES
    ("897-423432-324-32","Diana Andreu"),
    ("654-56458768-7870", "Lic. Raúl Ruiz"),
    ("64-565-65-4564-56", "Miriam Rael" ),
    ("46564-5-5-454-656", "Marcos Carmona" ),
    ("54-324-324-324348", "Saúl Ulibarri Tercero" ),
    ("453-43324-54365-6", "Iván Cisneros" ),
    ("45436-56-76-756-7", "Naia Acuña" ),
    ("543-545-3465-67-7", "Sra. Alma Pérez Tercero" ), 
    ("998786-88797856-5", "Sr. Yeray Velásquez" ),
    ("566-767-867876-34",  "Marina Vanegas" ),
    ("566-767-867876-34",  "Saúl Apodaca" );








