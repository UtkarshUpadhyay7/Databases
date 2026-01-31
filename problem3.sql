-- Challenge 3: Orders & Customers
-- Schema
-- customers(customer_id PK, customer_name, city)
-- orders(order_id PK, order_date, amount, customer_id FK)
-- Tasks
-- Write schema.
-- Display customer name + order amount.
-- Find customers who never placed any order.
-- Show city-wise total order amount.

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

-- 4]Display customer name + order amount.
select c.customer_name , o.amount
from customers c
left join orders o
on o.customer_id = c.customer_id;

-- 5] Find customers who never placed any order.
select c.customer_name 
from customers c
left join orders o
on o.customer_id = c.customer_id
where o.order_id is null;

-- 6]Show city-wise total order amount.
select c.city , sum(o.amount) as total
from customers c
left join orders o
on c.customer_id = o.customer_id
group by c.city;



