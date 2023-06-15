-- Wines containing primary keywords and flavor groups in which they belong.
SELECT w.name AS wine_name, k2.name AS keyword_name, k1.group_name AS flavor_group        
FROM keywords_wine AS k1
INNER JOIN keywords AS k2
ON k1.keyword_id = k2.id
INNER JOIN wines AS w
ON k1.wine_id = w.id
WHERE   k1.keyword_type == 'primary'
    AND k1.count > 10
    AND (
       k2.name LIKE '%coffee%'
    OR k2.name LIKE '%toast%'
    OR k2.name  LIKE '%green apple%'
    OR k2.name  LIKE '%cream%'
    OR k2.name  LIKE '%citrus%')    
ORDER BY wine_name  ;