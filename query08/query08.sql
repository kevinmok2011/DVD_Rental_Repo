-- To evaluate the performance of payment amount for different months

SELECT EXTRACT(MONTH FROM payment_date) as rental_month, SUM(amount) as payment_sum,
	(CASE WHEN SUM(amount) < 5000 THEN 'Poor'
		 WHEN SUM(amount) >= 5000 AND SUM(amount) < 10000 THEN 'Normal'
		 ELSE 'Great'
		 END) as performance
FROM payment 
GROUP BY rental_month; 

