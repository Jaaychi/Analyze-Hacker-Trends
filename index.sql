SELECT 
  title,
  score
FROM hacker_news
ORDER BY score DESC
LIMIT 5;

-- total score of all stories
SELECT
  SUM(score) AS total_score
FROM hacker_news
ORDER BY score DESC;

--  total combined score over 200 in DESC
SELECT 
  title,
  SUM(score) AS total_score
FROM hacker_news
GROUP BY title
HAVING SUM(score) > 200
ORDER BY total_score DESC;

-- we want to add these users' scores together and divide by the total to get the percentage

SELECT 
  (517.0 + 309 + 304 + 282) / 4.0;
  
 
-- count where url equates to a certain url

SELECT
  COUNT(url) as total_count
FROM hacker_news
WHERE url = 'https://www.youtube.com/watch?v=dQw4w9WgXcQ';

-- Creating a CASE WHEN 
SELECT CASE
  WHEN url LIKE '%github.com%' THEN 'Github'
  WHEN url LIKE '%kickstarter.com%' THEN 'KickStarter'
  ELSE 'NA'
  END AS Source
FROM hacker_news;

-- Build from the previous query and then create the number of stories from each URL using COUNT() and then use a GROUP BY and CASE statement
SELECT CASE
  WHEN url LIKE '%github.com%' THEN 'Github'
  WHEN url LIKE '%kickstarter.com%' THEN 'KickStarter'
  ELSE 'NA'
  END AS Source,
  COUNT(url) AS total_url
FROM hacker_news
GROUP BY 1;

-- analyze the time stamps first
SELECT
  timestamp
FROM hacker_news
LIMIT 10;

-- figure out the regular time_ts and then create a new column per hour and then avg score with round and count the titles
SELECT 
  timestamp AS regular_ts,
  strftime('%H', timestamp) AS per_hour,
  ROUND(AVG(score), 0) AS average_score,
  COUNT(title) AS num_titles
FROM hacker_news
GROUP BY timestamp
LIMIT 20;

-- my analysis 
WITH CTE1 AS (SELECT 
  timestamp AS regular_ts,
  strftime('%H', timestamp) AS per_hour,
  ROUND(AVG(score), 0) AS average_score,
  COUNT(title) AS num_titles
FROM 
  hacker_news
WHERE 
  regular_ts IS NOT NULL
OR
  per_hour IS NOT NULL
AND 
  per_hour >= 1
AND 
  regular_ts LIKE '%2017%'
GROUP BY 
  timestamp
HAVING 
  average_score IS NOT NULL
OR 
  num_titles IS NOT NULL
AND
  num_titles != 0
LIMIT 
  20 OFFSET 1)

SELECT 
  regular_ts,
  per_hour,
  average_score,
  num_titles
FROM CTE1;



