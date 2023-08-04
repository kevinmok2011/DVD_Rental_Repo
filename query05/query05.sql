-- To get the average and s.d. of customer's payment amount 
-- according to their country which begins with 'T'
WITH customer_country AS (
	SELECT co.country,cu.customer_id
	FROM country co
	JOIN city ci ON co.country_id = ci.country_id
	JOIN address ad ON ci.city_id = ad.city_id
	JOIN customer cu ON ad.address_id = cu.address_id
	WHERE co.country like 'T%'
)
SELECT cuc.country, AVG(p.amount) as average_payment, STDDEV(p.amount) as sd_payment
FROM payment p
JOIN customer_country cuc on p.customer_id = cuc.customer_id
GROUP BY cuc.country;