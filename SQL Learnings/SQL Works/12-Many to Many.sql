CREATE DATABASE tv_db;

USE tv_db;

CREATE TABLE reviewers(
id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL);

CREATE TABLE series(
id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(100),
released_yeat YEAR ,
genre VARCHAR(100));

ALTER TABLE series
RENAME COLUMN released_yeat TO  released_year;

CREATE TABLE reviews(
id INT PRIMARY KEY AUTO_INCREMENT,
rating DECIMAL(2,1),
series_id INT,
reviewer_id INT,
FOREIGN KEY(series_id) REFERENCES series(id)  ON DELETE CASCADE,
FOREIGN KEY(reviewer_id) REFERENCES reviewers(id)  ON DELETE CASCADE);

SHOW tables;
----- VALUES INSERTED SUCCESFULLY -----
SELECT * FROM reviewers;
SELECT * FROM series;
SELECT * FROM reviews;

----- TV series challenge #1 -----
SELECT title, rating FROM series
INNER JOIN reviews ON series.id = reviews.series_id
WHERE title IN (SELECT DISTINCT title FROM series ) LIMIT 15;

----- TV series challenge #2 -----
SELECT title, ROUND(AVG(rating)) AS avg_rating FROM series
INNER JOIN reviews ON series.id = reviews.series_id GROUP BY title ORDER BY avg_rating;

----- TV series challenge #3 -----
SELECT first_name, last_name , rating FROM reviewers
JOIN reviews ON reviewers.id = reviews.reviewer_id;

----- TV series challenge #4 -----
SELECT title AS unreviwed_series FROM series
RIGHT JOIN reviews ON series.id = reviews.series_id
WHERE rating IS NULL;

----- TV series challenge #5 -----
SELECT genre, ROUND(AVG(rating),2) AS avg_rating FROM series
JOIN reviews ON reviews.series_id = series.id
GROUP BY genre;

----- TV series challenge #6 -----
SELECT 
    first_name,
    last_name,
    COUNT(rating) AS COUNT,
    IFNULL(MIN(rating), 0) AS MIN,
    IFNULL(MAX(rating), 0) AS MAX,
    IFNULL(AVG(rating), 0) AS AVG,
    CASE
        WHEN COUNT(rating) > 0 THEN 'ACTIVE'
        ELSE 'INACTICE'
    END AS STATUS
FROM
    reviewers
        LEFT JOIN
    reviews ON reviews.reviewer_id = reviewers.id
GROUP BY first_name , last_name;

SELECT 
    first_name,
    last_name,
    COUNT(rating) AS COUNT,
    IFNULL(MIN(rating), 0) AS MIN,
    IFNULL(MAX(rating), 0) AS MAX,
    IFNULL(AVG(rating), 0) AS AVG,
    IF(COUNT(rating) > 0, 'ACTIVE', 'INACTIVE') AS STATUS
FROM
    reviewers
        LEFT JOIN
    reviews ON reviews.reviewer_id = reviewers.id
GROUP BY first_name , last_name;

----- TV series challenge #7 -----
SELECT 
    title,
    rating,
    CONCAT(first_name, ' ', last_name) AS reviewer
FROM
    series
        INNER JOIN
    reviews ON reviews.series_id = series.id
        INNER JOIN
    reviewers ON reviewers.id = reviews.reviewer_id;
    
    SELECT 
    title,
    rating,
        CONCAT(first_name, ' ', last_name) AS reviewer
FROM
    series
        INNER JOIN
    reviews ON reviews.series_id = series.id
		INNER JOIN 
	reviewers ON reviewers.id = reviews.reviewer_id;