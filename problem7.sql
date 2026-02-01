-- Challenge 7: FULL JOIN Equivalent 
-- Using students and enrollments
-- Tasks
-- Show:
-- Students with enrollment
-- Students without enrollment
-- (Use LEFT JOIN + UNION + RIGHT JOIN logic)

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
-- 4]students with enrollment
SELECT s.student_id, s.name, e.course_id
FROM students s
INNER JOIN enrollments e
ON s.student_id = e.student_id;

-- 5]Students without enrollment
SELECT s.student_id, s.name, NULL AS course_id
FROM students s
LEFT JOIN enrollments e
ON s.student_id = e.student_id
WHERE e.student_id IS NULL;

-- 6](Use LEFT JOIN + UNION + RIGHT JOIN logic)
SELECT s.student_id, s.name, e.course_id
FROM students s
LEFT JOIN enrollments e
ON s.student_id = e.student_id
UNION
SELECT s.student_id, s.name, e.course_id
FROM students s
RIGHT JOIN enrollments e
ON s.student_id = e.student_id;


