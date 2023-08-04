-- To get the inventory of DVD which are less or equal than 5 in stock.
SELECT film_id, title, rental_rate,
(SELECT COUNT(*) FROM inventory WHERE inventory.film_id = film.film_id) as inventory_count
FROM film
WHERE (SELECT COUNT(*) FROM inventory WHERE inventory.film_id = film.film_id) <=5
ORDER BY inventory_count;

