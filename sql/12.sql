/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */


SELECT film.title
FROM film
INNER JOIN (
  SELECT film_id
  FROM film
  WHERE 'Behind the Scenes' = ANY(special_features)
) bts ON film.film_id = bts.film_id
INNER JOIN (
  SELECT film_id
  FROM film
  WHERE 'Trailers' = ANY(special_features)
) trailers ON film.film_id = trailers.film_id
ORDER BY film.title ASC;
