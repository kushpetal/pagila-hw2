/*
 * Select the titles of all films that the customer with customer_id=1 has rented more than 1 time.
 *
 * HINT:
 * It's possible to solve this problem both with and without subqueries.
 */

WITH customer_data AS (
SELECT film.title, count(customer.customer_id) FROM film
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON rental.inventory_id = inventory.inventory_id
JOIN customer ON customer.customer_id = rental.customer_id
WHERE customer.customer_id = 1
GROUP BY film.title
)

SELECT customer_data.title FROM customer_data
WHERE customer_data.count > 1
ORDER BY customer_data.title ASC;



