/*SELECT 	heightMeters, weightKilograms,
		ROUND(weightKilograms/(heightMeters*heightMeters), 2) AS bmi
FROM 	players;
*/

/*SELECT 	CAST(assists AS REAL) AS assists,
		CAST(turnovers AS REAL) AS turnovers,
		assists / CAST(turnovers AS REAL) AS assist_turnover_ratio
FROM	career_summaries;
*/

/*SELECT DISTINCT	STRFTIME('%Y'||'-'||'%m', DATE) AS distinct_year_month 
FROM 	time_series;
*/

/*SELECT 	SUM(votes) AS total_presidential_votes
FROM 	presidential;
*/

SELECT 	SUM(confirmed) AS total_confirmed, 
		SUM(recovered) AS total_recovered,
		SUM(deaths) AS total_deaths
FROM 	daily_report;






