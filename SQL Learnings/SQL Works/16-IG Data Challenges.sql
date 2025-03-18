-- We want to reward our users who have been around the longest Find the five old customers
use ig_clone;
SELECT * FROM users ORDER BY created_at asc LIMIT 5;

-- What day of the week do most users register on? 
SELECT 
        DAYNAME(created_at) AS day_of_week, COUNT(*) AS count
    FROM
        users
    GROUP BY day_of_week
    ORDER BY count DESC LIMIT 1;
    
    
-- Find the users who has never posted a photo 
SELECT username FROM users
LEFT JOIN photos ON users.id = photos.user_id WHERE photos.id IS NULL;

-- Who can get the most likes on a single photo
SELECT username, photos.id, image_url FROM users
JOIN photos ON users.id = photos.user_id
WHERE photos.id = (SELECT   photos.id  FROM photos
JOIN likes ON likes.photo_id= photos.id
GROUP BY photos.id ORDER BY COUNT(*)  DESC LIMIT 1);

-- SELECT * FROM users ❌
-- JOIN photos ON users.id = photos.user_id ❌
-- JOIN likes ON users.id = likes.user_id; ❌

SELECT username, photos.id, image_url,COUNT(*) AS likes_count FROM users
JOIN photos ON users.id = photos.user_id
JOIN likes ON photos.id = likes.photo_id
GROUP BY photos.id ORDER BY likes_count DESC LIMIT 1;

--  how many times the average user posts OR average number of photos posted per user.

SELECT ROUND(t_photos.total_photos/t_users.total_users) FROM (SELECT COUNT(id) AS total_users FROM users) AS t_users, 
(SELECT COUNT(id) AS total_photos FROM photos) AS t_photos;

SELECT (SELECT COUNT(id) AS total_photos FROM photos)/(SELECT COUNT(id) AS total_users FROM users) AS avg_user_posts;


-- What are the top 5 most commonly used hashtags?
SELECT 
    tag_name, COUNT(photo_tags.tag_id) AS tag_counts
FROM
    tags
        JOIN
    photo_tags ON photo_tags.tag_id = tags.id
GROUP BY tag_name
ORDER BY tag_counts DESC
LIMIT 5;


-- Find the users who have liked every single photo on the site 
SELECT DISTINCT username FROM users
    left JOIN photos ON  users.id = photos.user_id
     inner JOIN likes ON users.id = likes.user_id;
     
     
SELECT DISTINCT likes.user_id FROM photos
JOIN likes ON photos.id = likes.photo_id;