/*SELECT 	firstName, lastName, heightMeters
FROM	players
WHERE 	heightMeters = (SELECT 	MAX(heightMeters)
						FROM	players) or
		heightMeters = (SELECT 	MIN(heightMeters)
						FROM	players);*/

/*SELECT 	country, ROUND(CAST(COUNT(*) AS REAL)/(SELECT COUNT(*) FROM players), 6) AS player_percentage
FROM 	players
GROUP BY 	country
ORDER BY 	player_percentage DESC;*/

/*SELECT
	firstName,
	lastName
FROM
	players
WHERE
	personId = (
	SELECT
		personId
	FROM
		career_summaries
	WHERE
		ppg = (
		SELECT
			MAX(ppg)
		FROM
			career_summaries));
*/

/*SELECT 	firstName, lastName
FROM	players
WHERE	teamId = (SELECT 	teamId
					FROM 	teams
					WHERE 	fullName = 'Brooklyn Nets');*/

SELECT candidate_id , ROUND((SUM(votes)*1.0/(SELECT 	SUM(votes)
									  	FROM	presidential))*100 , 2) || '%' AS votes_percentage
FROM 	presidential
GROUP BY candidate_id;

