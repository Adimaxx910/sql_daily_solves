-- Problem:
-- Find the names of customers who have never placed any orders.
-- This helps identify inactive customers with no transaction history.
-- SQL Category: Joins (LEFT JOIN)

-- Table Structure:
-- Customers(id, name)
-- Orders(id, customerId)

-- Solution:
SELECT c.name AS Customers
FROM Customers c
LEFT JOIN Orders o
    ON c.id = o.customerId
WHERE o.customerId IS NULL;
