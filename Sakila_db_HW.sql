-- 1a.
SELECT first_name, last_name
FROM actor;

--1b.
SELECT UPPER(CONCAT(first_name,' ', last_name)) AS 'Actor Name'
FROM actor;

