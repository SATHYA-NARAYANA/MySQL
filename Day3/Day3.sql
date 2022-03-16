/* 
A MySQL database server contains many databases (or schemas). 
Each database consists of one or more tables.
A table is made up of columns (or fields) and rows (records).
The SQL keywords and commands are NOT case-sensitive.
For clarity,they are shown in uppercase. 
The names or identifiers (database names, table names, column names, etc.)
are case-sensitive in some systems, but not in other systems.
 Hence, it is best to treat identifiers as case-sensitive.
*/
-- the comments
/*    multi
      line
      comments   */


/* -- Database-Level
DROP DATABASE databaseName -- Delete the database (irrecoverable!)
DROP DATABASE IF EXISTS databaseName --> Delete if it exists
CREATE DATABASE databaseName --> Create a new database
CREATE DATABASE IF NOT EXISTS databaseName --> Create only if it does not exists
SHOW DATABASES --> Show all the databases in this server
USE databaseName --> Set the default (current) database
SELECT DATABASE() --> Show the default database
*/

create database if not exists productdb;
use productdb;
-- drop database if exists productdb;
show tables;

/*
-- Table-Level
DROP TABLE [IF EXISTS] tableName 
CREATE TABLE [IF NOT EXISTS] tableName (
columnName columnType columnAttribute, ...
PRIMARY KEY(columnName),
FOREIGN KEY (columnName) REFERENCES tableName (columnName)
)
SHOW TABLES --> Show all the tables in the default database
DESCRIBE|DESC tableName --> Describe the details for a table
ALTER TABLE tableName ... --> Modify a table, e.g., ADD COLUMN and DROP COLUMN
ALTER TABLE tableName ADD columnDefinition
ALTER TABLE tableName DROP columnName
ALTER TABLE tableName ADD FOREIGN KEY (columnName) REFERENCES tableName (columnName)
ALTER TABLE tableName DROP FOREIGN KEY constraintName
 */
 -- not null and unique
 -- unsigned - non-negetive value
 
 create table if not exists products (
 productid int unsigned auto_increment ,
 producttype varchar(10) not null default '',
 productname varchar(10) not null default '',
 quantity int not null default 1,
 price decimal(7,2) not null default 99999.99,
 primary key (productid)
 );

-- 1
 INSERT INTO products VALUES (100, 'earphone', 'Realme', 5, 1500.25);
-- 2
  INSERT INTO products VALUES
(NULL, 'earphone', 'Boat', 5, 1500.25),
(NULL, 'speaker', 'JBL', 8, 5000.25),
(NULL, 'speaker', 'Bose', 20, 10000.99);

-- 3
insert into products (producttype,productname) values ('speaker','sony');

SELECT * FROM products;
delete from products where productid = 106;

select productid,quantity from products;

-- You can also issue SELECT without a table. 
-- you can SELECT an expression or evaluate a built-in function.
select now();
select 600+456;

-- CRUD 

select * from products where productname= 'realme';

select * from products where productname like '%e%';

select * from products;


/*Comparison Operators
For numbers (INT, DECIMAL, FLOAT), you could use comparison operators: '=' (equal to), '<>' or '!=' (not equal to), '>' (greater
than), '<' (less than), '>=' (greater than or equal to), '<=' (less than or equal to), to compare two numbers. 
*/

/*
String Pattern Matching - LIKE and NOT LIKE
For strings, in addition to full matching using operators like '=' and '<>',
 we can perform pattern matching using operator LIKE (or NOT LIKE) with wildcard characters.
The wildcard '_' matches any single character; '%' matches any number of characters (including zero).
For example,
'abc%' matches strings beginning with 'abc';
'%xyz' matches strings ending with 'xyz';
'%aaa%' matches strings containing 'aaa';
'___' matches strings containing exactly three characters; and
'a_b%' matches strings beginning with 'a', followed by any single character, followed by 'b', followed by zero or more
characters.
*/
/*
Logical Operators - AND, OR, NOT, XOR
You can combine multiple conditions with boolean operators AND, OR, XOR.
 You can also invert a condition using operator NOT 
*/

select * from products where productname like '%e%' and quantity > 5 and price> 40000;
select * from products where productname like '%e%' or quantity > 8;
-- between
select price as p from products where ( p between 1500 and 5000);

select * from products where producttype is not null;

-- in ~ or 
select * from products where productname in ('realme','boat','jbl');
-- alias
select price as p from products order by p;



/*
ORDER BY Clause
You can order the rows selected using ORDER BY clause, with the following syntax:
SELECT ... FROM tableName
WHERE criteria
ORDER BY columnA ASC|DESC, ...
The selected row will be ordered according to the values in columnA,
 in either ascending (ASC) (default) or descending (DESC) order.
*/
/*
GROUP BY Clause
The GROUP BY clause allows you to collapse multiple records with a common value into groups. 
GROUP BY by itself is not meaningful. It is used together with GROUP BY aggregate functions (such as COUNT(), AVG(), SUM()) to
produce group summary.
GROUP BY Aggregate Functions: COUNT, MAX, MIN, AVG, SUM
We can apply GROUP BY Aggregate functions to each group to produce group summary report.
The function COUNT(*) returns the rows selected; COUNT(columnName) 
counts only the non-NULL values of the given column. 

HAVING is similar to WHERE, but it can operate on the GROUP BY aggregate functions; whereas WHERE operates only on columns.

*/
