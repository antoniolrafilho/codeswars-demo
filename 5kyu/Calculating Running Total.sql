-- DESCRIPTION:
-- Description
-- Given a posts table that contains a created_at timestamp column write a query that returns date (without time component), a number of posts for a given date and a running (cumulative) total number of posts up until a given date. The resulting set should be ordered chronologically by date.

-- Desired Output
-- The resulting set should look similar to the following:

-- date       | count | total
-- -----------+-------+-------
-- 2017-01-26 |    20 |    20
-- 2017-01-27 |    17 |    37
-- 2017-01-28 |     7 |    44
-- 2017-01-29 |     8 |    52
-- ...
-- date - (DATE) date
-- count - (INT) number of posts for a date
-- total - (INT) a running (cumulative) number of posts up until a date

-- Replace with your SQL query
select cast(created_at as date) as date, count(created_at) as count, cast(sum(count(created_at)) over(order by cast(created_at as date)) as int) as total
from posts
group by date