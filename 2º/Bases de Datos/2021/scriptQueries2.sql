SELECT clientes.nombre, dinero_gastado, artista.nombre, artista.estilo_arte FROM clientes INNER JOIN artista WHERE artistas_gustados = artista.nombre;

SELECT artista.nombre, sum(precio) FROM obras_arte INNER JOIN artista WHERE nombre_artista = nombre GROUP BY artista.nombre;
