/*
SELECT Country_Region, SUM(Confirmed) AS total_confirmed
FROM lookup_table
JOIN daily_report
ON 	lookup_table.Combined_Key = daily_report.Combined_key
GROUP BY Country_Region
ORDER BY total_confirmed DESC
LIMIT 10;
*/

/*
SELECT party, 
	   "不分區立委" AS election,
		ROUND(SUM(votes)*1.0/(SELECT SUM(votes)
								FROM legislative_at_large),4)		
FROM legislative_at_large
JOIN parties
ON legislative_at_large.party_id = parties.id 
GROUP BY party
HAVING party IN ("中國國民黨", "民主進步黨", "親民黨")
UNION
SELECT party, type, ROUND(SUM(votes)*1.0/(SELECT SUM(votes)
									  FROM legislative_regional),4)
FROM legislative_regional
JOIN candidates
ON 	legislative_regional.candidate_id = candidates.id
JOIN parties
ON 	candidates.party_id = parties.id
GROUP BY party
HAVING party IN ("中國國民黨", "民主進步黨", "親民黨")
ORDER BY election;
 */

/*
SELECT fullName AS team_name, firstName || ' ' || lastName AS player_name, ppg
FROM career_summaries
JOIN players
ON 	 career_summaries.personId = players.personId 
JOIN teams
ON	 players.teamId = teams.teamId 
WHERE fullName = 'Los Angeles Lakers'
ORDER BY ppg DESC;
*/

/*
SELECT fullName AS team, firstName || ' ' || lastName AS player, MAX(ppg) AS ppg
FROM career_summaries
JOIN players
ON 	 career_summaries.personId = players.personId 
JOIN teams
ON	 players.teamId = teams.teamId 
GROUP BY fullName
ORDER BY team;
*/

SELECT
	release_year,
	title,
	name,
	CASE
		WHEN ord = 1 THEN 1
		ELSE 0
	END AS is_lead_actor
FROM
	movies
JOIN casting
ON
	movies.id = casting.movie_id
JOIN actors
ON
	casting.actor_id = actors.id
WHERE
	name in ('Tom Hanks', 'Leonardo DiCaprio')
ORDER BY
	release_year






