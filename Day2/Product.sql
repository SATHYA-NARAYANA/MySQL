-- database
-- this is used for comments

-- create a database
create database if not exists productdb;

-- deleting my database
drop database if exists productdb;

create database if not exists productdb1;
create database if not exists productdb2;
-- use the database
use productdb;

show tables;

-- DDL (Data Definition Language) create , drop, alter, truncate
-- DML (Data Manipulation Language) insert , delete, update 

-- creating tables inside my database
create table if not exists product_table (
PID int,
pname char(10),
quantity int ,
price decimal(5,2) 
);

-- field/attribute
-- rows/records

-- describe the product table
desc product_table;

-- insert single record
insert into product_table values (100, 'parleG', 20, 100.01);

-- insert multiple records
insert into product_table values (101,'valve', 30, 300.17),(102,'fan',7, 120.49),
(103,'biscuit',100,700.99);

select * from product_table;

delete from product_table where PID=100;

SET SQL_SAFE_UPDATES = 0;








