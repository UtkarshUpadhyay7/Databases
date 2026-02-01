-- Challenge 8: Foreign Key Constraint Test
-- Schema
-- department(dept_id PK, dept_name)
-- employee(emp_id PK, emp_name, dept_id FK)
-- Tasks
-- Insert employee with invalid dept_id → observe error.
-- Explain why error occurred.
-- Fix data and re-insert.

-- 1] Create table department
create table department ( 
dept_id int primary key,
dept_name varchar(80) );

-- 2] Create table employee
create table employee7 (
emp_id int primary key ,
emp_name varchar(80) ,
dept_id int ,
foreign key (dept_id) references department(dept_id) );

-- 3] Insert employee with invalid dept_id → observe error

Insert into department values ( 1 , 'HR' ) , ( 2, 'Manager' );
Insert into employee7 values ( 1000 , 'Utkarsh' , 2 );

Insert into employee7 values (1002 , 'Ram ' , 7);
-- 4] Why error occured
-- Here error occurs beacuse there is no department id of 7 in department tables 

-- 5] Fix tables and reinsert 
Insert into employee7 values (1001 , 'Sham' , 2 );

