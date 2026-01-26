-- Problem:
-- Find the product IDs of items that are both low fat and recyclable.
-- This query filters products based on health and sustainability attributes.


# Write your MySQL query statement below
select product_id from Products
where low_fats= "Y" and recyclable = "Y";