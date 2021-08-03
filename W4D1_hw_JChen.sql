-- Question 1: How many actors are there with the last name 'Wahlberg'?
SELECT COUNT(last_name)
FROM actor
WHERE last_name = 'Wahlberg';
-- 2 actors with last name 'Wahlberg'.

-- Question 2: How many payments were made between $3.99 and $5.99?
SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;
-- 5607 payments between $3.99 and $5.99.

-- Question 3: What film does the store have the most of? (search in inventory)
SELECT store_id, COUNT(film_id)
FROM inventory
GROUP BY store_id;
-- store 2 has the most films

-- Question 4: How many customers have the last name 'William'?
SELECT COUNT(last_name)
FROM customer
WHERE last_name LIKE 'William';
-- no customer has the last name 'William', but there is one with 'Williams'.

-- Question 5: What store employee (id) sold the most rentals?
SELECT staff_id, COUNT(rental_id)
FROM rental
GROUP BY staff_id;
-- staff/employee 1 sold the most rentals at 8040, compared to staff/employee 2 who sold 8004.

-- Question 6: How many different district names are there?
SELECT COUNT(DISTINCT district)
FROM address;
-- there are 378 distinct district names.

-- Question 7: What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, COUNT(DISTINCT actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(DISTINCT actor_id) DESC;
-- film_id 508 has the most actors, with 15 actors.

-- Question 8: From store_id 1, how many customers have a last name ending with 'es'? (customer table)
SELECT COUNT(last_name), store_id
FROM customer
GROUP BY store_id
WHERE last_name LIKE '%es';
-- ***not sure why this isn't working.

-- Question 9: How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers with ids
-- between 380 and 430? (use group by having > 250)
SELECT amount, COUNT(rental_id) AS num_rentals
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING (COUNT(rental_id) > 250);
-- SUM(num_rentals) = 290+281+269 = 840 payment amounts.

-- Question 10: Within the film table, how many rating categories are there? And what rating has the most movies total?
SELECT COUNT(DISTINCT(rating))
FROM film;
-- 5 rating categories
SELECT rating, COUNT(title)
FROM film
GROUP BY rating
ORDER BY COUNT(title) DESC;
-- PG-13 has the most ratings, with 223 ratings.