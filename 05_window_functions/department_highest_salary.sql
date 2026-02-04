-- Problem:
-- Given Employee and Department tables, find employees who earn the highest salary
-- in each department. If multiple employees share the same highest salary within
-- a department, include all of them.
-- SQL Category: Window Functions, Joins

-- Table Structure:
-- Employee(id, name, salary, departmentId)
-- Department(id, name)

-- Solution:
with cte as(select distinct departmentId ,salary,name ,
rank() over (partition by departmentId order by salary desc) as salrnk
from Employee
)
select d.name as Department ,c.name as Employee ,c.salary as Salary from cte c 
left join Department d on c.departmentId = d.id
where salrnk =1 ; 
