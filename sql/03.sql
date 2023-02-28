/*
 * Management wants to send coupons to customers who have previously rented one of the top-5 most profitable movies.
 * Your task is to list these customers.
 *
 * HINT:
 * In problem 16 of pagila-hw1, you ordered the films by most profitable.
 * Modify this query so that it returns only the film_id of the top 5 most profitable films.
 * This will be your subquery.
 * 
 * Next, join the film, inventory, rental, and customer tables.
 * Use a where clause to restrict results to the subquery.
 */

WITH top_5 AS (
    SELECT film.film_id, SUM(payment.amount) AS profit
    FROM film
    JOIN inventory ON inventory.film_id = film.film_id
    JOIN rental ON rental.inventory_id = inventory.inventory_id
    JOIN payment ON payment.rental_id = rental.rental_id
    GROUP BY film.film_id
    ORDER BY profit DESC
    LIMIT 5
)
SELECT customer.customer_id FROM customer
JOIN rental ON rental.customer_id = customer.customer_id
JOIN inventory ON inventory.inventory_id = rental.inventory_id
JOIN film ON film.film_id = inventory.film_id
WHERE film.film_id IN (SELECT top_5.film_id FROM top_5)
GROUP BY customer.customer_id
ORDER BY customer.customer_id ASC;


