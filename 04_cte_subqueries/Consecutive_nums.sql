-- Problem:
-- Identify numbers that appear at least three times consecutively in the Logs table.
-- SQL Category: Window Functions

with CTEtable as(
    select id ,num ,
    Lag(num) over(order by id )as previous_num ,
    Lead(num) over(order by id) as next_num
    from Logs
)
select distinct num as ConsecutiveNums  from Befandprev 
where previous_num = num and next_num = num ;
