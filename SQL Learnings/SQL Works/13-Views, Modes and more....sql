CREATE VIEW full_reviews AS 
SELECT first_name, last_name, title, genre,  released_year, rating FROM series
JOIN reviews ON reviews.series_id = series.id 
JOIN reviewers ON reviewers.id = reviews.reviewer_id;

SELECT * FROM full_reviews;

DROP VIEW full_reviews;

SELECT genre, ROUND(AVG(rating), 2) AS Avg_rating FROM full_reviews
GROUP BY genre;

CREATE OR REPLACE VIEW full_reviews AS
SELECT * FROM series ORDER BY released_year DESC;

SELECT * FROM full_reviews;

ALTER VIEW full_reviews AS
SELECT * FROM series ORDER BY released_year; 

----- HAVING -----
SELECT first_name, last_name, COUNT(rating)  FROM full_reviews GROUP BY first_name, last_name ;

SELECT first_name, last_name, COUNT(rating) AS count  FROM full_reviews GROUP BY first_name, last_name HAVING  count > 5;

----- ROLL UP -----
SELECT title, MIN(rating)  FROM full_reviews GROUP BY  ROLLUP (title); 

SELECT title, COUNT(rating)  FROM full_reviews GROUP BY title WITH ROLLUP; 

SELECT title, MAX(rating)  FROM full_reviews GROUP BY title WITH ROLLUP; 

SELECT title, SUM(rating)  FROM full_reviews GROUP BY title WITH ROLLUP; 

----- SQL modes -----
SELECT @@global.sql_mode;
SELECT @@session.sql_mode;

SET SESSION sql_mode = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
SET SESSION sql_mode = @@SESSION.sql_mode;

SELECT 1/0;

CREATE TABLE sqlmodes(
name VARCHAR(100),
age INT,
date_of_born DATE);

INSERT INTO sqlmodes(name, age, date_of_born)
VALUES('Yethishewar', 'Yethish', '2004-05-22');

SELECT * FROM	sqlmodes;

SELECT first_name,last_name, ROUND(AVG(rating), 2) AS Avg_rating FROM full_reviews
GROUP BY first_name;