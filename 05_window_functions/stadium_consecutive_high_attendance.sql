-- Problem:
-- Retrieve records from the Stadium table where there are at least three
-- consecutive rows (based on id) with people greater than or equal to 100.
-- Return the results ordered by visit_date in ascending order.
-- SQL Category: Window Functions, CTEs

-- Table Structure:
-- Stadium(id, visit_date, people)

-- Solution:
WITH consecutive_id AS (
    SELECT
        *,
        id - ROW_NUMBER() OVER (ORDER BY id) AS consecutive_group
    FROM Stadium
    WHERE people >= 100
),
cons_group AS (
    SELECT
        consecutive_group
    FROM consecutive_id
    GROUP BY consecutive_group
    HAVING COUNT(*) >= 3
)
SELECT
    c1.id,
    c1.visit_date,
    c1.people
FROM consecutive_id c1
JOIN cons_group c2
    ON c1.consecutive_group = c2.consecutive_group
ORDER BY c1.visit_date ASC;
