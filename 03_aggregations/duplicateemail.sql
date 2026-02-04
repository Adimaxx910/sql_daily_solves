-- Problem:
-- Given a Person table containing unique IDs and email addresses,
-- identify all email values that appear more than once.

-- Table Structure:
-- Person
-- +----+---------+
-- | id | email   |
-- +----+---------+

-- SQL Category: Aggregations (GROUP BY, HAVING)

-- Solution:
SELECT email
FROM Person
GROUP BY email
HAVING COUNT(email) > 1;
