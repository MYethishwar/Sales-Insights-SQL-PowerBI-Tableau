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


#PRIMARY KEY
-- This below query ensures that no two rows contains same vallue and it doesn't alloes NULL values
CREATE table unique_people(
	    aadhar BIGINT  PRIMARY KEY,
	    name VARCHAR(100),
	    age INT);

-- If you try to inseert identical values it will throw an error
insert into unique_people(aadhar,name,age)
    values(1,'Yethishwar',21),
    (1,'Yethishwar',21);
    
    
#AUTO_INCREMENT
-- If we you want the primary key values to be auto incremented please specify auto_increment liek this
CREATE TABLE people4(
aadhar BIGINT auto_increment,
name VARCHAR(100),
age INT,
PRIMARY KEY(aadhar)
);

INSERT INTO people4(aadhar,name,age)
VALUES(100,'Yethishwat',22);

select * from people4;

INSERT INTO people4(aadhar,name,age)
VALUES(12, 'Chintu', 22),
(1233,'Chintu', 22),
(323,'Chintu', 22),
(989,'Chintu', 22),
(343,'Chintu', 22),
(43,'Chintu', 22);

INSERT INTO people4(name,age)
	VALUES('Chintu', 22),
	('Chintu', 22),
	('Chintu', 22),
	('Chintu', 22),
	('Chintu', 22),
	('Chintu', 22); 
    
    #ASSIGNMENT WORK
 create table employee(
     id int auto_increment primary key ,
     last_name varchar(100) not null,
     first_name varchar(100) not null,
     middle_name varchar(100),
	age int not null,
    current_status varchar(100) not null default 'Employed');
    
DROP TABLE employee;
DESC TABLE employee;
SHOW COLUMNS FROM employee;
