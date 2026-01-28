-- Problem:
-- Retrieve the name, population, and area of countries that are considered big.
-- A country is classified as big if it has a large area or a high population.

# Write your MySQL query statement below

select name,population ,area from World  
where area >= 3000000  or  population>= 25000000
;