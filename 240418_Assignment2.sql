/*SELECT 	Confirmed, Recovered, Deaths,
		Confirmed - Recovered - Deaths AS Active
FROM daily_report;
*/

/*SELECT 	heightMeters, weightKilograms,
		weightKilograms / (heightMeters * heightMeters) AS bmi
FROM players;
*/

SELECT DISTINCT confName || ',' || divName AS conf_div
FROM teams;

	