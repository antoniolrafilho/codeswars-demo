-- DESCRIPTION:
-- For this challenge you need to create a RECURSIVE Hierarchical query. You have a table employees of employees, you must order each employee by level. You must use a WITH statement and name it employee_levels after that has been defined you must select from it.

-- A Level is in correlation what manager managers the employee. e.g. an employee with a manager_id of NULL is at level 1 and then direct employees with the employee at level 1 will be level 2.

-- employees table schema
-- id
-- first_name
-- last_name
-- manager_id (can be NULL)
-- resultant schema
-- level
-- id
-- first_name
-- last_name
-- manager_id (can be NULL)
-- NOTE: refer to the Results: expected table if you're stuck with how it should be displayed.

-- Create your SELECT statement here
with recursive employee_levels as(
  select 
  1 as level, id, first_name, last_name, manager_id
from 
  employees 
where manager_id is null
  
union 

select 
  el.level + 1 as level, e.id, e.first_name, e.last_name, e.manager_id
  from 
  employees e
  
  inner join employee_levels el
    on el.id = e.manager_id
)
  
select * 
from employee_levels
order by level asc
  