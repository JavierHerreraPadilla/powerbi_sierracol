-- CRUD: CREATE READ, UPDATE DELETE

SHOW TABLES;

-- CREAR TABLA GATOS

CREATE TABLE cats 
  ( 
     cat_id INT AUTO_INCREMENT, 
     name   VARCHAR(100), 
     breed  VARCHAR(100), 
     age    INT, 
     PRIMARY KEY (cat_id) 
  ); 
  DESC CATS;
  INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);
       

-- READ: leer o recuperar las entradas de una tabla
SELECT * FROM cats; -- select everything (all columns), después del select vas las columnas
SELECT name FROM cats; -- solo muestra la columna names
SELECT name, age FROM cats; -- mostrar múltiples columnas

-- La calusa WHERE: es es una palabara especial en sql.
-- ya seleccionames ciertas columnas pero devolviendo todas las filas. con where se especifican las filas que me interesen.
-- no solo se usa con select sino con delete, update

SELECT * FROM cats WHERE age=4;
SELECT name, breed FROM cats WHERE age=4;
SELECT * FROM cats WHERE name='EGG';

-- rapid fire exercises en las diapositivas

-- ALIAS: renombrar una columna solo en el ouput de un query. Es temporal
select cat_id, name from cats;
select cat_id as ID, name as gatico from cats;

-- U: UPDATE
UPDATE cats SET breed="Shorthir" WHERE breed="Tabby";
-- si no pone el where, se actualizan o cambian todas las entradas de la tabbla.  

UPDATE cats SET age=1 WHERE name="Misty";
-- consejo:  usar select antes de update para tener claro cuál es la data que se va a actualizar 

-- EJERCICIO update en las diapositivas

-- D: DELETE
-- OJO: si no uso el WHERE se borran todas las filas de la tabla: DELETE FROM CATS;
DELETE FROM cats WHERE name="egg";
select * from cats;
-- ejercicio delete en las diaposotivias

-- GRAN TAREA CRUD: DIAPOSITIVAS
-- 1. Crear una nueba base de datos: camisas_db
-- 2. crear una neva tabla llamada camisas: cols: id, articulo, color, talla, veces usadas
-- data: 
-- ('t-shirt', 'white', 'S', 10),
-- ('t-shirt', 'green', 'S', 200),
-- ('polo shirt', 'black', 'M', 10),
-- ('tank top', 'blue', 'S', 50),
-- ('t-shirt', 'pink', 'S', 0),
-- ('polo shirt', 'red', 'M', 5),
-- ('tank top', 'white', 'S', 200),
-- ('tank top', 'blue', 'M', 15)

-- 3. añadir una camisa nueva de color purple, tamaño M. Añadir 5 camisas nuevas. añadir 3 camisas que ya han sido usadas más de 5 veces
-- 4. mostrar todas las camisas pero solo mostrar el articulo y el color
-- 5. mostrar todas las camisas talla M pero no el id.
-- 6 cambiar tolas los "polo shirts" a talla L.
-- 7. actualiazar la camisa que lleva 15 usos, ponerle 21 usos.
-- 8. cambiar las camisas de color blanco a talla xs y color off white

-- 9. borrar las camisas muy usadas usos > 200
-- 10. borrar todas las camisas tank tops
-- 11. Borrar todas las camisas en la tabla.
-- 12. Borrar la tabla.
