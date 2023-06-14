-- Average wine rating per country.
SELECT c.name AS country, ROUND(AVG(w.ratings_average), 1) AS wine_average_rating
FROM wines AS w 
INNER JOIN regions AS r 
ON w.region_id = r.id
INNER JOIN countries AS c 
ON r.country_code = c.code
GROUP BY c.name 
ORDER BY wine_average_rating DESC;