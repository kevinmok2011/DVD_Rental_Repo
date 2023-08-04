--To get the customers list whose rental period is less than 1 day
SELECT r.rental_date, r.return_date, CONCAT(c.first_name,' ', c.last_name) as full_name
FROM rental r
INNER JOIN customer c
on r.customer_id = c.customer_id
where (r.return_date - r.rental_date)  < INTERVAL '1' DAY;

