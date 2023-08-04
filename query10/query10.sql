--To get the number of customers and consumption of DVD rental, particularly with 'Canada',
--'Hong Kong' and 'Taiwan'
WITH customer_distribution AS (
	SELECT cus.customer_id, cou.country
	FROM country cou
	JOIN city ci ON cou.country_id = ci.country_id
	JOIN address ad ON ad.city_id = ci.city_id
	JOIN customer cus ON ad.address_id = cus.address_id
	WHERE cou.country = 'Hong Kong' or cou.country = 'Canada' or cou.country = 'Taiwan'
)

SELECT cd.country, COUNT(DISTINCT(p.customer_id)) AS customer_count, SUM(p.amount)
FROM payment p 
JOIN customer_distribution cd ON p.customer_id = cd.customer_id
GROUP BY cd.country;


