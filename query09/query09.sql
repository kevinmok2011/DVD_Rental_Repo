-- To get the top 10 appearance actors from the DVD rental films.
SELECT CONCAT(a.first_name, ' ', a.last_name) as actor_full_name, COUNT(*) AS film_appearance
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
GROUP BY CONCAT(a.first_name, ' ', a.last_name)
ORDER BY film_appearance DESC
LIMIT 10;
