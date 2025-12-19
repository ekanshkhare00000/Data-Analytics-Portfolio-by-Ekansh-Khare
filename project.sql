create database project;
use project;
 CREATE TABLE Users (              --  table 1
    user_id INT PRIMARY KEY,
    email VARCHAR(50),
    Passwords INT,
    name VARCHAR(20)
);
INSERT INTO Users (user_id, email, Passwords, name)
VALUES 
(1, 'rahul.sharma@example.com', 123456, 'Rahul Sharma'),
(2, 'anita.patel@example.com', 654321, 'Anita Patel'),
(3, 'vikas.verma@example.com', 789123, 'Vikas Verma'),
(4, 'neha.kumar@example.com', 987654, 'Neha Kumar'),
(5, 'arjun.singh@example.com', 112233, 'Arjun Singh'),
(6, 'priya.desai@example.com', 445566, 'Priya Desai'),
(7, 'amit.jain@example.com', 778899, 'Amit Jain'),
(8, 'sneha.mehta@example.com', 334455, 'Sneha Mehta'),
(9, 'rohit.das@example.com', 990011, 'Rohit Das'),
(10, 'kavita.rao@example.com', 123789, 'Kavita Rao');
select * from users;

CREATE TABLE ViewingHistory (                -- table 2 
    history_id INT PRIMARY KEY,               -- A unique number for each viewing record.
    user_id INT  ,
    content_id INT,
    watched_duration INT
);

INSERT INTO ViewingHistory (history_id, user_id, content_id, watched_duration)
VALUES
(1, 1, 101, 120),
(2, 2, 102, 90),
(3, 3, 103, 150),
(4, 4, 104, 200),
(5, 5, 105, 75),
(6, 6, 106, 110),
(7, 7, 109, 60),
(8, 8, 108, 95),
(9, 9, 109, 180),
(10, 10, 110, 135);

SELECT * FROM ViewingHistory;

INSERT INTO ViewingHistorys (history_id, cont_id, content_id, release_year)   -- table 3 
VALUES
(1, 201, 101, 2019),
(2, 202, 102, 2020),
(3, 203, 103, 2018),
(4, 204, 104, 2021),
(5, 205, 105, 2017),
(6, 206, 106, 2020),
(7, 207, 107, 2022),
(8, 208, 108, 2023),
(9, 209, 109, 2021),
(10, 210, 110, 2024);
select * from ViewingHistorys;

create table content( content_id int primary key, title varchar(20), content_type varchar(20), genre_id int, release_year int,
duration int);
INSERT INTO content (content_id, title, content_type, genre_id, release_year, duration)        -- table 4 
VALUES
(101, 'The Chase', 'Movie', 1, 2019, 120),
(102, 'Mind Trap', 'Series', 2, 2020, 45),
(103, 'Love Line', 'Movie', 3, 2018, 95),
(104, 'Last Hour', 'Movie', 4, 2021, 130),
(105, 'Family Time', 'Series', 1, 2017, 30),
(106, 'Code Red', 'Movie', 2, 2020, 110),
(107, 'Wild Earth', 'Documentary', 5, 2022, 60),
(108, 'Deep Dive', 'Series', 3, 2023, 50),
(109, 'Future Wars', 'Movie', 4, 2021, 140),
(110, 'Legends', 'Series', 1, 2024, 55);
 select * from content;
 
 create table subscription( subscription_id int primary key, plan_name Varchar(20), price int);  -- table 5 
 INSERT INTO subscription (subscription_id, plan_name, price)
VALUES
(1, 'Basic Monthly', 199),
(2, 'Standard Monthly', 399),
(3, 'Premium Monthly', 599),
(4, 'Basic Quarterly', 499),
(5, 'Standard Quarterly', 999),
(6, 'Premium Quarterly', 1499),
(7, 'Basic Annual', 1499),
(8, 'Standard Annual', 2499),
(9, 'Premium Annual', 3499),
(10, 'Student Special', 99);
 select * from subscription;
 
 create table Genre( genre_id int primary key, name varchar(20));   -- table 6
 INSERT INTO Genre (genre_id, name)
VALUES
(1, 'Drama'),
(2, 'Thriller'),
(3, 'Romance'),
(4, 'Action'),
(5, 'Documentary'),
(6, 'Comedy'),
(7, 'Horror'),
(8, 'Sci-Fi'),
(9, 'Adventure'),
(10, 'Fantasy');
select * from Genre;

create table Rating( rating_id int primary key, user_id int, content_id int, rating varchar (20));   -- table 7 
INSERT INTO Rating (rating_id, user_id, content_id, rating)
VALUES
(1, 1, 101, 'Excellent'),
(2, 2, 102, 'Good'),
(3, 3, 103, 'Average'),
(4, 4, 104, 'Excellent'),
(5, 5, 105, 'Poor'),
(6, 6, 106, 'Good'),
(7, 7, 107, 'Excellent'),
(8, 8, 108, 'Average'),
(9, 9, 109, 'Good'),
(10, 10, 110, 'Excellent');
 select * from Rating;

SELECT name, email
FROM Users;        --  Q1: List all users with their email addresses.

 SELECT * 
FROM content
WHERE content_type = 'Movie' AND release_year > 2020; -- Q2: Find all movies released after 2020.

 select subscription_id, plan_name  -- Q3: Show all subscriptions with their user ID and plan name.
 from subscription;
 
 select * from Genre;  -- Q4: List all genres in the database.
 
 SELECT title          --  Q5: Find the titles of all content with a duration over 120 minutes.
FROM content
WHERE duration > 120;

ALTER TABLE Users                  -- Q6: Get the number of users per subscription plan 
ADD subscription_id INT;

UPDATE Users SET subscription_id = 1 WHERE user_id = 1;
UPDATE Users SET subscription_id = 2 WHERE user_id = 2;
UPDATE Users SET subscription_id = 3 WHERE user_id = 3;
UPDATE Users SET subscription_id = 4 WHERE user_id = 4;
UPDATE Users SET subscription_id = 5 WHERE user_id = 5;
UPDATE Users SET subscription_id = 6 WHERE user_id = 6;
UPDATE Users SET subscription_id = 7 WHERE user_id = 7;
UPDATE Users SET subscription_id = 8 WHERE user_id = 8;
UPDATE Users SET subscription_id = 9 WHERE user_id = 9;
UPDATE Users SET subscription_id = 10 WHERE user_id = 10;

SELECT s.plan_name, COUNT(u.user_id) AS number_of_users
FROM subscription s
LEFT JOIN Users u ON s.subscription_id = u.subscription_id
GROUP BY s.plan_name;

SELECT           -- Q7: Find the average rating for each content item 
    r.content_id,
    c.title,
    ROUND(AVG(                                  --  rounds the result to 2 decimal places and – calculates the average (mean) of values

        CASE                                       -- CASE = start of the condition.

            WHEN r.rating = 'Excellent' THEN 5
            WHEN r.rating = 'Good' THEN 4
            WHEN r.rating = 'Average' THEN 3
            WHEN r.rating = 'Poor' THEN 2
            WHEN r.rating = 'Bad' THEN 1
            ELSE NULL                             --  ELSE = fallback value if none of the WHEN conditions match.
        END                                 --   END = closes the entire CASE block.                     
    ), 2) AS average_rating
FROM 
    Rating r
JOIN 
    content c ON r.content_id = c.content_id
GROUP BY 
    r.content_id, c.title;
 
 
 --  List users who have watched more than 3 different content items
SELECT u.user_id, u.name, COUNT(DISTINCT v.content_id) AS total_contents_watched  -- counts how many unique content items the user watched.
FROM Users u
JOIN ViewingHistory v ON u.user_id = v.user_id
GROUP BY u.user_id, u.name
HAVING COUNT(DISTINCT v.content_id) > 3;                          -- counts only different values which is more than 3.


-- Q9 Get the list of shows and their genres. 
SELECT 
    c.title AS show_title,           -- Name of the show
    c.content_type,                   -- Tells if it’s a Movie, Series, or Documentary.
    g.name AS genre_name             --  The genre (like Drama, Action, etc.)
FROM 
    content c
JOIN 
    genre g ON c.genre_id = g.genre_id;


-- Find the top 3 longest movies.
SELECT watched_duration
FROM ViewingHistory
ORDER BY watched_duration DESC
LIMIT 3;


-- : Q11 Find the most active user (who watched the most total duration)
SELECT u.user_id, u.name, SUM(vh.watched_duration) AS total_watch_time  -- calculates the total duration watched by each user. 
FROM Users u
JOIN ViewingHistory vh ON u.user_id = vh.user_id
GROUP BY u.user_id, u.name
ORDER BY total_watch_time DESC
LIMIT 1; 

-- Q12 : List the top 5 highest-rated content with at least 3 ratings

SELECT 
    r.content_id,
    c.title,
    COUNT(*) AS total_ratings,
    ROUND(AVG(
        CASE r.rating
            WHEN 'Excellent' THEN 4
            WHEN 'Good' THEN 3
            WHEN 'Average' THEN 2
            WHEN 'Poor' THEN 1
        END
    ), 2) AS avg_rating
FROM Rating r
JOIN content c ON r.content_id = c.content_id
GROUP BY r.content_id, c.title
HAVING COUNT(*) >= 3
ORDER BY avg_rating DESC
LIMIT 3;
-- In your current data, each content has only one rating, 
-- so this query will return nothing unless you add more ratings per content in the Rating table.


-- :Q13 Find users who watched a specific genre the most (e.g., 'Action'). 
SELECT 
    u.user_id,
    u.name,
    COUNT(*) AS action_watched_count
FROM 
    Users u
JOIN ViewingHistory vh ON u.user_id = vh.user_id   -- Users → ViewingHistory: Links users to the content they've watched.
JOIN Content c ON vh.content_id = c.content_id     -- ViewingHistory → Content: Links to the content details like title, genre, etc. 
JOIN Genre g ON c.genre_id = g.genre_id            -- Content → Genre: Links to the genre to filter only Action content.
WHERE 
    g.name = 'Action'

GROUP BY 
    u.user_id, u.name
ORDER BY 
    action_watched_count DESC;



-- Q14 Calculate average viewing duration per content item 

SELECT 
    vh.content_id,
    c.title,
    AVG(vh.watched_duration) AS average_duration
FROM 
    ViewingHistory vh
JOIN 
    content c ON vh.content_id = c.content_id
GROUP BY 
    vh.content_id, c.title;
    
    -- Q15 Get content that has not been rated yet.
    
    SELECT c.content_id, c.title
FROM content c
LEFT JOIN Rating r ON c.content_id = r.content_id
WHERE r.rating IS NULL; -- Here nothig is to show Because all content has been Rated.


-- List users who have watched more than 3 different content items
SELECT 
    u.user_id,
    u.name,
    COUNT(DISTINCT vh.content_id) AS total_content_watched
FROM 
    Users u
JOIN 
    ViewingHistory vh ON u.user_id = vh.user_id
GROUP BY 
    u.user_id, u.name
HAVING 
    COUNT(DISTINCT vh.content_id) > 3;


