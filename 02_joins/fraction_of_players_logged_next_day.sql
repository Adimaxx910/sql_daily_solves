-- Problem:
-- Calculate the fraction of players who logged in again on the day immediately
-- after their first login date.
-- The fraction is computed as the number of such players divided by the total
-- number of distinct players, rounded to 2 decimal places.
-- SQL Category: CTEs, Joins, Aggregations

-- Table Structure:
-- Activity(player_id, device_id, event_date, games_played)

-- Solution:
WITH nextdayplayers AS (
    SELECT
        p1.player_id,
        p1.event_date AS firstdate,
        p2.event_date AS seconddate
    FROM Activity p1
    JOIN Activity p2
        ON p1.player_id = p2.player_id
       AND DATEDIFF(p2.event_date, p1.event_date) = 1
)
SELECT
    ROUND(
        (SELECT COUNT(DISTINCT player_id) FROM nextdayplayers) * 1.0
        /
        (SELECT COUNT(DISTINCT player_id) FROM Activity),
        2
    ) AS fraction;
