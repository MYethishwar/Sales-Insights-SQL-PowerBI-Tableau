USE books;

--------- COUNT ----------
SELECT COUNT(*) FROM books;

SELECT COUNT(DISTINCT author_fname) FROM books;

SELECT COUNT(DISTINCT released_year) FROM books;

SELECT COUNT(title) FROM books
WHERE title LIKE '%THE%';


------- GROUP BY ------------
SELECT * FROM books;

SELECT author_lname,COUNT(*) AS books_written FROM books
GROUP BY author_lname ORDER BY books_written;

----------- ✅ All non-aggregated columns in SELECT must be in GROUP BY 

SELECT released_year, COUNT(book_id) AS total_books
FROM books	
GROUP BY released_year
ORDER BY total_books;


--- MIN & MAX --------
SELECT MIN(released_year) FROM books;
SELECT MAX(pages) FROM books;

SELECT MAX(author_lname), MIN(author_lname) FROM books;


--------------- SUBQUERY --------------
---- TO find the book which has highest pages ---------
SELECT title FROM books
WHERE pages = 634; 

SELECT title, pages FROM books
WHERE pages = (SELECT MAX(pages) FROM  books);

INSERT INTO books(title, pages)
VALUES('Drag me to the Hell', 634);

SELECT title, released_year FROM books
WHERE released_year = (SELECT MIN(released_year) FROM books);

SELECT title FROM books
ORDER BY pages DESC LIMIT 4;

--------- GROUP BY multiple columns -------
SELECT * FROM books;

SELECT CONCAT(author_fname, ' ', author_lname) AS author_fullname, COUNT(pages)  FROM books GROUP BY author_fullname; 

SELECT author_fname, author_lname, COUNT(pages) FROM books GROUP BY author_lname, author_fname;

-------- GROUP BY WITH MIN/MAX ----------
-------- Find the year each author published their first book --------
SELECT 
    CONCAT(author_fname, ' ', author_lname) AS author,
    MIN(released_year) AS earliest_release,
    MAX(released_year) AS recent_released,
    COUNT(*) AS books_written
FROM
    books
GROUP BY author; 


------- SUM -----------
SELECT 
    released_year, SUM(pages) AS page_count
FROM
    books
GROUP BY released_year
ORDER BY page_count DESC;

SELECT 
    author_lname, SUM(pages) AS page_count
FROM
    books
GROUP BY author_lname
ORDER BY page_count;

SELECT SUM(author_lname) FROM books;


------- AVERAGE --------
SELECT AVG(stock_quantity) AS stock, author_lname FROM books GROUP BY released_year ORDER BY stock;




----- EXERCISE  -----------
-----  Print the number of books in the database  --------
SELECT COUNT(*) FROM books;

-----  Print out how many books were released in each year -------
SELECT released_year, COUNT(*)  FROM books GROUP BY released_year;

----- Print out the total number of books in stock-----
SELECT SUM(stock_quantity) FROM books;

----- FIND THE average released_year for each author ---------
SELECT CONCAT(author_fname, ' ', author_lname) AS author, AVG(released_year) FROM books GROUP BY author;

----- Find the fullname of the author who wrote the longest book -----
SELECT CONCAT(author_fname, ' ', author_lname) AS author_fullname FROM books
WHERE pages = (SELECT MAX(pages) FROM books) LIMIT 1;

----- Print the books written and average pages written in each year -------
SELECT released_year AS year, COUNT(*) AS '# books', AVG(pages) AS 'avg pages' FROM books
GROUP BY year ORDER BY year;