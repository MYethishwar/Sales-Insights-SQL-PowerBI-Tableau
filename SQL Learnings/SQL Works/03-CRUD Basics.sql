CREATE TABLE cats(
	cat_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    breed VARCHAR(100),
    age INT,
    PRIMARY KEY(cat_id)
    );
    
    ---------- #READ ------------
SELECT * FROM cats;

SELECT name FROM cats;

SELECT name, breed FROM cats;

SELECT breed, name, age, age FROM cats;


	----------	#WHERE----------
SELECT name FROM cats
WHERE breed = 'Tabby';

SELECT name,age FROM cats
WHERE age <= 10;

SELECT * FROM cats
WHERE breed != 'Tabby';

SELECT * FROM cats
WHERE age BETWEEN 5 and 10;

SELECT name FROM cats
WHERE breed LIKE 'T%';

SELECT * FROM cats
WHERE breed IN ('Tabby','Sphynx');


------------ #ALISES -----------
SELECT cat_id AS id, breed AS b,name AS n FROM cats;


--------- #UPDATE ------------
UPDATE cats
     SET name = 'Preeti'
     WHERE age >= 13;
     
UPDATE cats
	SET name = 'Preethi', breed = 'Human', age = 21
	WHERE age >= 10;

select * from cats;


------- #DELETE ------------
DELETE FROM cats
WHERE age > 10;

DELETE FROM cats;