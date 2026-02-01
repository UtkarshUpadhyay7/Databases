-- Challenge 12: Online Shopping
-- Schema
-- products(product_id PK, product_name, price)
-- order_items(item_id PK, order_id, product_id FK, quantity)
-- Tasks
-- Display product name + quantity.
-- Find products never ordered.
-- Calculate total price per product.

-- 1]Create a table products
create table  products (
product_id int primary key ,
product_name varchar(80) ,
price double );

-- 2]Create table order items
create table order_items (
item_id int primary key ,
order_id int ,
product_id int ,
quantity int ,
foreign key (product_id) references products(product_id) );

-- 3] Insert the records
INSERT INTO products VALUES (1, 'Laptop', 60000), (2, 'Mobile', 30000), (3, 'Headphones', 2000), (4, 'Keyboard', 1500);

INSERT INTO order_items VALUES (101, 1001, 1, 2), (102, 1001, 3, 1), (103, 1002, 2, 1), (104, 1003, 1, 1);
select * from products;
-- 4]Display product name + quantity.
select p.product_name , o.quantity
from products p
left join order_items o 
on p.product_id = o.product_id  ;

-- 5]Find products never ordered.
select p.product_name 
from products p
left join order_items o 
on p.product_id = o.product_id 
where o.order_id is null;

-- 6] Calculate total price per product.
select sum(p.price * o.quantity) as total_price , p.product_name   
from products p
left join order_items o 
on p.product_id = o.product_id 
group by p.product_name;



