-- Problem:
-- Calculate the daily cancellation rate of trips within a given date range.
-- Only include trips where both the client and the driver are not banned.
-- SQL Category: Aggregations, Joins

-- Table Context:
-- Trips(id, client_id, driver_id, status, request_at)
-- Users(users_id, banned)

-- Solution:
SELECT 
    t.request_at AS Day,
    ROUND(
        SUM(t.status IN ('cancelled_by_driver', 'cancelled_by_client')) 
        / COUNT(*),
        2
    ) AS `Cancellation Rate`
FROM Trips t
JOIN Users u
    ON t.client_id = u.users_id
   AND u.banned = 'No'
JOIN Users d
    ON t.driver_id = d.users_id
   AND d.banned = 'No'
WHERE t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY t.request_at;
