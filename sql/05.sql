/*
 * Management wants to advertise to actors,
 * and needs a list of all actors who are not also customers.
 *
 * Assume that if an entry in the customer and actor table share a first_name and last_name,
 * then they represent the same person.
 * Then select all actors who are not also customers.
 *
 * HINT:
 * This can be solved using either a LEFT JOIN or the NOT IN operator.
 */

WITH aux AS (
SELECT CONCAT(actor.first_name, ' ', actor.last_name) AS name FROM actor
JOIN customer ON customer.first_name = actor.first_name AND customer.last_name = actor.last_name
)
SELECT actor.last_name, actor.first_name FROM actor
WHERE CONCAT(actor.first_name, ' ', actor.last_name) NOT IN (SELECT name from aux)
ORDER BY actor.last_name, actor.first_name;



