-- 1a.
SELECT first_name, last_name
FROM actor;

--1b.
SELECT UPPER(CONCAT(first_name,' ', last_name)) AS 'Actor Name'
FROM actor;

--2a.
SELECT first_name, last_name, actor_id 
FROM actor
where first_name = 'Joe';

--2b.
SELECT first_name, last_name, actor_id 
FROM actor
WHERE last_name LIKE '%Gen%';

--2c 
SELECT first_name, last_name, actor_id 
FROM actor
WHERE last_name LIKE '%Li%' 
ORDER BY last_name, first_name;

--2d
SELECT country_id, country 
FROM country
WHERE country IN('Afghanistan','Bangladesh', 'China') 

--3a
ALTER TABLE actor 
ADD COLUMN
middle_name varchar(40) AFTER first_name;

--3b
SELECT * FROM actor;

ALTER TABLE actor
MODIFY middle_name BLOB NOT NULL;

--3c
ALTER TABLE actor 
DROP middle_name;

SELECT * FROM actor;

--4a
SELECT last_name, 
COUNT(*) AS COUNT
FROM actor
HAVING COUNT >=2;

--4b
