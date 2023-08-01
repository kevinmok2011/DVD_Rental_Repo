SELECT r.rental_date, r.return_date, c.first_name, c.last_name
FROM rental r
INNER JOIN customer c
on r.customer_id = c.customer_id
where (r.return_date - r.rental_date) <= INTERVAL '7' DAY
ORDER BY r.return_date;

-- co