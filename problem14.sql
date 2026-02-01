-- Challenge 14: Employee & Manager (Self-Join)
-- Schema
-- employee(emp_id PK, emp_name, manager_id)
-- Tasks
-- Show employee name + manager name.
-- Identify employees without managers.

-- 1]Create table employee
create table employee_new(
emp_id int primary key ,
emp_name varchar(30),
manager_id int );

-- 2] Insert records
INSERT INTO employee_new VALUES (1, 'Ram', NULL), (2, 'priti', 1), (3, 'kalyani', 1), (4, 'kartik', 2),(5, 'soham', 2),(6, 'sejal', 3);

-- 3]Show employee name + manager name.

SELECT e1.emp_name AS employee_name, e2.emp_name AS manager_name 
FROM employee_new e1
LEFT JOIN employee_new e2
ON e1.manager_id = e2.emp_id;

-- 4]Identify employees without managers.
SELECT emp_name
FROM employee_new
WHERE manager_id IS NULL;


