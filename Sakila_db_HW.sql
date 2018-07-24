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