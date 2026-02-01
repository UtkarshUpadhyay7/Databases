-- Challenge 13: Banking System
-- Schema
-- accounts(account_id PK, holder_name)
-- transactions(txn_id PK, account_id FK, amount, txn_type)
-- Tasks
-- Show account holder + transaction amount.
-- Find accounts with no transactions.
-- Calculate total credit & debit per account.

-- 1] Create the table 
create table accounts (
account_id int primary key ,
holder_name varchar(80) );

-- 2]Create table transactions
create table transactions (
txn_id int primary key ,
account_id int ,
amount double ,
txn_type varchar(30) ,
foreign key (account_id) references accounts(account_id) );

-- 3] Insert records
INSERT INTO accounts VALUES(1, 'Utkarsh'),(2, 'Neha'),(3, 'Amit'), (4, 'Ravi');

INSERT INTO transactions VALUES(101, 1, 5000, 'CREDIT'),(102, 1, 2000, 'DEBIT'),(103, 2, 7000, 'CREDIT'), (104, 3, 3000, 'DEBIT');

-- 4]Show account holder + transaction amount.
select  a.holder_name, t.amount
from accounts a
right join transactions t 
on t.account_id = a.account_id 
where txn_type = 'credit';

-- 5]Find accounts with no transactions.
SELECT a.holder_name
FROM accounts a
LEFT JOIN transactions t
ON a.account_id = t.account_id
WHERE t.txn_id IS NULL;

-- 6]Calculate total credit & debit per account.
SELECT a.holder_name,
       SUM( t.txn_type = 'CREDIT' ) AS total_credit,
       SUM(t.txn_type = 'DEBIT' ) AS total_debit
FROM accounts a
LEFT JOIN transactions t
ON a.account_id = t.account_id
GROUP BY a.holder_name;


