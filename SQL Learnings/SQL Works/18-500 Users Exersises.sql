
use join_us;

select COUNT(*) from users;

-- Find earliest data a user joined
SELECT 
    CONCAT(MONTHNAME(created_at),
            ' ',
            DAYOFMONTH(created_at),
            'th ',
            YEAR(created_at)) AS earliest_date
FROM
    users AS earliest_date
ORDER BY created_at DESC
LIMIT 1;

OR 

SELECT 
    DATE_FORMAT(MIN(created_at), "%M %D %Y") as earliest_date 
FROM users;


-- Find the email of the first earliest user
SELECT * FROM users ORDER BY created_at LIMIT 1;

-- user according to the month they joined
SELECT 
    MONTHNAME(created_at) AS month, COUNT(*) count
FROM
    users
GROUP BY MONTHNAME(created_at)
ORDER BY count DESC;


-- Count number of users with yahoo email
SELECT COUNT(email) FROM USERS WHERE email LIKE '%@yahoo.com';


-- Count total number of users for each email host
SELECT 
CASE 
	WHEN email LIKE '%gmail.com' THEN 
	 'Gmail' 
     WHEN email LIKE '%yahoo.com' THEN 
	 'Yahoo' 
     WHEN email LIKE '%hotmail.com' THEN 
	 'hotmail' 
     ELSE 
	 'Others'
     END AS providers,
     COUNT(*) AS total_count
FROM users GROUP BY providers;

INSERT INTO users(email)VALUES('Yethishearan@preethi.com');