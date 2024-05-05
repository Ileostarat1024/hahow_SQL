CREATE TABLE favorite_players(name TEXT,
years_pro INTEGER,
ppg REAL );

INSERT
	INTO
	favorite_players(name,
	years_pro,
	ppg)
VALUES
	("Steve Nash",
19,
14.3),
	("Michael Jordan",
14,
30.1),
	("Paul Pierce",
19,
19.7),
	("Kevin Garnett",
21,
17.8),
	("Hakeem Olajuwon",
18,
21.8);

UPDATE
	favorite_players
SET
	name = "Tim Duncan",
	years_pro = 19,
	ppg = 19.0
WHERE
	name = "Hakeem Olajuwon"

SELECT
	*
FROM
	favorite_players