-- We would like to give a price to the best winery, which one should we choose and why?
SELECT w1.name AS wine_name, w2.name AS winery_name, w1.ratings_count, w1.ratings_average 
FROM wines AS w1
INNER JOIN wineries AS w2
ON w1.winery_id = w2.id
WHERE w1.ratings_average >= 4.6
ORDER BY w1.ratings_count DESC
LIMIT 1 ;