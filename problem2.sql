-- Challenge 2: Company & Employees
-- Schema
-- company(company_id PK, company_name)
-- employee(emp_id PK, emp_name, salary, company_id FK)
-- Tasks
-- Design schema with PK & FK.
-- List employees working in each company.
-- Find companies with no employees.
-- Show company name + total salary paid.

-- 1] Create table company
-- Design schema with PK & FK.
create table company(
company_id int primary key ,
company_name varchar(100) 
);

-- 2]Create table employee
-- Design schema with PK & FK.
create table employee(
emp_id int primary key,
emp_name varchar(100),
salary double,
company_id int ,
Foreign key (company_id) references  company(company_id)
);


-- 3] Insert record
INSERT INTO company VALUES (1, 'Google'), (2, 'Microsoft'), (3, 'Amazon'),(4, 'StartupX');

INSERT INTO employee VALUES
(101, 'Utkarsh', 70000, 1),
(102, 'Priyanka', 80000, 1),
(103, 'Samiksha', 65000, 2),
(104, 'Dhanashri', 90000, 3);

-- 4]List employees working in each company.
select e.emp_name , c.company_name  
from company c
Right join employee e
on e.company_id = c.company_id;

-- 5]Find companies with no employees.
select  c.company_name  
from company c
left join employee e
on e.company_id = c.company_id
where e.emp_id is null;

-- 6] Show company name + total salary paid.
select c.company_name , sum(e.salary) as total
from company c
left join employee e
on e.company_id = c.company_id
group by c.company_name;  

-- Note : Always use group by clause  with aggregate function