/*-- Problem:
-- Assign ranks to scores in descending order, ensuring tied scores share the same rank.
-- Rankings should be consecutive with no gaps after ties.
 */

SELECT
    score,
    DENSE_RANK() OVER (ORDER BY score DESC) AS 'rank'
FROM
    Scores
ORDER BY
    score DESC;