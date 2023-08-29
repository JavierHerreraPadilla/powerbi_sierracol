
/* Mostrar bases de datos*/
SHOW DATABASES;

CREATE DATABASE IF NOT EXISTS pet_shop;

SHOW DATABASES;

CREATE DATABASE IF NOT EXISTS TiendaJabon;

/* Eliminar una base de datos - tener cuidado - esto no deberiamoos hacerlo muy segudi*/
DROP database tiendajabon;


/*USAR Una base de datos, entrar a la base de datos para trabajar en ella*/
USE pet_shop;
/* para saber en qué base de datos estoy trabajando actualmente */
SELECT database();

/* ejemplo: */
CREATE DATABASE cafe;
SELECT database();
USE cafe; /**/
SELECT database();

/* 
Tablas, ya creamos una base datos, ya nos vimos entres bases de datos.
Ahora debemos crear tablas. Una sola base de datos puede tener multiples tablas.

Definir tabla:
*/

/* Tarea: modelar tweeter */
/*
nombre de ususario: max 15 caracteres
contenido: max 140 caracteres
numero de likes
*/

/*crear una nueva tabla*/
CREATE DATABASE IF NOT EXISTS tienda_mascotas; 
USE tienda_mascotas;
CREATE TABLE gatos 
(
	cat_name VARCHAR(50),
    age INT
);
/* ver las tablas que existen en la base de datos*/
CREATE TABLE perros (
dog_name VARCHAR(50),
raza VARCHAR(50),
edad INT
);

-- utilidades para inspeccionar nuestras tablas 
show tables; -- comentario 
show columns from perros;
show columns from gatos;
DESC gatos;

-- eliminar tablas
show tables;
DROP TABLE gatos;

-- breve tarea crar una tabla que se llame pasteleria
-- va a tener 2 columnas nombre y cantidad. nombre tiene maximo 50 caracteres
-- inspeccionar la tabla, que exista y que muestre las columnas
-- luego eliminar la tabla y mostrar que no existe en la db
create table pasteleria (nombre VARCHAR(50), cantidad INT);
show tables;
desc pasteleria;
drop table pasteleria;
show tables;

-- INSERTAR DATA
DESC perros;
INSERT INTO perros (dog_name, raza, edad) VALUES ("Jetson", "lab", 9);

-- COMO SABEMOS QUE INSERTAMOS LOS DATOS EN LAS TABLAS: SELECT
select * from perros;

INSERT INTO perros (dog_name, raza, edad) VALUES ("Coco", "mixto", 2), ("Pan", "mixto", "6"); -- sí acepta el "6" como int
INSERT INTO perros (dog_name, raza, edad) VALUES ("Coco", "mixto", "Linux"); -- no acepta el texto como INT

-- EJERCICIO
-- crear una tabla llamada personas
-- columnas: nombre, apellido, edad
-- insertar una persona en una solo comando.
-- insertar 3 personas en una sola entrada.
-- mostrar toda la tabla personas

-- TaRABAJADO CON NOT NULL
DESC perros; -- mirar la coluumna NULL y DEFAULT: INFORMACIÓ VACÍA

INSERT INTO PERROS (dog_name) VALUES ("Piña"), ("dorito");
select * from perros;

-- RESTRICCIÓN: NOT NULL
-- crear una nueva tabla llamada perros2
create table perros2 (name varchar(50) NOT NULL, edad int NOT NULL);
DESC PERROS2;
INSERT INTO perros2() VALUES();

-- DEFAULT
create table perros3 (name varchar(50) NOT NULL DEFAULT "NN", edad int NOT NULL DEFAULT 0);
DROP TABLE perros3;
DESC PERROS3;
INSERT INTO PERROS3() VALUES();
SELECT * FROM PERROS3;

-- PRIMARY KEYS - llaves primarias
-- Mostrar la columna key en desc
-- identificadores unicos
desc perros;
create table id_perros (id INT NOT NULL primary key, nombre varchar(55), edad INT);
DESC ID_PERROS;
INSERT INTO ID_PERROS (id, nombre, edad) VALUES (1, "Ringo", 11);
select * from id_perros;
INSERT INTO ID_PERROS (id, nombre, edad) VALUES (1, "Rosa", 8); -- error
INSERT INTO ID_PERROS (id, nombre, edad) VALUES (13, "Rosa", 8); -- no error

-- AUTO_INCREMENT
create table id_perros2 (id INT NOT NULL primary key auto_increment, nombre varchar(55), edad INT);
DESC ID_PERROS2;
INSERT INTO ID_PERROS2 (nombre, edad) VALUES ("Ringo", 11);
select * from id_perros2;
INSERT INTO ID_PERROS2 (nombre, edad) VALUES ("Rosa", 8); 
INSERT INTO ID_PERROS2 (nombre, edad) VALUES ("Rosa", 8); 
-- delete from id_perros2 where id=3;

--  EJERCICIO : está en las diapositivas

