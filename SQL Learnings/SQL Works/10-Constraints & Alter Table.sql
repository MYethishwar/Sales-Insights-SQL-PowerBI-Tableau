CREATE TABLE companies(
supplier_id INT AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
phone VARCHAR(100) NOT NULL UNIQUE,
address VARCHAR(100) NOT NULL,
PRIMARY KEY(supplier_id)
);

desc  companies;

INSERT INTO companies(name, phone,  address)
VALUES( 'Yethishwar', '9879798797', 'Miryalaguda');

SELECT * FROM companies;

CREATE TABLE parties(
name VARCHAR(100) NOT NULL,
age INT CHECK (age > 18)
);

INSERT INTO parties(name, age)
VALUES('yethishwar', 20);

SELECT * FROM parties;

INSERT INTO parties(name, age)
VALUES('Chintu', 12);


----- PALINDROME -----
CREATE table palindrome(
palin_check VARCHAR(100) NOT NULL CHECK(REVERSE(palin_check) = palin_check));

INSERT INTO palindrome(palin_check)
VALUES('Yethishwar');


----- NAMED CONSTRAINTS -----
CREATE TABLE constraints(
age INT,
CONSTRAINT age_must_greaterthan_18 CHECK(age > 18));

INSERT INTO constraints(age)
VALUES(12);

SELECT * FROM palindrome;

----- MULTIPLE COLUMN -----
CREATE TABLE multiple(
name VARCHAR(100) NOT NULL,
address VARCHAR(100) NOT NULL,
CONSTRAINT name_address_combo_must_be_unique UNIQUE(name, address));

INSERT INTO multiple(name, address)
VALUES('yethishwar', 'MLG');

INSERT INTO multiple(name, address)
VALUES('yethishwar', 'Karimnagar');

INSERT INTO multiple(name, address)
VALUES('Chintu', 'Karimnagar');

INSERT INTO multiple(name, address)
VALUES('Chintu', 'Karimnagar');

CREATE TABLE sales(
purchase_price INT NOT NULL,
sale_price INT NOT NULL,
CONSTRAINT sellingP_is_greater_purchseP CHECK (sale_price > purchase_price));

INSERT INTO sales(purchase_price, sale_price)
VALUES(100, 200);

INSERT INTO sales(purchase_price, sale_price)
VALUES(300, 200);


----- ALTER TABLE -----
----- add column to a table -----
ALTER TABLE parties
ADD fname VARCHAR(100);

----- Adding multiple columns to a table -----
ALTER TABLE parties
ADD (firstname VARCHAR(100), lastname VARCHAR(100));

----- modify existing column data type -----
ALTER TABLE parties
MODIFY age SMALLINT;

-----  Chainging column size -----
ALTER TABLE parties
MODIFY name VARCHAR(200);

----- renaming column name -----
ALTER TABLE parties
RENAME COLUMN name TO parrty_name;

----- Dropping single column -----
ALTER TABLE parties
DROP COLUMN age;

----- Dropping multiple columns -----
ALTER TABLE parties 
DROP COLUMN age, DROP COLUMN parrty_name;

----- Adding a primary key constraint -----
ALTER TABLE employees
ADD PRIMARY KEY (employee_id);

----- Adding unique constraint -----
ALTER TABLE employees
ADD CONSTRAINT unique_email UNIQUE (email);

----- Dropping a constraint -----
ALTER TABLE employees
DROP CONSTRAINT unique_email;

----- Renaming a table -----
ALTER TABLE employees
RENAME TO staff;

----- Setting a default value for column -----
ALTER TABLE employees
ALTER COLUMN status SET DEFAULT 'Active';

----- Removing a default value -----
ALTER TABLE employees
ALTER COLUMN status DROP DEFAULT;

----- Changing a column to NOT NULL -----
ALTER TABLE employees
MODIFY email VARCHAR(255) NOT NULL;

---- using CHANGE keyword -----
ALTER TABLE employees
CHANGE buisiness biz VARCHAR(100) -- tHIS IS USED TO CHNAGE THE DATATYPE AND RENAME AT A TIME  

