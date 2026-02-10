-- Problem:
-- Calculate the sum of tiv_2016 for insurance records that meet both conditions:
-- 1) The tiv_2015 value appears more than once.
-- 2) The geographic location (lat, lon) is unique.
-- SQL Category: CTEs, Aggregations, Joins, Subqueries

-- Table Structure:
-- Insurance(pid, tiv_2015, tiv_2016, lat, lon)

-- Solution:
WITH uniquelocation AS (
    SELECT
        pid,
        tiv_2015,
        lat,
        lon
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1
)
SELECT
    ROUND(SUM(i.tiv_2016), 2) AS tiv_2016
FROM Insurance i
JOIN uniquelocation u
    ON i.pid = u.pid
WHERE i.tiv_2015 IN (
    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
);
