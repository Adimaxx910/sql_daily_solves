-- Problem:
-- Retrieve the names of customers who were not referred by customer with ID 2
-- or who were not referred by any customer at all.


# Write your MySQL query statement below

select name from Customer 
where referee_id !=2 or referee_id is null;