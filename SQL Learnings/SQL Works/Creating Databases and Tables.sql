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