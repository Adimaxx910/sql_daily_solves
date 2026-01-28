-- Problem:
-- Retrieve the first name, last name, city, and state for each person.
-- If a person does not have a matching address record, return NULL values.
-- SQL Category: Joins (LEFT JOIN)


select firstName ,lastName ,a.city ,a.state 
from Person p
left join Address a on 
p.personId = a.personId ;