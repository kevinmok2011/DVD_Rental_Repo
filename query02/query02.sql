-- To get the popularity of DVD rentals by category
SELECT c.name as category_name , COUNT(r.rental_id) as number_of_rentals 
FROM rental r
JOIN inventory inv ON r.inventory_id = inv.inventory_id
JOIN film f ON inv.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY category_name
ORDER BY COUNT(r.rental_id) DESC;
