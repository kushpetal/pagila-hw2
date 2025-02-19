/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */

SELECT DISTINCT CONCAT(actor.first_name, ' ', actor.last_name) AS "Actor Name"
FROM actor
JOIN film_actor ON film_actor.actor_id = actor.actor_id
JOIN film ON film.film_id = film_actor.film_id
WHERE 'Behind the Scenes' = ANY (film.special_features)
ORDER BY "Actor Name" ASC;





