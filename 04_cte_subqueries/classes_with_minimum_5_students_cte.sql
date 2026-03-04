-- Problem:
-- Find all classes that have at least five students enrolled.
-- Return the class names that meet this minimum enrollment requirement.
-- SQL Category: CTEs, Aggregations

-- Table Structure:
-- Courses(student, class)

-- Solution:
WITH cte AS (
    SELECT
        class,
        COUNT(*) AS totalcount
    FROM Courses
    GROUP BY class
)
SELECT
    class
FROM cte
WHERE totalcount >= 5;
