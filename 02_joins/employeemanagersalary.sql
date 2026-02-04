-- Problem:
-- Find the names of employees who earn more than their direct managers.
-- This helps identify cases where subordinates have higher salaries than managers.
-- SQL Category: Joins (Self Join)

-- Solution:
SELECT 
    e1.name AS Employee
FROM Employee e1
JOIN Employee e2
    ON e1.managerId = e2.id
WHERE e1.salary > e2.salary;
