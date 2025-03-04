CREATE DATABASE shirts_db;
use shirts_db;
CREATE TABLE shirts (
    shirt_id INT PRIMARY KEY AUTO_INCREMENT,
    article VARCHAR(100),
    color VARCHAR(100),
    shirt_size VARCHAR(100),
    last_worn INT
);

DESC shirts;

INSERT INTO shirts(shirt_id, article, color, shirt_size, last_worn)
values(1, 't_shirt', 'white', 's', 10);

SELECT 
    *
FROM
    shirts;

INSERT INTO shirts(article, color, shirt_size, last_worn)
values('t_shirt', 'green', 'S', 100),
('polo-shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t_shirt', 'pink', 'S', 0),
('polo-shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);


insert into shirts(article, color, shirt_size, last_worn)
values('Polo shirt','Purple', 'M', 50);

