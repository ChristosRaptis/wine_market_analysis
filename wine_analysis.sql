/*markdown
### 1. We want to highlight 10 wines to increase our sales, which ones should we choose and why?
*/

/*markdown
#### Total of rating counts per rating average.
*/

SELECT ratings_average, SUM(ratings_count) AS total_ratings_count
FROM vintages
GROUP By ratings_average
ORDER BY total_ratings_count DESC;

/*markdown
#### Selecting the 10 wines that would sell best based on the higher number of rating counts for ratings equal or above 4.6 .
*/

SELECT name, ratings_count, ratings_average
FROM vintages
WHERE ratings_average >= 4.6
ORDER BY ratings_count DESC
LIMIT 10 ;

/*markdown
### 2. We have a marketing budget for this year, which country should we prioritise and why?
*/

SELECT name, wines_count, users_count
FROM countries
ORDER BY wines_count DESC
LIMIT 5 ;

SELECT name, users_count, wines_count
FROM countries
ORDER BY users_count DESC
LIMIT 5 ;

/*markdown
#### We chose the country with the most users count, meaning the one with the most potential clients.
*/

SELECT name, users_count, wines_count
FROM countries
ORDER BY users_count DESC
LIMIT 1 ;

/*markdown
### 3. We would like to give a price to the best winery, which one should we choose and why?
*/

/*markdown
#### We chose the winery that produces the wine at the top of the top 10.
*/

SELECT w1.name AS wine_name, w2.name AS winery_name, w1.ratings_count, w1.ratings_average 
FROM wines AS w1
INNER JOIN wineries AS w2
ON w1.winery_id = w2.id
WHERE w1.ratings_average >= 4.6
ORDER BY w1.ratings_count DESC
LIMIT 1 ;

/*markdown
### 4. Wines containing primary keywords and flavor groups in which they belong.
*/

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

/*markdown

### 5. Find the top 3 most common grape all over the world and for each grape, give us the the 5 best rated wines

*/

SELECT DISTINCT g.name
FROM most_used_grapes_per_country AS m 
INNER JOIN grapes AS g 
ON m.grape_id = g.id
ORDER BY wines_count DESC 
LIMIT 3;

/*markdown
### 6. Give us a visual that shows the average wine rating for each country. Do the same for the vintages.
*/

/*markdown
#### Average wine rating per country.
*/

SELECT c.name AS country, ROUND(AVG(w.ratings_average), 1) AS wine_average_rating
FROM wines AS w 
INNER JOIN regions AS r 
ON w.region_id = r.id
INNER JOIN countries AS c 
ON r.country_code = c.code
GROUP BY c.name 
ORDER BY wine_average_rating DESC;

/*markdown
#### Average vintage rating per country.
*/

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