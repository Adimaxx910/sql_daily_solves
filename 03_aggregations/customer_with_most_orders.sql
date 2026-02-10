-- Problem:
-- Find the customer_number of the customer who has placed the largest number
-- of orders. It is guaranteed that exactly one customer has the highest count.
-- SQL Category: Aggregations, CTEs

-- Table Structure:
-- Orders(order_number, customer_number)

-- Solution:
WITH maxorders AS (
    SELECT
        customer_number,
        COUNT(*) AS maxcount
    FROM Orders
    GROUP BY customer_number
    ORDER BY maxcount DESC
)
SELECT
    customer_number
FROM maxorders
LIMIT 1;
