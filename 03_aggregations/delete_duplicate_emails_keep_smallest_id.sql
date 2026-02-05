-- Problem:
-- Delete duplicate email records from the Person table while keeping
-- only the record with the smallest id for each email.
-- SQL Category: Joins (Self Join), Data Cleaning

-- Table Structure:
-- Person(id, email)

-- Solution:
DELETE p
FROM Person p
JOIN Person w
    ON p.email = w.email
   AND p.id > w.id;
