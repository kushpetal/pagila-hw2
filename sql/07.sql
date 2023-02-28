/*
 * A group of social scientists is studying American movie watching habits.
 * To help them, select the titles of all films that have never been rented by someone who lives in the United States.
 *
 * NOTE:
 * Not every film in the film table is available in the store's inventory,
 * and you should only return films in the inventory.
 *
 * HINT:
 * This can be solved either with a LEFT JOIN or with the NOT IN operator.
 * You may choose whichever solution makes the most sense to you.
 */


WITH us_rentals AS (
SELECT film_id FROM inventory
JOIN rental ON rental.inventory_id = inventory.inventory_id
JOIN customer ON customer.customer_id = rental.customer_id
JOIN address ON address.address_id = customer.address_id
JOIN city ON city.city_id = address.city_id
JOIN country ON country.country_id = city.country_id
WHERE country.country = 'United States'
UNION 
SELECT film_id FROM inventory
JOIN rental ON rental.inventory_id = inventory.inventory_id
JOIN staff ON staff.staff_id = rental.staff_id
JOIN address ON address.address_id = staff.address_id
JOIN city ON city.city_id = address.city_id
JOIN country ON country.country_id = city.country_id
WHERE country.country = 'United States'
)
SELECT film.title FROM film
JOIN inventory ON film.film_id = inventory.film_id
WHERE film.film_id NOT IN (SELECT film_id FROM us_rentals)
GROUP BY film.title
ORDER BY film.title ASC;



