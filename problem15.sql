-- Challenge 15: Multi-Table Join
-- Using:
-- students
-- courses
-- enrollments
-- Tasks
-- Show student + course.
-- Count students per course.
-- Find courses with zero students.

-- 1]Show student + course.
SELECT s.name AS student_name, c.course_name
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id
JOIN courses c
ON e.course_id = c.course_id;

-- 2]Count students per course.
SELECT c.course_name, COUNT(e.student_id) AS student_count
FROM courses c
LEFT JOIN enrollments e
ON c.course_id = e.course_id
GROUP BY c.course_name;

-- 3]Find courses with zero students.
SELECT c.course_name
FROM courses c
LEFT JOIN enrollments e
ON c.course_id = e.course_id
WHERE e.student_id IS NULL;

