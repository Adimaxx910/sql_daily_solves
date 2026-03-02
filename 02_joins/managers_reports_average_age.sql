-- Problem:
-- Identify managers (employees who have at least one direct report) and
-- return their employee_id, name, the number of direct reports, and
-- the average age of their reports rounded to the nearest integer.
-- SQL Category: Self Join, Aggregations

-- Table Structure:
-- Employees(employee_id, name, reports_to, age)

-- Solution:
SELECT
    b.employee_id,
    b.name,
    COUNT(a.employee_id) AS reports_count,
    ROUND(AVG(a.age)) AS average_age
FROM Employees a
JOIN Employees b
    ON a.reports_to = b.employee_id
GROUP BY b.employee_id, b.name
ORDER BY b.employee_id;
