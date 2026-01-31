-- Challenge 5: LEFT JOIN Logic Test
-- Using same schema
-- Tasks
-- Show all customers even if no order exists.
-- Identify customers with NULL orders.
-- Count orders per customer.

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

-- 1]Show all customers even if no order exists.
select distinct c.customer_name 
from customers c
left join orders o 
on o.customer_id = c.customer_id;

-- 2]Identify customers with NULL orders.
select distinct c.customer_name 
from customers c
left join orders o 
on o.customer_id = c.customer_id
where o.order_id is null;

-- 3]Count orders per customer.
select  c.customer_name ,count(o.order_id) 
from customers c
left join orders o 
on o.customer_id = c.customer_id
group by c.customer_name;
