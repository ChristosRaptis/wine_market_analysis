-- We would like to give a price to the best winery, which one should we choose and why?
SELECT w2.name AS winery_name, SUM(w1.ratings_count) AS total_ratings_count
FROM wines AS w1
INNER JOIN wineries AS w2
ON w1.winery_id = w2.id
GROUP BY winery_name
HAVING w1.ratings_average >= 4.6
ORDER BY total_ratings_count DESC 
LIMIT 1;