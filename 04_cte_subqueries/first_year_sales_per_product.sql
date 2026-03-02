-- Problem:
-- Retrieve the first year each product was sold along with its quantity and price.
-- The first year is defined as the earliest year available for each product.
-- SQL Category: Subqueries, Window Functions

-- Table Structure:
-- Sales(product_id, year, quantity, price)

-- Solution 1: Using Subquery (MIN year)
SELECT DISTINCT
    product_id,
    year AS first_year,
    quantity,
    price
FROM Sales
WHERE (product_id, year) IN (
    SELECT product_id, MIN(year)
    FROM Sales
    GROUP BY product_id
);

-- Solution 2: Using Window Function (RANK)
SELECT
    product_id,
    year AS first_year,
    quantity,
    price
FROM (
    SELECT *,
           RANK() OVER (PARTITION BY product_id ORDER BY year) AS r
    FROM Sales
) t
WHERE r = 1;
