-- DESCRIPTION:
-- Let's consider a situation where we have three tables:

-- users table:

-- Columns: id, name
-- Primary key: id
-- products table:

-- Columns: id, product_name
-- Primary key: id
-- orders table:

-- Columns: id, user_id, product_id
-- Primary key: id
-- Foreign keys: user_id references users(id), product_id references products(id)
-- In this kata, we need to find the most popular product (i.e., the product that has been ordered the most). In case of a tie in the number of orders, return all most ordered products ordered by product ID in descending order. Include in the result also the total number of orders for that product.

-- GLHF!

-- Desired Output
-- The desired output should look like this:

-- product_id	product_name	count_orders
-- 2	Product2	20
-- 1	Product1	20

-- Substitute with your SQL
select o.product_id, p.product_name, count(o.id) as count_orders 
from users u 
join orders o 
on u.id = o.user_id
join products p
on p.id = o.product_id
group by o.product_id, p.product_name
order by count_orders desc, o.product_id desc
limit 2