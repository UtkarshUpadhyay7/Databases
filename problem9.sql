-- Challenge 9: Delete with FK Dependency
-- Using same schema
-- Tasks
-- Try deleting a department having employees.
-- Observe error.
-- Write correct delete logic (delete child rows first).


-- 1]Try deleting a department having employees.
DELETE FROM department WHERE dept_id = 2;

-- 2] Observer error
-- Cannot delete or update a parent row a foreign key constraint fails first we  have to delete child row 

-- 3]Write correct delete logic (delete child rows first).
-- child row delete
DELETE FROM employee7 WHERE dept_id = 2;

-- parent row delete
delete from employee7 where dept_id = 2;

select * from department;
select * from employee7;


