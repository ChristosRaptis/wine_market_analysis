-- We have a marketing budget for this year, which country should we prioritise and why?
SELECT name AS country, users_count, wines_count
FROM countries
ORDER BY users_count DESC
LIMIT 1 ;