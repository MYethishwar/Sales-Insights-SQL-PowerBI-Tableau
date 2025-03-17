CREATE DATABASE insta_db_clone;

USE insta_db_clone;


CREATE TABLE users (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO users(username, created_at)
VALUES('Yethishwar', NOW()),
	('Chintu', NOW()),
    ('Preethi', NOW());
    
SELECT * FROM users;


CREATE TABLE photos (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

INSERT INTO photos(user_id, image_url)
VALUES(1, 'https//uichiwq9weiimage12.com'),
(2, 'https//urkfihwrfikqwfniwimage2.com'),
(2, 'httpsdicvheeriueiimage//2123/249073.com');

SELECT * FROM photos;



CREATE TABLE comments (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    photo_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

INSERT INTO comments(comment_text, user_id, photo_id)
VALUES('Super vundhi ra Pic😘', 1, 2),
('Hero!!!😎😎', 3, 2),
('Nice Editing ra ❤️❤️', 2, 1);

SELECT * FROM comments;

CREATE TABLE likes(
user_id INT NOT NULL,
photo_id INT NOT NULL,
created_at TIMESTAMP DEFAULT NOW(),
FOREIGN KEY(user_id) REFERENCES users(id),
FOREIGN KEY(photo_id) REFERENCES photos(id),
 PRIMARY KEY(user_id, photo_id)
 );

INSERT INTO likes(user_id, photo_id)
VALUES(2,1),
(3,1),
(1,2),
(1,3),
(2,2);


CREATE TABLE follows (
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)
);

INSERT INTO follows(follower_id, followee_id) VALUES
(1,2),
(1,3),
(3,1),
(2,3);

SELECT * FROM follows;