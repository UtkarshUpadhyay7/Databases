-- Challenge 11: College Placement System
-- Schema
-- students(student_id PK, name)
-- companies(company_id PK, company_name)
-- placements(place_id PK, student_id FK, company_id FK, package)
-- Tasks
-- Show student name + company name + package.
-- Find students not placed.
-- Find company offering highest package.

-- 1] Create table students
create table  student(
student_id int primary key ,
name varchar(80) 
);

-- 2]Create table companies
create table companies(
company_id int primary key ,
company_name varchar(50) );

-- 3] Create table placements
create table placements (
place_id int primary key ,
student_id int ,
company_id int ,
package varchar(30) ,
foreign key (student_id) references student(student_id) ,
foreign key (company_id) references companies(company_id) );

-- 4] Insert  records
INSERT INTO student VALUES (1, 'Amit'), (2, 'Neha'), (3, 'Ravi'),(4, 'Priya'), (5, 'Karan');

INSERT INTO companies VALUES (101, 'Google'), (102, 'Amazon'), (103, 'Microsoft');

INSERT INTO placements VALUES (1001, 1, 101, '4 LPA'),(1002, 2, 102, '3 LPA'), (1003, 3, 101, '6 LPA');

-- 5]Show student name + company name + package.
Select s.name , c.company_name , p.package
from students s
 INNER JOIN placements p ON s.student_id = p.student_id
 INNER JOIN companies c ON p.company_id = c.company_id;
 
 -- 6]Find students not placed.
 SELECT s.name
FROM students s
LEFT JOIN placements p
ON s.student_id = p.student_id
WHERE p.student_id IS NULL;

-- 7]Find company offering highest package.
SELECT c.company_name, p.package
FROM placements p
JOIN companies c
ON p.company_id = c.company_id
ORDER BY p.package DESC
LIMIT 1;




