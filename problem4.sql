-- Challenge 4: INNER JOIN Practice
-- Using customers and orders
-- Tasks
-- Show only customers who placed orders.
-- Display order_id, customer_name, amount.
-- Filter orders above ₹5000.

-- 1]Create the table
create table customers( 
customer_id int primary key , 
customer_name varchar(100) ,
city varchar(80)
);

-- 2] Create table orders
create table  orders(
order_id int primary key ,
order_date date ,
amount double,
customer_id int ,
foreign key (customer_id) references customers(customer_id));

-- 3] Insert records
INSERT INTO customers VALUES
(1, 'Amit', 'Delhi'),
(2, 'Neha', 'Mumbai'),
(3, 'Ravi', 'Pune'),
(4, 'Priya', 'Delhi'),
(5, 'Karan', 'Mumbai');

INSERT INTO orders VALUES
(101, '2024-02-01', 5000, 1),
(102, '2024-02-03', 7000, 2),
(103, '2024-02-05', 3000, 1),
(104, '2024-02-07', 9000, 3);

-- 1]Show only customers who placed orders.
select  distinct c.customer_name 
from customers c
INNER JOIN orders o
on o.customer_id = c.customer_id
where o.order_id >= 1;

-- 2]Display order_id, customer_name, amount.
select o.order_id , c.customer_name , o.amount
from customers c
INNER JOIN orders o 
on o.customer_id = c.customer_id;

-- 3]Filter orders above ₹5000. 
select o.order_id , c.customer_name , o.amount
from customers c
INNER JOIN orders o 
on o.customer_id = c.customer_id
where o.amount > 5000;