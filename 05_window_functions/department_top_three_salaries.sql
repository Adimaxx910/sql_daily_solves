-- Problem:
-- Identify employees who are high earners in each department.
-- A high earner is an employee whose salary is within the top three unique
-- salaries of their department.
-- SQL Category: Window Functions, Joins

-- Table Structure:
-- Employee(id, name, salary, departmentId)
-- Department(id, name)

-- Solution:
WITH rankemployee AS (
    SELECT
        name,
        salary,
        departmentId,
        DENSE_RANK() OVER (
            PARTITION BY departmentId
            ORDER BY salary DESC
        ) AS depsalaryrank
    FROM Employee
)
SELECT
    d.name AS Department,
    r.name AS Employee,
    r.salary AS Salary
FROM rankemployee r
JOIN Department d
    ON r.departmentId = d.id
WHERE r.depsalaryrank <= 3;
