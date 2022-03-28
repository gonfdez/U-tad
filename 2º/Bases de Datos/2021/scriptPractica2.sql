use artbase;

create table artista ( nombre char(30) not null, lugar_nac char(50), ano_nac int, estilo_arte char(30), primary key(nombre));

create table obras_arte ( nombre_artista char(30) not null, ano_fab int, titulo char(30) not null, tipo_arte char(30), index(titulo , nombre_artista) ,precio double, primary key(nombre_artista, titulo), foreign key (nombre_artista) references artista(nombre));

create table grupos (nombre_grupo char(30) not null, primary key(nombre_grupo));

create table grupos_relacion ( nombre_grupo char(30) not null, titulo_obra char(30), nombre_artista char(30), primary key(nombre_grupo, titulo_obra, nombre_artista));

alter table grupos_relacion add foreign key (nombre_grupo) references grupos(nombre_grupo);
alter table grupos_relacion add foreign key (titulo_obra) references obras_arte(titulo);
alter table grupos_relacion add foreign key (nombre_artista) references obras_arte(nombre_artista);

create table clientes ( nombre char(30) not null, direccion char(50), dinero_gastado double, artistas_gustados char(30), grupos_gustados char(30) , primary key(nombre), index(artistas_gustados,grupos_gustados), foreign key (artistas_gustados) references artista(nombre), foreign key (grupos_gustados) references grupos(nombre_grupo));


insert into artista values ('gonzalo fernandez', 'madrid', 1999, 'abstracto intenso'), ('pepe lopez','santander',1997,'estilo colorido'), ('leonardo dicaprio','new york',1971,'paradojico'),('manuel','logroño',1983,'casero'), ('bartolomeo','ibiza',2000,'moderno') , ('ana montaña','buenos aires', 1999, 'vintage alternativo'), ('maria palomo','sevilla' , 1990, 'arte floral'), ('moises','ceuta', 1993 , 'arte callejero' ), ('teresa sanchez' , 'toledo' , 1965 , 'escultura en metal'), ('emilio' , 'las palmas' , 1999, 'arte urbano');

insert into obras_arte values ('gonzalo fernandez', 2010 , 'chill in the sky', 'pintura', 5000), ('teresa sanchez', 2010 , ' en su puerta', 'escultura', 33000), ('leonardo dicaprio', 2011 , 'cigarrillo de shutter island', 'objeto', 10000), ('ana montaña', 2015 , 'viaje al pasado', 'pintura', 499), ('maria palomo', 2017 , 'paraiso', 'escultura floral', 1000),('bartolomeo', 2013 , 'whats up', 'pintura restaurada', 2000), ('moises', 2000 , 'el gran viaje', 'pintura', 11000), ('pepe lopez', 2019 , 'el nuevo ahora', 'fotografia', 4000), ('manuel', 2020 , 'entra un tipo en un bar', 'corto cinematografico', 18000), ('emilio', 2008 , 'oceano', 'fotografia', 900);

insert into grupos values ('esculturas'), ('fotografias') , ('pintura'), ('metalico'), ('cotidiano'), ('colorido'), ('oscuro'), ('entretenimiento') , ('moderno'), ('abstracto');

 insert into grupos_relacion values ('abstracto', 'el gran viaje', 'moises'), ('colorido', 'oceano', 'emilio'), ('cotidiano', 'cigarrillo de shutter island', 'leonardo dicaprio'), ('entretenimiento', 'entra un tipo en un bar', 'manuel'), ('esculturas', ' en su puerta', 'teresa sanchez'), ('esculturas', 'paraiso', 'maria palomo'), ('colorido', 'paraiso', 'maria palomo'), ('fotografias', 'oceano', 'emilio'), ('fotografias', 'el nuevo ahora', 'pepe lopez'), ('pintura', 'viaje al pasado', 'ana montaña'), ('pintura', 'whats up', 'bartolomeo');
 
 insert into clientes values ('diego', 'calle ola 3', 29876, 'ana montaña', 'abstracto'), ('carlos', 'calle amapola 22', 5347, 'bartolomeo', 'colorido'), ('ramon', 'calle quejigo 10', 6, 'emilio', 'cotidiano'), ('Natalia', 'paseo de la castella 176', 20010, 'gonzalo fernandez', 'entretenimiento'), ('rodrigo', 'calle sol 1 BIzda', 1236, 'leonardo dicaprio', 'esculturas'), ('roberto', 'calle muerte 66', 2387, 'manuel', 'fotografias'), ('Ana', 'calle Bola 38', 29876, 'maria palomo', 'metalico'), ('juan', 'avenida cachopo 8', 2126, 'moises', 'moderno'), ('miguel', 'calle soja 7', 30000, 'pepe lopez', 'oscuro'), ('Amparo', 'calle caracola 22', 28, 'teresa sanchez', 'pintura');



