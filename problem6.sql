-- Challenge 6: RIGHT JOIN Scenario
-- Schema
-- trainers(trainer_id PK, trainer_name)
-- batches(batch_id PK, batch_name, trainer_id FK)
-- Tasks
-- Show all batches including those without trainers.
-- Display trainer name if assigned, else NULL.

-- 1] Create table trainers
create table trainers(
trainer_id int primary key ,
trainer_name varchar(70)
);

-- 2]Create table batches
create table batches (
batches_id int primary key ,
batch_name varchar(80),
trainer_id int,
foreign key (trainer_id) references trainers(trainer_id)
);

-- 3]Insert records
INSERT INTO trainers VALUES
(1, 'Rahul'),
(2, 'Anita'),
(3, 'Suresh');

INSERT INTO batches VALUES
(101, 'Java Batch', 1),
(102, 'Python Batch', 2),
(103, 'SQL Batch',Null),
(104, 'Web Batch',Null);

-- 4] Show all batches including those without trainers.
select b.batch_name , t.trainer_name
from trainers t
RIGHT JOIN batches b
on t.trainer_id = b.trainer_id;

-- 5]Display trainer name if assigned, else NULL.
select b.batch_name , t.trainer_name
from trainers t
RIGHT JOIN batches b
on t.trainer_id = b.trainer_id;


