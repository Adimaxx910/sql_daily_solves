-- Problem:
-- Find all classes that have at least five students enrolled.
-- Each class should be returned only once if it meets the minimum student count.
-- SQL Category: Aggregations, CTEs

-- Table Structure:
-- Courses(student, class)

-- Solution:
WITH classes AS (
    SELECT
        class,
        COUNT(*) AS student_count
    FROM Courses
    GROUP BY class
)
SELECT
    class
FROM classes
WHERE student_count >= 5;
