-- Problem:
-- Classify each node in the Tree table as 'Root', 'Inner', or 'Leaf'.
-- A node is 'Root' if its parent is NULL, 'Leaf' if it has no children,
-- and 'Inner' if it has both a parent and at least one child.
-- SQL Category: Conditional Logic (CASE), Subqueries

-- Table Structure:
-- Tree(id, p_id)

-- Solution:
SELECT
    id,
    CASE
        WHEN p_id IS NULL THEN 'Root'
        WHEN id IN (SELECT p_id FROM Tree WHERE p_id IS NOT NULL) THEN 'Inner'
        ELSE 'Leaf'
    END AS type
FROM Tree;
