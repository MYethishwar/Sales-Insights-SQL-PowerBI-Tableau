CREATE TABLE duplicate(price DECIMAL(5,3));

DESC duplicate;

INSERT INTO duplicate(price) VALUES(23.3);
INSERT INTO duplicate(price) VALUES(23.32332323);
INSERT INTO duplicate(price) VALUES(22.232);

use duplicate;
USE books;
SELECT * FROM duplicate;

DROP TABLE duplicate;

----- DATE TIME DATE-TIME -----
CREATE TABLE people(
	name VARCHAR(100),
	birthdate DATE,
    birthtime TIME,
    birthdatetime DATETIME
    );
    
DESC people;

INSERT INTO people(name, birthdate, birthtime, birthdatetime)
VALUES('Kiran', '1989-05-22', '01:00:12', '1989-05-22 1:00:12'),
	('Chintu', '1998-05-22', '09:10:02', '1998-05-22 19:10:02'),
		('Sai', '2017-11-22', '11:10:12', '2017-11-22 11:10:12'),
			('Siddhu', '1810-05-02', '01:10:12', '1810-05-22 01:10:12');

SELECT * FROM people;


----- CURDATE(), CURTIME(), NOW() -----
SELECT CURDATE(), CURTIME(), NOW();
SELECT CURRENT_DATE(), CURRENT_TIME(), CURRENT_TIMESTAMP();

INSERT INTO people(name, birthdate, birthtime, birthdatetime)
VALUES('Yethishwar Rao', CURDATE(), CURTIME(), NOW());

DROP TABLE people;

SELECT SYSDATE(), NOW();
SELECT DATE_ADD(CURDATE(), INTERVAL 10 DAY);
SELECT ADDDATE('2025-03-08', 4);

SELECT DATE_SUB('2025-03-08', INTERVAL 7 YEAR);
SELECT SUBDATE('2025-03-08',  1);

SELECT TIMESTAMPADD(YEAR, 5, '2025-03-08 10:30:00');
SELECT TIMESTAMPADD(MONTH, 5, '2025-03-08 10:30:00');
SELECT TIMESTAMPADD(DAY, 5, '2025-03-08 10:30:00');

SELECT TIMESTAMPADD(HOUR, 5, '2025-03-08 10:30:00');
SELECT TIMESTAMPADD(MINUTE, 5, '2025-03-08 10:30:00');
SELECT TIMESTAMPADD(SECOND, 5, '2025-03-08 10:30:00');


SELECT EXTRACT(YEAR FROM '2025-03-08');
SELECT EXTRACT(DAY FROM '2025-03-08');

SELECT DAYOFMONTH('2025-03-08');
SELECT DAYOFWEEK('2025-03-08');
SELECT DAYOFYEAR('2025-12-08');
SELECT MONTH('2025-03-08');
SELECT MONTHNAME('2025-03-08');
SELECT YEAR('2025-03-08');
SELECT HOUR('12:30:45');
SELECT MINUTE('12:30:45');
SELECT SECOND('12:30:45');

SELECT TIME_TO_SEC('01:30:00'); -- Output: 5400 seconds
SELECT SEC_TO_TIME(5400); -- Output: 01:30:00

SELECT TIMEDIFF('12:30:00', '10:00:00'); -- Output: 02:30:00
SELECT DATEDIFF('2025-03-08', '2025-03-01');
SELECT TIMESTAMPDIFF(DAY, '2029-11-01', '2025-03-08');

SELECT DATE_FORMAT('2004-05-22', '%W, %M %D, %Y');


SELECT 
    birthdatetime,
    MONTH(birthdatetime),
    DAY(birthdatetime),
    HOUR(birthdatetime),
    MINUTE(birthdatetime),
    YEAR(birthdatetime),
    SECOND(birthdatetime)
FROM people;

SELECT 
    birthtime,
    HOUR(birthtime),
    MINUTE(birthtime)
FROM people;

SELECT birthdate, DATE_FORMAT(birthdate, '%a %b %D') FROM people;
 
SELECT birthdatetime, DATE_FORMAT(birthdatetime, '%H:%i') FROM people;
 
SELECT birthdatetime, DATE_FORMAT(birthdatetime, 'BORN ON: %r') FROM people;


CREATE TABLE captions(
text  VARCHAR(100),
created_at TIMESTAMP default CURRENT_TIMESTAMP
);

DESC captions;

INSERT INTO captions(text)
VALUES( 'yETHISHWATR'),
('Madavaram Chintu');

SELECT * FROM captions;

CREATE TABLE captions2(
text  VARCHAR(100),
created_at TIMESTAMP default CURRENT_TIMESTAMP,
updated_on TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO captions2(text)
VALUES( 'hI THERE I AM CHINTU'),
('cHINRU CHINRU  Chintu');

SELECT * FROM captions2;

UPDATE captions2 SET text='I love you';


----- EXERSICE ------
----- What's a good use case for CHAR? -----
	CREATE TABLE country(
    state VARCHAR(100),
    state_code CHAR(6),
    state_abBR CHAR(2)
    );
    
    INSERT INTO country(state, state_code, state_abbr)
    VALUES('Telangana', '11212', 'TG'),
		('Andhra Pradesh', '602909', 'AP');
        
SELECT * FROM country;

----- FILL IN THE BLANKS -----
----- VARCHAR(100), DECIMAL(8,2) , INT ---
-- They both store datetime information, but there's a difference in the range, 
-- TIMESTAMP has a smaller range. TIMESTAMP also takes up less space. 
-- TIMESTAMP is used for things like meta-data about when something is created
-- or updated.--
SELECT CURTIME();
SELECT CURDATE();
SELECT DAYOFWEEK(NOW());
SELECT DATE_FORMAT(NOW(), '%w') + 1;
SELECT DAYNAME(CURDATE());
SELECT DATE_FORMAT(birthdate, '%m/%d/%Y') FROM people;
SELECT DATE_FORMAT(current_date(), '%M %dnd at %l:%i');

CREATE TABLE tweets_table(
content VARCHAR(100),
username VARCHAR(100),
created_on DATETIME DEFAULT CURRENT_TIMESTAMP);

INSERT INTO tweets_table(content, username)
VALUES('This is reality show', 'MYethishear');

SELECT * FROM tweets_table;