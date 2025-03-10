USE books;

SHOW TABLES;

SELECT * FROM books;

----- NOT EQUAL -----
SELECT title FROM books WHERE released_year != 2017;
SELECT * FROM books WHERE author_lname  != 'Gaiman' AND 'Eggers'AND 'Harries';

----- NOT LIKE -----
SELECT * FROM books WHERE released_year NOT LIKE '2%';
SELECT author_lname, author_fname FROM books WHERE author_fname  LIKE 'D__';
SELECT title  FROM books WHERE title NOT LIKE '% %';

----- GREATER THAN(>) -----
SELECT author_fname, author_lname, released_year FROM books WHERE released_year > 2015;

----- LESS THAN (<) -----
SELECT author_fname, released_year FROM books WHERE released_year < 2000 ORDER BY released_year;
SELECT author_fname, released_year FROM books WHERE released_year <= 1989;

----- LOGICAL AND -----
SELECT * FROM books WHERE CONCAT(author_fname,' ',author_lname) = 'Dave Eggers' && released_year  > 2010;

SELECT * FROM BOOKS;

----- The book must not be written by "Neil Gaiman", "Dave Eggers", or "Dan Harris" ---
SELECT * FROM books WHERE author_lname NOT IN ('Gaiman', 'Eggers','Harris');

----- The number of copies sold must be greater than 50 but less than 500.
SELECT COUNT(*) FROM books WHERE stock_quantity > 50 AND stock_quantity < 500;
SELECT 1 > -4 AND 1 = 1;

SELECT title FROM books WHERE CHAR_LENGTH(title) > 20 AND pages > 300;

----- LOGICAL OR -----
SELECT title, released_year FROM books
WHERE released_year > 2010 OR char_length(title) > 20;

SELECT 2 > 10 OR 1 < 0;

----- BETWEEN -----
SELECT title FROM books WHERE released_year BETWEEN 2004 AND 2015;
SELECT title FROM books WHERE released_year NOT BETWEEN 2004 AND 2015;


----- COMPARING DATES -----
SELECT birthdate FROM people WHERE birthdate < '1990-11-01';
------------ OR ---------------
SELECT birthdate FROM people WHERE YEAR(birthdate) < '2004';

SELECT birthtime FROM people WHERE birthtime < '1:12:12';

SELECT birthtime FROM people WHERE HOUR(birthtime) > '5';

SELECT birthtime FROM people WHERE CAST(birthtime AS TIME) > '-1:00:00';


----- -IN -----
SELECT author_lname FROM books WHERE author_lname IN ('Gaiman', 'Harris', 'Eggers');
SELECT author_lname FROM books WHERE author_lname NOT IN ('Gaiman', 'Harris', 'Eggers');

----- find all books not published in even released_years -----
SELECT * FROM books WHERE released_year NOT IN ('2000', '2002', '2004', '2006','2008', '2010', '2012');
SELECT * FROM books WHERE released_year % 2 != 0;


----- CASE ----
SELECT released_year,
	CASE  
    WHEN released_year >= 2000 THEN 'It\'s 21st century'
    WHEN released_year <= 2000 THEN '1900\'s Stuff'
    ELSE 'NO STUFF HERE!!!'
    END AS  'CATEGORIZATION'
    FROM books;
    
SELECT stock_quantity, 
CASE 
WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
WHEN stock_quantity BETWEEN 50 AND 100 THEN '**'
ELSE '***'
END AS 'STOCK'
FROM books;

SELECT stock_quantity, 
CASE 
WHEN stock_quantity <= 50 THEN '*'
WHEN stock_quantity <=100 THEN '**'
ELSE '***'
END AS 'STOCK'
FROM books;


----- NULL -----
SELECT * FROM books WHERE released_year IS NULL;

SELECT * FROM books;

DELETE FROM books WHERE author_lname IS NULL;

USE BOOKS;
----- EXERSISE -----
----- Select all books before 1980 -----
SELECT * FROM books WHERE released_year < 1980;

----- Select all books written by eggers or chabon -----
SELECT * FROM books WHERE author_lname IN ('Eggers', 'Chabon');

----- SELECT all books written by lahiri publlished after  20000 -----
SELECT * FROM books WHERE author_lname = 'Lahiri' AND released_year > 2000;

----- select all books with page counts between 100 and 200 -----
SELECT * FROM books WHERE pages BETWEEN 100 AND 200;

----- SELECT all books where author_lname starts with a 'C' or an 'S' -----
SELECT * FROM books WHERE author_lname LIKE 'C%' OR author_lname LIKE 'E%';

SELECT title, 
	CASE 
    WHEN  title LIKE '%Stories%' THEN 'Short Stories'
    WHEN title LIKE '%A Heartbreaking Work%' THEN 'Memoir'
    ELSE 'Novel'
    END AS Type
FROM books;

SELECT author_fname, author_lname,
       CASE 
           WHEN COUNT(*) > 1 THEN CONCAT(COUNT(*), ' books') 
           ELSE CONCAT(COUNT(*), ' book') 
       END AS COUNT
FROM books 
GROUP BY author_fname, author_lname;


SELECT author_fname,author_lname, CONCAT(COUNT(pages), ' Books') FROM books GROUP BY author_fname, author_lname ;