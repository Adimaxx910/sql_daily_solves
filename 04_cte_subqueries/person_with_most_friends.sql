-- Problem:
-- Find the person who has the highest number of friends based on accepted requests.
-- Each friendship is bidirectional, meaning both requester_id and accepter_id
-- contribute to the total friend count.
-- SQL Category: Aggregations, UNION ALL, Subqueries

-- Table Structure:
-- RequestAccepted(requester_id, accepter_id, accept_date)

-- Solution:
SELECT 
    id,
    COUNT(*) AS num
FROM (
    SELECT requester_id AS id FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id FROM RequestAccepted
) anshu
GROUP BY id
ORDER BY COUNT(*) DESC
LIMIT 1;
