/*SELECT Country_Region, Date, Confirmed, Daily_Cases 
FROM time_series 
WHERE Country_Region = 'Taiwan';
*/

/*SELECT 	title, rating, director, runtime
FROM 	movies
WHERE 	release_year = '1994';
*/

/*SELECT  id, name
FROM 	actors
WHERE 	name IN ('Tom Hanks', 'Christian Bale', 'Leonardo DiCaprio');
*/

/*SELECT  title, director
FROM	movies
WHERE 	director IN ('Christopher Nolan','Peter Jackson')
ORDER BY director;
*/

SELECT DISTINCT Country_Region
FROM 	lookup_table
WHERE 	Country_Region LIKE '%land%'
ORDER BY Country_Region;
