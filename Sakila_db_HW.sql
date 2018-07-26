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
SELECT last_name, COUNT(*) as COUNT
from actor;

--4b
SELECT last_name, 
COUNT(*) AS COUNT
FROM actor
HAVING COUNT >=2;

--4c
UPDATE actor 
SET first_name = 'HARPO'
WHERE actor_id = 172;

--4d
UPDATE actor 
SET first_name = 'GROUCHO'
WHERE actor_id = 172;

--5a
SELECT actor.first_name, actor.last_name, address.address, address.city_id,
address.postal_code
FROM actor
JOIN address 
ON actor.actor_id = address.address_id
;

--6a 
SELECT first_name, last_name, address
FROM staff 
JOIN address 
ON staff.address_id = address.address_id
;

--6b
SELECT staff.first_name, staff.last_name, payment.amount, payment.payment_date
FROM staff 
JOIN payment  
ON staff.staff_id = payment.staff_id and payment_date like '2005-08%';

--6c
select film.title, film_actor.actor_id
from film 
inner join film_actor
on film.film_id = film_actor.actor_id
;

--6d
SELECT film.title
FROM film 
INNER JOIN inventory
ON film.film_id = inventory.film_id AND film.title LIKE 'Hunchback Impossible';
;

--6e
SELECT customer.first_name,customer.last_name,payment.amount
FROM customer 
JOIN payment 
ON customer.customer_id  = payment.customer_id
ORDER BY customer.last_name
;

--7a 
SELECT film.title
FROM film 
WHERE film.language_id IN (
        SELECT language.language_id
       FROM language 
WHERE film.title like 'K%' OR film.title like 'Q%' AND language.name = "English"
);

--7b
SELECT film_actor.actor_id
from film_actor
where film_actor.actor_id in (
	SElECT film.film_id
    FROM film
    WHERE film.title = "Alone Trip");

--7c 
SELECT customer.first_name, customer.Last_name, customer.email,country.country
FROM customer 
JOIN country
on customer.customer_id = country.country_id
WHERE country.country = "Canada"
;

--7d
SELECT film.title, category.name
FROM film
JOIN category
ON film.film_id = category.category_id
WHERE category.name= "Family";

--7e
SELECT film.title, COUNT(rental_id) AS 'Times Rented'
FROM rental 
JOIN inventory 
ON (rental.inventory_id = inventory.inventory_id)
JOIN film 
ON (inventory.film_id = film.film_id)
GROUP BY film.title
ORDER BY `Times Rented` DESC;

--7f 
SELECT s.store_id, SUM(amount) AS 'Revenue'
FROM payment p
JOIN rental r
ON (p.rental_id = r.rental_id)
JOIN inventory i
ON (i.inventory_id = r.inventory_id)
JOIN store s
ON (s.store_id = i.store_id)
GROUP BY s.store_id; 

--7g
SELECT store.store_id, city.city, country.country 
FROM store 
JOIN address  
ON (store.address_id = address.address_id)
JOIN city 
ON (city.city_id = address.city_id)
JOIN country
ON (country.country_id = city.country_id);

--7h
SELECT category.name AS 'Genre', SUM(payment.amount) AS 'Gross' 
FROM category 
JOIN film_category 
ON (category.category_id= film_category.category_id)
JOIN inventory 
ON (film_category.film_id=inventory.film_id)
JOIN rental 
ON (inventory.inventory_id=rental.inventory_id)
JOIN payment 
ON (rental.rental_id=payment.rental_id)
GROUP BY category.name 
ORDER BY Gross  
LIMIT 5
;

--8a 
CREATE VIEW genre_revenue AS
SELECT category.name AS 'Genre', SUM(payment.amount) AS 'Gross' 
FROM category 
JOIN film_category 
ON (category.category_id=film_category.category_id)
JOIN inventory 
ON (film_category.film_id=inventory.film_id)
JOIN rental  
ON (inventory.inventory_id=rental.inventory_id)
JOIN payment 
ON (rental.rental_id=payment .rental_id)
GROUP BY category.name 
ORDER BY Gross  
LIMIT 5
;

--8b
SELECT * FROM genre_revenue;

--8c
DROP VIEW genre_revenue;