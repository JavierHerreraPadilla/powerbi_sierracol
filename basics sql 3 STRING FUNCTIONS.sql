-- STRING FUNCTIONS
-- BOOKS
-- MUCHO DEL MUNDO DE SQL ES SELECCIONAR DATA EN LA DB. SÍ, SE HACENN INSERTS, DELETES Y UPDATES PERO ES LA MENOR PARTE DEL TRABAJO

-- VAMOS A TRABAJAR CON DATOS DE LIBROS

CREATE DATABASE book_shop;
USE book_shop;
-- usar el script en el workbench o desde el cmd con: source c:path/to/scrit.sql

show tables;

-- CONCAT - CONCATENAR O COMBINAR CADENAS DE TEXTO
select CONCAT("MY", "SQL"); -- CONCAT TOMA CUALQUIER NUMERO DE STRINGS
-- concatenar el primer nombre y el segundo nombre de la tabla books
SELECT CONCAT(author_fname, "!!!") FROM BOOKS;
SELECT CONCAT(author_fname, author_lname) FROM BOOKS;
SELECT CONCAT(author_fname, " ", author_lname) AS full_name FROM BOOKS;
-- concat_ws
SELECT concat_ws(" ", author_fname, author_lname) AS full_name FROM books;
SELECT concat_ws("-", author_fname, author_lname) AS full_name FROM books;

-- SUBSTRING : sub-strings de una string
-- substring(texto, inicio, num caracteres
SELECT substring("Hola, mundo", 1, 5); 
SELECT substring("Hola, mundo", 3); -- hasta el fin 
SELECT substring("Hola, mundo", -3); -- hasta el fin con indices negativos
SELECT substring(title, 1, 15) FROM books;

-- COMBINANDO CONCAT Y SUBSTRING
SELECT CONCAT
	(
		SUBSTR(TITLE, 1, 10), "..."
	) as short_title 
    FROM books;

select SUBSTR(author_fname,1,1), substr(author_lname,1,1) from books;
select concat_ws(".", 
	SUBSTR(author_fname,1,1), substr(author_lname,1,1) 
    )
    from books;
              
-- REPLACE REEMPLAZA PARTES DE UN STRING. TENER EN CUENTA QUE NO ESTAMOS CAMBIANDO NUESTRA TABLA
SELECT replace("HOLA, MUNDO", "HOLA", "@");
SELECT replace(title, " ", "@") from books;

-- REVERSE
SELECT REVERSE(title) from books;
SELECT REVERSE("hOLA");

-- CHAR_LENGTH

SELECT char_length("HOLA");
SELECT TITLE FROM BOOKS WHERE char_length(TITLE) = 10;
SELECT TITLE FROM BOOKS WHERE char_length(TITLE) < 10;

-- UPPER Y LOWER (LCASE)
SELECT UPPER(TITLE), TITLE FROM BOOKS;
SELECT LCASE(TITLE), TITLE FROM BOOKS;

-- OTROS METODOS
-- INSEERT
select insert("hola, mundo", 6, 0, "@@@@");
select insert("hola, mundo", 6, 4, "@@@@");
-- LEFT AND RIGHT: LOS CARACTERES MAS A LA IZQUEIRDA O MAS A LA DERECHA
SELECT LEFT("HOLAMUNDO", 3);
SELECT right("HOLAMUNDO", 3);

-- TRIM: remover espacios en blanco al inicio y final del string. no remueve los internos
select trim("    hola   "), "    hola   ";


-- ejercicios en las diapositiva