-- Problem:
-- Identify tweet IDs where the content length exceeds 15 characters.
-- This helps detect tweets that violate the platform’s character length rules.


# Write your MySQL query statement below
select tweet_id from Tweets
where length(content) >15;