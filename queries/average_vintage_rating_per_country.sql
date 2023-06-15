-- Average vintage rating per country.
SELECT c.name AS country, ROUND(AVG(v.ratings_average), 1) AS vintage_average_rating
FROM vintages AS v
INNER JOIN wines AS w 
ON v.wine_id = w.id
INNER JOIN regions AS r 
ON w.region_id = r.id
INNER JOIN countries AS c 
ON r.country_code = c.code
GROUP BY c.name 
ORDER BY vintage_average_rating DESC;