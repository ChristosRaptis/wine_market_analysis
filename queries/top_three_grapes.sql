SELECT DISTINCT g.name, m.wines_count
FROM most_used_grapes_per_country AS m 
INNER JOIN grapes AS g 
ON m.grape_id = g.id
ORDER BY wines_count DESC 
LIMIT 3;