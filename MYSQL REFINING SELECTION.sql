use book_shop;
INSERT INTO books
    (title, author_fname, author_lname, year, stock, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
select * from books where title="10% happier";

-- DISTINCT does not show duplicated
select distinct author_lname from books;           
select distinct concat(author_fname, " ", author_lname) from books; 
select distinct author_fname, author_lname, year from books; -- finds the distict combiations of fname, lname, year

-- ORDER BY
SELECT id, title , author_lname from books ORDER BY author_lname; -- ascending by default
select id, title, author_lname from books order by author_lname desc; -- desc sorted in descending manner
select * from books order by pages;

select title, author_fname, title from books order by 2; -- in this case 2 is the 2nd column in the select - author_fname
-- order by multiple columns
select author_lname, year, author_fname from books order by author_lname, year; -- first orders by lname the by year so it shows them grouped
select author_lname, year, author_fname from books order by author_lname, year desc; 
select concat(author_fname, " ", author_lname) as author from books order by author; -- auhtor is not part of the db

-- LIMIT limits the number of results you get back
select id, title, year from books order by year limit 5; -- 5 oldest books
select id, title, year from books order by year desc limit 5; -- newest books
select id, title, year from books order by year limit 2, 5; -- starts from row 1 and returns 5 results

-- LIKE not exactly
select author_fname, title from books where author_fname="dave"; -- selects the exact dave result
select author_fname, title from books where author_fname like "%da%";
select * from books where title like "%:%";
select * from books where author_fname like "____"; -- underscore mean characters, so this returns fname has 4 chartacters
select * from books where author_fname like "_a_"; 

-- books that contain stories
select * from books where title like "%stories%";

-- find longest book
select title, author_lname, pages from books order by pages desc limit 1; 

-- print summary containing title and year for most recent books
select concat_ws(" - ", title, year) from books order by year desc limit 3;

-- author last name that contains space
select * from books where author_lname like "% %";

-- find the 3 books with lowest stock quantities
select * from books order by stock, title limit 3;

-- print title and author lname sorted first by lname and then by title
select title, author_lname from books order by author_lname, title;

select concat_ws(" ", "my favorite author is", author_fname, author_lname) as yell from books order by author_lname;





