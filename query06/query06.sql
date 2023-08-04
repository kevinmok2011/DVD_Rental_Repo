-- To get the most amount of rental DVD and its category and language information
WITH film_rental AS(
	SELECT f.title, f.film_id, f.language_id, COUNT(*) as rental_count
	FROM film f 
	JOIN inventory i ON f.film_id = i.film_id
	JOIN rental r ON i.inventory_id = r.inventory_id
	GROUP BY f.title, f.film_id
	ORDER BY rental_count Desc
)

SELECT fr.title as film_name, c.name as film_category, l.name as language, fr.rental_count
FROM category c 
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film_rental fr ON fc.film_id = fr.film_id
JOIN language l on l.language_id = fr.language_id;


