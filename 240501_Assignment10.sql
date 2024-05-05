/*
CREATE VIEW covid19.total_confirmed_by_country_region
AS
SELECT
	Country_Region,
	SUM(Confirmed) AS total_confirmed
FROM
	daily_report
JOIN lookup_table
ON
	daily_report.Combined_Key = lookup_table.Combined_Key
GROUP BY
	Country_Region;
 */

/*
CREATE VIEW twElection2020.presidential_total_votes
AS
SELECT
	number,
	candidate,
	SUM(votes)
FROM
	presidential p
JOIN candidates c 
ON
	p.candidate_id = c.id
GROUP BY
	number;
	*/

CREATE VIEW nba.ppg_leader_by_teams
AS
SELECT
	fullName AS team,
	firstName,
	lastName,
	MAX(ppg) AS ppg
FROM
	players p
JOIN career_summaries cs 
ON
	p.personId = cs.personId
JOIN teams t 
ON
	p.teamId = t.teamId
GROUP BY
	fullName
ORDER BY
	team;


