# Write your MySQL query statement below
SELECT 
  ROUND(
    COUNT(*) * 1.0 / (SELECT COUNT(DISTINCT player_id) FROM Activity), 
    2
  ) AS fraction
FROM (
  -- players who came back next day
  SELECT DISTINCT a.player_id
  FROM Activity a, Activity b
  WHERE a.player_id = b.player_id
    AND b.event_date = DATE_ADD(a.event_date, INTERVAL 1 DAY)
    AND a.event_date = (
      SELECT MIN(event_date)
      FROM Activity
      WHERE player_id = a.player_id
    )
) AS consecutive_players;
