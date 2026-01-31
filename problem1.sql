-- Challenge 1: Student & Course Enrollment
-- Schema
-- students(student_id PK, name, city)
-- courses(course_id PK, course_name)
-- enrollments(enroll_id PK, student_id FK, course_id FK, enroll_date)
-- Tasks
-- Write CREATE TABLE statements with PK & FK.
-- Insert at least 5 students and 3 courses.
-- Write a query to show:
-- Student name + course name
-- Find students not enrolled in any course.

-- 1] Create table students
-- Write CREATE TABLE statements with PK 
create table students (
student_id int primary key ,
name varchar(100) ,
city varchar(80) 
);

-- 2] Create table courses
-- Write CREATE TABLE statements with PK 
create table courses (
course_id int primary key ,
course_name varchar(80)
);

-- 3] Create table enrollments
create table enrollments(
-- Write CREATE TABLE statements with PK & FK.
enroll_id int primary key ,
student_id int  ,
course_id int  ,
enroll_date date,
foreign key (student_id)  references students(student_id) ,
foreign key (course_id )  references courses(course_id)
);

-- 4] Insert record
-- Insert at least 5 students and 3 courses.

Insert into students values(1 , 'Utkarh' , 'Mumbai') , ( 2 , 'Dhanashri' , 'pune' ) , (3 , 'Samiksha' , 'pune' ),
                            (4, 'priyanka' , 'Nagpur' ) , (5, 'Kunal ' , 'Bangalore' ) , (6 , 'Ritesh' , 'Nagpur');
                            
Insert into courses values ( 100 , 'JAVA' ) , ( 101 ,'PYTHON' ) , (102, 'AI/ML');

INSERT INTO enrollments VALUES (1001, 1, 100, '2024-01-10'), (1002, 2, 102, '2024-01-12'),(1003, 3, 101, '2024-01-15'),
                                  (1004, 6, 101, '2024-01-18');


 -- 5] -- Write a query to show:
-- Student name + course name

select s.name , c.course_name 
from  students s
left join  enrollments e
 on  s.student_id = e.student_id
 left join courses c on
 e.course_id = c.course_id;


 

-- 6] -- Find students not enrolled in any course.
select s.name 
from students s
left join enrollments e
on s.student_id = e.student_id
where e.student_id is null;
