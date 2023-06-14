-- We want to highlight 10 wines to increase our sales, which ones should we choose and why?
SELECT name, ratings_count, ratings_average
FROM vintages
WHERE ratings_average >= 4.6
ORDER BY ratings_count DESC
LIMIT 10 ;