-- To see list of databases present in our system
SHOW DATABASES;

-- To create a database
CREATE DATABASE collage;

-- To delete database permanantly
DROP DATABASE collage;

-- To initialize i am going to work on this database
USE collage;

-- To see currenlty in which database we are working on 
SELECT DATABASE();

-- To create a table
CREATE TABLE collages_in_hyderabad (
collage_name VARCHAR(100),
collage_id bigint(20),
collage_lolcation varchar(100)
)

#To see the structure of the table
DESCRIBE collages_in_hyderabad;
-- OR --
SHOW COLUMNS FROM gurunanak;
-- OR --
SHOW TABLES;

-- To delete a table permanamtly
DROP TABLE gurunanak;
 
-- Insert values into the Table
INSERT INTO malla_reddy(students, roll_no, grade)
VALUES('Siddhartha_rao', 90, 'S++');

INSERT INTO malla_reddy(students, roll_no, grade)
VALUES('Sai Kiran Rao',89,'S++')


-- Insert multiple rows at a time with single insert command
INSERT INTO malla_reddy(students,roll_no)
				VALUES('Kiara',33),
						('preethi',24),
						('Sushil',12),
						('Rushi',22)
						;

-- To see the values in a table
SELECT * FROM malla_reddy;

-- By specifying NOT NULL while creating a table... The table dooesn't support any null values 
CREATE TABLE population(
state VARCHAR(20) NOT NULL,
population 	INT NOT NULL); 

-- We can specify Default value which is suitable for the column data type then instead of null values default value gets printed
-- Unless you mention  NOT NULL while creating a table. 
CREATE TABLE people2(
name VARCHAR(20) DEFAULT 'No value here',
age INT DEFAULT 0);

-- IF you specify NOT NULL before DEFAULT it is not going to take NULL values explicitly also.
CREATE TABLE people4(
name VARCHAR(20) NOT NULL DEFAULT 'No value here',
age INT NOT NULL DEFAULT 0);

INSERT INTO people4(name) values('Yethishwar');

INSERT INTO people4(name) values(NULL);
-- EROR 1048 (23000): Column 'name' cannot be null

-- If we want double codes in the middle of the name just mention back slash like this.
INSERT INTO people2(name)
VALUES('Yethishwar\'s Family');

