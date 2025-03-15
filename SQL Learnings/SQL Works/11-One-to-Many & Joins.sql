
CREATE DATABASE shop;
USE shop;

CREATE TABLE customers(
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(150)
    );
    
CREATE TABLE orders(
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customerS(id) ON DELETE CASCADE)
    ;
use shop;

ALTER TABLE orders
ADD CONSTRAINT FOREIGN KEY(customer_id) REFERENCES customers(id);
    
INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);
       
select * from orders;
desc orders;

INSERT INTO orders(order_date, amount, customer_id)
VALUES('2025-12-22', 143.23, 221);

USE shop;

SELECT * FROM customers CROSS JOIN orders;

----- INNER JOIN  -----
SELECT * FROM customers
JOIN orders
 ON customers.id = orders.customer_id;
 
SELECT first_name, last_name, SUM(amount) FROM customers
JOIN orders 
 ON customers.id = orders.customer_id GROUP BY  first_name, last_name;
 
 SELECT first_name, last_name, amount, order_date FROM customers
 LEFT OUTER JOIN orders
	ON customers.id = orders.customer_id;
    
SELECT first_name, last_name, IFNULL(SUM(amount), 0) FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id
GROUP BY first_name, last_name;

select * from orders;

SELECT * FROM customers
RIGHT OUTER JOIN orders
	ON customers.id = orders.customer_id;
    
INSERT INTO orders(id, order_date, amount)
VALUES(10, CURRENT_DATE(), 1000.0);
use shop;

DELETE FROM customers WHERE last_name = 'George';

select * from orders;

----- EXERSISE -----
CREATE DATABASE university;

CREATE TABLE students(
id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(100) NOT NULL);

CREATE TABLE papers(
title VARCHAR(100) NOT NULL,
grade SMALLINT NOT NULL,
student_id INT,
FOREIGN KEY(student_id) REFERENCES students(id) ON DELETE CASCADE);

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');
 
INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

SELECT * FROM students;
use shop;

SELECT * FROM students
JOIN papers ON students.id = papers.student_id ORDER BY grade DESC;

SELECT * FROM papers
JOIN students ON students.id = papers.student_id ORDER BY grade DESC;

SELECT first_name, title, grade FROM students
LEFT JOIN papers ON students.id = papers.student_id ;

SELECT first_name, IFNULL(title, 'MISSING'), IFNULL(grade, 0) FROM students
LEFT JOIN papers ON students.id = papers.student_id ;

SELECT first_name, IFNULL(AVG(grade), '0') AS average FROM students
LEFT JOIN papers ON students.id = papers.student_id 
GROUP BY first_name ORDER BY average DESC;

SELECT first_name, IFNULL(AVG(grade), '0') AS average,
CASE 
	WHEN IFNULL(AVG(grade), '0')	 > 75 THEN 'PASSING'
    ELSE 'FAILING'
    END AS passing_status
FROM students
LEFT JOIN papers ON students.id = papers.student_id 
GROUP BY first_name ORDER BY average DESC; 