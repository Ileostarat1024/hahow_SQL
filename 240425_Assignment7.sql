/*SELECT 	release_year, 
		COUNT(release_year) AS number_of_movies
FROM 	movies
GROUP BY release_year;
*/

/*SELECT 	release_year, 
		COUNT(release_year) AS number_of_movies
FROM 	movies
GROUP BY release_year
HAVING 	number_of_movies > 4;
*/

/*SELECT 	candidate_id,
		SUM(votes) AS total_votes
FROM 	presidential
GROUP BY candidate_id;
*/

SELECT 	country,  
		COUNT(firstName) AS number_of_players
FROM 	players
GROUP BY country
HAVING 	number_of_players BETWEEN 2 AND 9
ORDER BY number_of_players DESC, country;