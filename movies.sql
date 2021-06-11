\c postgres
DROP DATABASE top100;

CREATE DATABASE top100;

\c top100

CREATE TABLE peliculas(
    id SERIAL,
    pelicula VARCHAR(100),
    anio_estreno CHAR(4),
    director VARCHAR(30),
    PRIMARY KEY (id)
);

\copy peliculas FROM 'peliculas.csv' csv header;

CREATE TABLE reparto(
    id INT,
    actor VARCHAR(50),
    FOREIGN KEY (id) REFERENCES peliculas(id)
);

\copy reparto FROM 'reparto.csv' csv;

SELECT id FROM peliculas WHERE pelicula = 'Titanic';

SELECT actor FROM reparto WHERE id = 2;

SELECT COUNT(id) FROM reparto WHERE actor = 'Harrison Ford';

SELECT pelicula FROM peliculas WHERE Anio_estreno BETWEEN '1990' AND '1999' ORDER BY pelicula ASC;

SELECT pelicula, LENGTH(pelicula) as longitud_titulo FROM peliculas;

SELECT MAX(LENGTH(pelicula)) FROM peliculas;

SELECT actor, pelicula FROM reparto
INNER JOIN peliculas
ON reparto.id = peliculas.id
WHERE peliculas.id = 2
LIMIT 1;