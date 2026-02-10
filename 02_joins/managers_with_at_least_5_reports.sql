-- Problem:
-- Identify managers who have at least five direct reports.
-- A direct report is an employee whose managerId references the manager's id.
-- SQL Category: CTEs, Aggregations, Joins

-- Table Structure:
-- Employee(id, name, department, managerId)

-- Solution:
WITH managercountcte AS (
    SELECT
        managerId,
        COUNT(*) AS manageridcount
    FROM Employee
    GROUP BY managerId
)
SELECT
    e.name
FROM Employee e
JOIN managercountcte m
    ON e.id = m.managerId
WHERE m.manageridcount >= 5;
