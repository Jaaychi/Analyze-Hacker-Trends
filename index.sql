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




