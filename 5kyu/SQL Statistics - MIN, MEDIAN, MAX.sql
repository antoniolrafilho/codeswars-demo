-- DESCRIPTION:
-- For this challenge you need to create a simple SELECT statement. Your task is to calculate the MIN, MEDIAN and MAX scores of the students from the results table.

-- Tables and relationship below:

-- Resultant table:
-- min
-- median
-- max

-- Create your SELECT statement here
select min(r.score) as min,  percentile_cont(0.5) within group (order by r.score) as median, max(r.score) as max
from student s 
join result r on s.id=r.id