create database accountdb;
-- drop database accountdb;
use accountdb;
CREATE TABLE accounts (
name VARCHAR(30),
balance DECIMAL(10,2)
);
INSERT INTO accounts VALUES ('athish', 1000), ('sekhar', 2000);
 SELECT * FROM accounts;
START TRANSACTION;
UPDATE accounts SET balance = balance - 100 WHERE name = 'athish';
UPDATE accounts SET balance = balance + 100 WHERE name = 'sekhar';
COMMIT; 
SELECT * FROM accounts;

START TRANSACTION;
UPDATE accounts SET balance = balance - 100 WHERE name = 'athish';
UPDATE accounts SET balance = balance + 100 WHERE name = 'sekhar';
rollback; -- discards all the transaction 
SELECT * FROM accounts;



-- SET SQL_SAFE_UPDATES = 0;
/*
Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.
Above error may arise
1. When deleting all records from a table with a DELETE FROM query that does not use a WHERE clause, or
2. When fetching a large data set using SELECT query that selects more than 1000 rows, or
3. Updating records with an UPDATE statement that does not use a WHERE clause.
*/

-- ACID property Atomicity consistency Isolation Durability