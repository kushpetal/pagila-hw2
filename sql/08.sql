/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 * Order the results alphabetically.
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */


SELECT title
FROM film
WHERE rating = 'G'
AND film_id IN (
  SELECT film_id
  FROM (
    SELECT film_id, unnest(special_features) AS feature
    FROM film
  ) AS subquery
  WHERE feature = 'Trailers'
)
ORDER BY title ASC;



