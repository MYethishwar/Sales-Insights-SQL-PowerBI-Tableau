USE books;
------ CONCAT -----
SELECT CONCAT('Hi', 'Yethishwar') as Lovely;

SELECT 
    CONCAT(author_fname, ' ', author_lname)
FROM
    books;

SELECT 
    CONCAT(author_fname, ' ', author_lname) AS author_fullname
FROM
    books;


------- CONCAT_WS --------
SELECT CONCAT_WS('  ~  ',author_fname, author_lname, pages, released_year) as loverboy FROM books;


------- SUBSTRING ---------
SELECT SUBSTRING(author_fname, 2) FROM books;

SELECT 
    SUBSTRING(author_fname, 1, 3)
FROM
    books;

SELECT 
    SUBSTRING(author_fname, - 1), author_fname
FROM
    books;

SELECT SUBSTRING('Yethishwar', - 4, 2);


----- COMBINING SUBSTRING AND CONCATINATION --------
SELECT 
    CONCAT(SUBSTRING(author_fname, 1, 5),
            ' ',
            SUBSTRING(author_lname, 1, 3),
            ' ',
            '!!!!!', ' ',
            REPLACE(title, ' ', '-')
            ) AS combined_string
FROM
    books;

SELECT 
    SUBSTRING(author_fname, 1, 1), SUBSTRING(author_lname, 1, 1)
FROM
    books;

SELECT 
    CONCAT(SUBSTRING(author_fname, 1, 1),
            ' . ',
            SUBSTRING(author_lname, 1, 1))
FROM
    books;


----- REPLACE ------
SELECT REPLACE('Ye&*th&*is&*hw&*ar', '&*', '');

SELECT 
    REPLACE(title, ' ', '-')
FROM
    books;


----- REVERSE --------
SELECT REVERSE('Yethishwar');

SELECT 
    REVERSE(title)
FROM
    books;


----- CHAR_LENGTH ------
SELECT CHAR_LENGTH('Yethishwar'), title FROM books;

SELECT LENGTH('字字典');

SELECT CHAR_LENGTH(title) FROM books;


----- UPPER() AND LOWER() -------
SELECT UPPER(title) FROM books;

SELECT LOWER(title) FROM books;

SELECT CONCAT('I LOVE ',  UPPER(title), '!!!') FROM books;


---- INSERT() -----
SELECT INSERT('HELLO WORLD',6,5, ' YETHISHWAR ');


----- LEFT & RIGHT --------
SELECT LEFT('Yethishwar',5);

SELECT RIGHT('Yethishwar rao', 3);



------- REPEAT ----------
SELECT REPEAT('Yethishwar Rao ' , 5);

SELECT REPEAT(author_fname, 3) FROM books;


----- TRIM --------
SELECT TRIM('      yETHISHWAR        ');

SELECT TRIM(LEADING '*' FROM '**********yETHISHWAR********');

SELECT TRIM(BOTH '*' FROM '**********yETHISHWAR********');
