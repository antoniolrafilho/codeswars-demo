-- DESCRIPTION:
-- Given film_actor and film tables from the DVD Rental sample database find all movies both Sidney Crowe (actor_id = 105) and Salma Nolte (actor_id = 122) cast in together and order the result set alphabetically.

-- film schema
--  Column     | Type                        | Modifiers
-- ------------+-----------------------------+----------
-- title       | character varying(255)      | not null
-- film_id     | smallint                    | not null
-- film_actor schema
--  Column     | Type                        | Modifiers
-- ------------+-----------------------------+----------
-- actor_id    | smallint                    | not null
-- film_id     | smallint                    | not null
-- last_update | timestamp without time zone | not null 
-- actor schema
--  Column     | Type                        | Modifiers
-- ------------+-----------------------------+----------
-- actor_id    | integer                     | not null 
-- first_name  | character varying(45)       | not null
-- last_name   | character varying(45)       | not null
-- last_update | timestamp without time zone | not null 
-- The desired output:

-- title
-- -------------
-- Film Title 1
-- Film Title 2
-- ...
-- title - Film title

-- Replace with your SQL Query
select f.title
from film f
join film_actor fa1 
on f.film_id = fa1.film_id
join film_actor fa2
on f.film_id = fa2.film_id
join actor a1 
on a1.actor_id = fa1.actor_id
join actor a2
on a2.actor_id = fa2.actor_id
where
    a1.actor_id = 105 and a2.actor_id = 122
order by f.title asc