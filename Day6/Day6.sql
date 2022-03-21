/*
Indexes (or Keys) can be created on selected column(s) to facilitate fast search. Without index, a "SELECT * FROM products WHERE
productID=x" needs to match with the productID column of all the records in the products table. If productID column is indexed
(e.g., using a binary tree), the matching can be greatly improved (via the binary tree search).

You should index columns which are frequently used in the WHERE clause; and as JOIN columns.
The drawback about indexing is cost and space. Building and maintaining indexes require computations and memory spaces. Indexes
facilitate fast search but deplete the performance on modifying the table (INSERT/UPDATE/DELETE), and need to be justified.
Nevertheless, relational databases are typically optimized for queries and retrievals, but NOT for updates.

In MySQL, the keyword KEY is synonym to INDEX.
In MySQL, indexes can be built on:
1. a single column (column-index)
2. a set of columns (concatenated-index)
3. on unique-value column (UNIQUE INDEX or UNIQUE KEY)
4. on a prefix of a column for strings (VARCHAR or CHAR), e.g., first 5 characters.


There can be more than one indexes in a table. Index are automatically built on the primary-key column(s).
You can build index via CREATE TABLE, CREATE INDEX or ALTER TABLE.
CREATE TABLE tableName (
......
[UNIQUE] INDEX|KEY indexName (columnName, ...),
-- The optional keyword UNIQUE ensures that all values in this column are distinct
-- KEY is synonym to INDEX
......
PRIMAY KEY (columnName, ...) -- Index automatically built on PRIMARY KEY column
);
CREATE [UNIQUE] INDEX indexName ON tableName(columnName, ...);
ALTER TABLE tableName ADD UNIQUE|INDEX|PRIMARY KEY indexName (columnName, ...)
SHOW INDEX FROM tableName;
*/
create database empdb;
use empdb;
CREATE TABLE employees (
emp_no INT UNSIGNED NOT NULL AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
gender ENUM ('M','F') NOT NULL,
birth_date DATE NOT NULL,
hire_date DATE NOT NULL,
PRIMARY KEY (emp_no) -- Index built automatically on primary-key column
);
DESCRIBE employees;
 SHOW INDEX FROM employees;
 
 /*
 
 */
 CREATE TABLE departments (
dept_no CHAR(4) NOT NULL,
dept_name VARCHAR(40) NOT NULL,
PRIMARY KEY (dept_no), -- Index built automatically on primary-key column
UNIQUE INDEX (dept_name) -- Build INDEX on this unique-value column
);

DESCRIBE departments;
SHOW INDEX FROM departments;


show databases;
use productdb;
select * from products;
select avg(price) from products;

-- subquery
select productname from products where price > (select avg(price) from products);

-- view

/*
A view is a database object that has no values.
 Its contents are based on the base table.
 It contains rows and columns similar to the real table.
 In MySQL, the View is a virtual table created by a query by joining one or more tables.
 It is operated similarly to the base table but does not contain any data of its own.
 The View and table have one main difference that the views are definitions built on top of other tables (or views). 
 If any changes occur in the underlying table, the same changes reflected in the View also.
*/

CREATE VIEW Bose_Products AS
SELECT productid,producttype,productname 
FROM Products
WHERE productname = 'Bose';

select * from Bose_Products;
 

 