--To get the most popular movie by its sum of payment, in which the amount is at least $150 or above
SELECT f.title as film_name, SUM(p.amount) as sum_payment, COUNT(r.rental_id) as number_rental
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON r.inventory_id = i.inventory_id
JOIN payment p ON p.rental_id = r.rental_id
GROUP BY f.film_id
HAVING SUM(p.amount) >= 150
ORDER BY SUM(p.amount) DESC;




