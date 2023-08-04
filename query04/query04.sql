-- To get a list of customer that is from China
SELECT CONCAT(first_name,' ',last_name) as full_name
FROM customer
EXCEPT 
SELECT CONCAT(cu.first_name,' ',cu.last_name) as full_name
FROM customer cu
JOIN address a ON cu.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id
WHERE co.country <> 'China';