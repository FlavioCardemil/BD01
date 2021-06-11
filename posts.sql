\c postgres
DROP DATABASE Posts;

CREATE DATABASE Posts;

\c posts;

CREATE TABLE post(
    id SERIAL,
    nombre_de_usuario VARCHAR(25),
    fecha_de_creacion DATE,
    contenido VARCHAR,
    descripcion VARCHAR(100),
    PRIMARY KEY(id)
);

INSERT INTO post (nombre_de_usuario, fecha_de_creacion, contenido, descripcion) 
VALUES ('Pamela', current_date, 'lorem lorem lorem lorem lorem', 'Primer post de Pamela');

INSERT INTO post (nombre_de_usuario, fecha_de_creacion, contenido, descripcion) 
VALUES ('Pamela', current_date, 'lorem lorem lorem lorem lorem', 'Segundo post de Pamela');

INSERT INTO post (nombre_de_usuario, fecha_de_creacion, contenido, descripcion) 
VALUES ('Carlos', current_date, 'lorem lorem lorem lorem lorem', 'Primer post de Carlos');

ALTER TABLE post 
ADD titulo VARCHAR(25);

UPDATE post SET titulo = 'titulo1' WHERE id = 1;

UPDATE post SET titulo = 'titulo2' WHERE id = 2;

UPDATE post SET titulo = 'titulo3' WHERE id = 3;

INSERT INTO post (nombre_de_usuario, fecha_de_creacion, contenido, descripcion, titulo) 
VALUES ('Pedro', current_date, 'lorem lorem lorem lorem lorem', 'Primer post de Pedro','titulo4');

INSERT INTO post (nombre_de_usuario, fecha_de_creacion, contenido, descripcion, titulo) 
VALUES ('Pedro', current_date, 'lorem lorem lorem lorem lorem', 'Segundo post de Pedro','titulo5');

DELETE FROM post WHERE nombre_de_usuario = 'Carlos';

INSERT INTO post (nombre_de_usuario, fecha_de_creacion, contenido, descripcion, titulo) 
VALUES ('Carlos', current_date, 'lorem lorem lorem lorem lorem', 'Primer post de Carlos','titulo6');

-- punto 2

CREATE TABLE comentarios(
    post_id INT,
    fecha DATE,
    hora TIME,
    contenido VARCHAR,
    FOREIGN KEY(post_id) REFERENCES post(id)
);

INSERT INTO comentarios (post_id, fecha, hora, contenido)
VALUES ('1', current_date, current_time, 'super contenido uno');

INSERT INTO comentarios (post_id, fecha, hora, contenido)
VALUES ('2', current_date, current_time, 'super contenido dos');

INSERT INTO comentarios (post_id, fecha, hora, contenido)
VALUES ('6', current_date, current_time, 'super comentario de Carlos');

INSERT INTO post (nombre_de_usuario, fecha_de_creacion, contenido, descripcion, titulo) 
VALUES ('Margarita', current_date, 'lorem lorem lorem lorem lorem', 'Primer post de Margarita','titulo7');

INSERT INTO comentarios (post_id, fecha, hora, contenido)
VALUES ('7', current_date, current_time, 'Comentario de Margarita');
