SELECT
	iso2,
	Country_Region,
	Province_State,
	Confirmed
FROM
	lookup_table lt
JOIN daily_report dr 
ON
	lt.Combined_Key = dr.Combined_Key
WHERE
	Province_State IN ("Grand Princess", "Diamond Princess")

	
SELECT
	Country_Region,
	SUM(Confirmed) AS Confirmed,
	SUM(Deaths) AS Deaths
FROM
	lookup_table lt
JOIN daily_report dr 
ON
	lt.Combined_Key = dr.Combined_Key
GROUP BY
	Country_Region
	
	
SELECT
	DISTINCT CASE
		WHEN title LIKE 'Batman%'
		or title Like 'The Dark Knight%' THEN 'Batman Trilogy'
		WHEN title LIKE 'The Lord of the Rings%' THEN 'The Lord of the Rings Trilogy'
		ELSE 0
	END AS trilogy,
		name
FROM
	movies m
JOIN casting c 
ON
	m.id = c.movie_id
JOIN actors a 
ON
	c.actor_id = a.id
WHERE
	Trilogy != 0
ORDER BY
	trilogy,
	name


SELECT
	firstName,
	lastName,
	'rpg' AS category,
	rpg AS value
FROM
	players p
JOIN career_summaries cs 
ON
	p.personId = cs.personId
WHERE
	rpg = (
	SELECT
		MAX(rpg)
	FROM
		career_summaries)
UNION 
SELECT
	firstName,
	lastName,
	'bpg' AS category,
	bpg AS value
FROM
	players p
JOIN career_summaries cs 
ON
	p.personId = cs.personId
WHERE
	bpg = (
	SELECT
		MAX(bpg)
	FROM
		career_summaries)
UNION 
SELECT
	firstName,
	lastName,
	'apg' AS category,
	apg AS value
FROM
	players p
JOIN career_summaries cs 
ON
	p.personId = cs.personId
WHERE
	apg = (
	SELECT
		MAX(apg)
	FROM
		career_summaries)
UNION 
SELECT
	firstName,
	lastName,
	'spg' AS category,
	spg AS value
FROM
	players p
JOIN career_summaries cs 
ON
	p.personId = cs.personId
WHERE
	spg = (
	SELECT
		MAX(spg)
	FROM
		career_summaries)
UNION 
SELECT
	firstName,
	lastName,
	'ppg' AS category,
	ppg AS value
FROM
	players p
JOIN career_summaries cs 
ON
	p.personId = cs.personId
WHERE
	ppg = (
	SELECT
		MAX(ppg)
	FROM
		career_summaries)



SELECT
	c1.county,
	c1.soong_yu_votes,
	c2.han_chang_votes,
	c3.tsai_lai_votes
FROM
	(
	SELECT
		county,
		SUM(votes) AS soong_yu_votes
	FROM
		admin_regions ar
	JOIN presidential p 
ON
		ar.id = p.admin_region_id
	WHERE
		candidate_id = 1
	GROUP BY
		county) AS c1
JOIN (
	SELECT
		county,
		SUM(votes) AS han_chang_votes
	FROM
		admin_regions ar
	JOIN presidential p 
ON
		ar.id = p.admin_region_id
	WHERE
		candidate_id = 2
	GROUP BY
		county) AS c2
ON
	c1.county = c2.county
JOIN (
	SELECT
		county,
		SUM(votes) AS tsai_lai_votes
	FROM
		admin_regions ar
	JOIN presidential p 
ON
		ar.id = p.admin_region_id
	WHERE
		candidate_id = 3
	GROUP BY
		county) AS c3
ON
	c1.county = c3.county







