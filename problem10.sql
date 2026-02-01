-- Challenge 10: Update PK Impact
-- Tasks
-- Update dept_id in department table.
-- Observe FK behavior.
-- Explain why PK should not be frequently updated.

select * from department;
select * from employee7;

-- 1]Update dept_id in department table.
update department set dept_id = 3 where dept_id = 2;

-- 2]Observe FK behavior.

-- It gives error cannot delete or update a parent row 
-- first have to update a child row

-- 3]Explain why PK should not be frequently updated.
-- Because it is a unique key  and referneced by the foreign key
