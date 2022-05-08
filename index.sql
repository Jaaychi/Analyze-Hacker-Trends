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
  
 
