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
