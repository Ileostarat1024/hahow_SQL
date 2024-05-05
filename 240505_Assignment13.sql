SELECT
	Province_State,
	SUM(Confirmed) AS Confirmed
FROM
	daily_report dr
JOIN lookup_table lt 
ON
	dr.Combined_Key = lt.Combined_Key
WHERE
	Country_Region = "US"
GROUP BY
	Province_State
ORDER BY
	Confirmed DESC
LIMIT 10;


SELECT
	Country_Region,
	SUM(Confirmed) AS Confirmed,
	SUM(Deaths) AS Deaths
FROM
	daily_report dr
JOIN lookup_table lt 
ON
	dr.Combined_Key = lt.Combined_Key
WHERE
	Country_Region IN ("China", "Japan", "Korea, South", "Singapore", "Taiwan")
GROUP BY
	Country_Region;

SELECT
	director,
	COUNT(id) AS counts
FROM
	movies m
GROUP BY
	director
HAVING
	counts = (
	SELECT
		COUNT(id) as counts
	FROM
		movies m
	GROUP BY
		director
	ORDER BY
		counts DESC
	LIMIT 1);

SELECT
	actor_id,
	name,
	COUNT(m.id) AS counts
FROM
	movies m
JOIN casting c 
ON
	m.id = c.movie_id
JOIN actors a 
ON
	c.actor_id = a.id
GROUP BY
	actor_id
HAVING
	counts = (
	SELECT
		COUNT(m.id) AS counts
	FROM
		movies m
	JOIN casting c 
ON
		m.id = c.movie_id
	JOIN actors a 
ON
		c.actor_id = a.id
	GROUP BY
		actor_id
	ORDER BY
		counts DESC
	LIMIT 1
	);

SELECT
	DISTINCT title,
	director,
	a.name AS lead_actor
FROM
	movies m
JOIN casting c 
ON
	m.id = c.movie_id
JOIN actors a 
ON
	c.actor_id = a.id
WHERE
	rating >= 8.8
	AND c.ord = 1;

SELECT
	firstName,
	lastName,
	'assists' AS category,
	MAX(assists) AS value
FROM
	players p
JOIN career_summaries cs 
ON
	p.personId = cs.personId
UNION 
SELECT
	firstName,
	lastName,
	'steals' AS category,
	MAX(steals) AS value
FROM
	players p
JOIN career_summaries cs 
ON
	p.personId = cs.personId
UNION 
SELECT
	firstName,
	lastName,
	'blocks' AS category,
	MAX(blocks) AS value
FROM
	players p
JOIN career_summaries cs 
ON
	p.personId = cs.personId
UNION 
SELECT
	firstName,
	lastName,
	'totReb' AS category,
	MAX(totReb) AS value
FROM
	players p
JOIN career_summaries cs 
ON
	p.personId = cs.personId
UNION 
SELECT
	firstName,
	lastName,
	'points' AS category,
	MAX(points) AS value
FROM
	players p
JOIN career_summaries cs 
ON
	p.personId = cs.personId;


SELECT
	team_name,
	SUM(counts) AS number_of_players
FROM
	(
	SELECT
		t.fullName AS team_name,
		CASE
			WHEN cs.ppg >= 20 THEN 1
			ELSE 0
		END AS counts
	FROM
		players p
	LEFT JOIN career_summaries cs 
ON
		p.personId = cs.personId
	LEFT JOIN teams t 
ON
		p.teamId = t.teamId)
GROUP BY
	team_name
ORDER BY
	number_of_players DESC,
	team_name;

SELECT
	sub1.party,
	sub1.presidential,
	sub2.legislative_regional,
	sub3.legislative_at_large
FROM
	(
	SELECT
		p2.party,
		ROUND(SUM(votes)* 100.0 /(SELECT SUM(votes)
								FROM presidential p), 2) || '%' AS presidential
	FROM
		presidential p
	JOIN candidates c 
ON
		p.candidate_id = c.id
	JOIN parties p2 
ON
		c.party_id = p2.id
	WHERE
		p2.party IN ('中國國民黨', '民主進步黨')
	GROUP BY
		p2.party) AS sub1
JOIN
(
	SELECT
		p2.party,
		ROUND(SUM(votes)* 100.0 /(SELECT SUM(votes)
								FROM legislative_regional lr), 2) || '%' AS legislative_regional
	FROM
		legislative_regional lr
	JOIN candidates c 
ON
		lr.candidate_id = c.id
	JOIN parties p2 
ON
		c.party_id = p2.id
	WHERE
		p2.party IN ('中國國民黨', '民主進步黨')
	GROUP BY
		p2.party) AS sub2
ON
	sub1.party = sub2.party
JOIN
(
	SELECT
		p2.party,
		ROUND(SUM(votes)* 100.0 /(SELECT SUM(votes)
								FROM legislative_at_large lal), 2) || '%' AS legislative_at_large
	FROM
		legislative_at_large lal
	JOIN parties p2 
ON
		lal.party_id = p2.id
	WHERE
		p2.party IN ('中國國民黨', '民主進步黨')
	GROUP BY
		p2.party) AS sub3
ON
	sub1.party = sub3.party;


SELECT
	ar.county,
	ar.town,
	ar.village,
	(han_votes - tsai_votes) AS net_winning_votes
FROM
	(
	SELECT
		ar.id,
		SUM(p.votes) AS han_votes
	FROM
		presidential p
	JOIN admin_regions ar 
ON
		p.admin_region_id = ar.id
	WHERE
		p.candidate_id = 2
	GROUP BY
		ar.id) AS han
JOIN (
	SELECT
		ar.id,
		SUM(p.votes) AS tsai_votes
	FROM
		presidential p
	JOIN admin_regions ar 
ON
		p.admin_region_id = ar.id
	WHERE
		p.candidate_id = 3
	GROUP BY
		ar.id) AS tsai
ON
	han.id = tsai.id
JOIN admin_regions ar 
ON
	han.id = ar.id
WHERE
	net_winning_votes > 0
ORDER BY
	net_winning_votes DESC;












