INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
           
use books;

----------- DISTINCT ----------
select * from books;
SELECT DISTINCT
    title
FROM
    books;

SELECT DISTINCT
    author_fname
FROM
    books;

SELECT DISTINCT
    (CONCAT(author_fname, ' ', author_lname))
FROM
    books;

SELECT DISTINCT
    author_fname, author_lname
FROM
    books;


------- ORDER BY ----------
SELECT * FROM books
ORDER BY pages DESC;

SELECT 
    *
FROM
    books
ORDER BY title ASC , pages DESC;

SELECT 
    title, author_fname, author_lname, pages
FROM
    books
ORDER BY 4;

SELECT 
    author_fname, released_year, book_id
FROM
    books
ORDER BY author_fname , released_year , book_id;

SELECT 
    CONCAT(author_fname, author_lname) AS author
FROM
    books
ORDER BY author;


----- LIMIT ---------
SELECT book_id, author_fname, author_lname, released_year FROM books ORDER BY released_year limit 5;

SELECT 
    book_id, author_fname, author_lname, released_year
FROM
    books
ORDER BY released_year
LIMIT 2 , 5;


------ LIKE --------
SELECT book_id, author_fname, author_lname FROM books WHERE author_fname LIKE '%Da%' AND author_lname LIKE 'E%';

SELECT 
    author_fname
FROM
    books
WHERE
    author_fname LIKE '_____';

SELECT 
    author_fname
FROM
    books
WHERE
    author_fname LIKE '_a_';

SELECT 
    title
FROM
    books
WHERE
    title LIKE '%\%%';

SELECT 
    title
FROM
    books
WHERE
    title LIKE '%\_%';