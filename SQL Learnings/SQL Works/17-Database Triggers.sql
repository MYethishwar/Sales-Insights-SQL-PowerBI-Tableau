CREATE DATABASE triggers;
use triggers;
CREATE TABLE users(name VARCHAR(100),
age INT);

INSERT INTO users(name, age)
VALUES('Yethishwar', 21),
	('Chintu', 16);

SELECT * FROM users;


DELIMITER $$
CREATE TRIGGER must_be_adult
	BEFORE INSERT ON users FOR EACH ROW
    BEGIN 
		IF NEW.age < 18
        THEN 
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT  = 'Must be an adult!';
		END IF;
	END;
    
$$ 

INSERT INTO users(name, age)VALUES('Yashwanth', 12);




