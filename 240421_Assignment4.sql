/*SELECT 	personId, ppg
FROM 	career_summaries
ORDER BY ppg DESC
LIMIT 	10;
*/

/*SELECT  Date, Country_Region,  Daily_Cases
FROM 	time_series
ORDER BY Daily_Cases DESC
LIMIT 10;
*/

SELECT 	personId, assists, turnovers
FROM	career_summaries
ORDER BY CAST(assists AS REAL) / turnovers DESC
LIMIT 10;
