/*SELECT 	Combined_Key,
		CASE WHEN Combined_Key LIKE '%US' THEN 1
		ELSE 0 END AS is_us
FROM 	daily_report
ORDER BY is_us, Combined_Key;
*/

/*SELECT 	title, rating,
		CASE WHEN rating > 8.7 THEN 'Awesome'
			 WHEN rating > 8.4 THEN 'Terrific'
			 ELSE 'Great' END AS rating_category
FROM 	movies
*/

SELECT DISTINCT county,
		CASE WHEN county IN('臺北市','新北市','桃園市','臺中市','臺南市','高雄市') THEN '六都'
			 ELSE '非六都' END AS county_type
FROM 	admin_regions
ORDER BY county_type;

