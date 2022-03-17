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

/*Primary Key
In the relational model, a table shall not contain duplicate rows, because that would create ambiguity in retrieval. To ensure
uniqueness, each table should have a column (or a set of columns), called primary key, that uniquely identifies every record of the
table. For example, an unique number customerID can be used as the primary key for the customers table; productCode for
products table; isbn for books table. A primary key is called a simple key if it is a single column; it is called a composite key if it is
made up of several columns. Most RDBMSs build an index on the primary key to facilitate fast search. The primary key is often used to
relate to other tables.

-- pk - key that can uniquely identify the records
-- fk- it refers to the pk of another table

A foreign key of a child table is used to reference the parent table. Foreign key constraint can be imposed to ensure so-called
referential integrity - values in the child table must be valid values in the parent table.
We define the foreign key when defining the child table, which references a parent table
*/

create table customers (
customerid int unsigned not null auto_increment,
customername varchar(25) not null default '',
location varchar(15) not null default '',
primary key (customerid)
);
show tables;
desc customers;

-- alter
alter table customers add column productid int unsigned not null;

alter table customers add foreign key (productid) references products(productid);

select * from products;
select * from customers;

insert into customers values
(1000,'Gargi','Kolkata',100),
(Null,'umang','hyderabad',101),
(null,'athish','karnataka',102),
(NULL,'Tejashri','Maharashtra',100),
(null,'Madhu','Andhra',102),
(NULL, 'vamshi', 'Telangana', 100),
(NULL,'Vaibhav','Mirzapur', 102),
(NULL,'Kalpesh','Maharashtra',101),
(null,'neeraj','haryana',100),
(null,'Khaleel','Tamilnadu',102);
-- truncate table customers;

update customers set customername='Asha' where customerid=1000;

select * from products; -- t1
select * from customers; -- t2

select t1.productid,t1.productname, t1.producttype, t1.quantity, t1.price,
t2.customerid, t2.customername,t2.location 
from products as t1 inner join customers as t2 
on t1.productid= t2.productid;

-- select * from table1 inner join table2 condition

select t1.productid,t1.productname, t1.producttype, t1.quantity, t1.price,
t2.customerid, t2.customername,t2.location 
from products as t1 left join customers as t2 
on t1.productid= t2.productid;

select t1.productid,t1.productname, t1.producttype, t1.quantity, t1.price,
t2.customerid, t2.customername,t2.location 
from products as t1 right join customers as t2 
on t1.productid= t2.productid;
-- cross join + conditions
select * from products cross join customers;

select * from products where productname like 'b%' order by quantity desc;
-- limit
-- offset
-- (3,2) --> (offset, limit)
select * from products order by quantity limit 3,2;

select price from products;
-- distinct
select distinct price from products;

-- group by
select * from products group by producttype;

-- aggregate fun count() avg , min , max
select count(*) from products;
select producttype, count(*) from products group by producttype;
select max(price), min(price) from products;

select count(*) as count , producttype from products group by producttype having count >5 ;




