-- Problem:
-- Find products that were sold only between 2019‑01‑01 and 2019‑03‑31.
-- A product should be included if all its sales fall within this date range.
-- SQL Category: Joins, Aggregations, HAVING

-- Table Structure:
-- Product(product_id, product_name)
-- Sales(sale_id, product_id, sale_date, quantity, price)

-- Solution:
SELECT DISTINCT
    p.product_id,
    p.product_name
FROM Sales s
LEFT JOIN Product p
    ON s.product_id = p.product_id
GROUP BY p.product_id, p.product_name
HAVING MIN(s.sale_date) >= '2019-01-01'
   AND MAX(s.sale_date) <= '2019-03-31';
