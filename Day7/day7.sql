create database if not exists rentaldb;
-- drop database rentaldb;
use rentaldb;

create table car(
cid varchar(10) not null,
ccat enum('four', 'six') not null default 'four',
rate decimal(7,2) ,
primary key(cid)
);

create table customer(
cusid int not null auto_increment,
cusname varchar(25) not null,
contact varchar(12) not null ,
primary key (cusid)
);

create table rental(
slno int unsigned not null auto_increment,
cid varchar(10) not null,
cusid int not null ,
bookingdate date not null default '0000-00-00',
-- bookingtime time not null default '00:00:00',
primary key(slno),
foreign key(cid) references car(cid),
foreign key(cusid) references customer(cusid)
);
desc car;
desc customer;
desc rental;

insert into car values
('c1','four',500.99),
('c2','six',1000.99),
('tata02','four',1000.21),
('balleno','four',500);

insert into customer values
(100,'daya',987654321),
(null,'athish','9988776655'),
(null,'gargi','1122334455'),
(null,"Tejashri",8888888888),
(null,'nikhil','13245678910') ;

insert into rental values
(1,'c1',100,'2022-03-11'),
(null,'c2',101,'2022-03-13'),
(null,'tata02',102,'2022-03-15'),
(null,'c1',104,'2022-04-23'),
(null,'balleno',103,'2022-06-20'),
(null,'c2',102,'2022-01-01'),
(null,'tata02',103,'2022-06-12');

select * from car;
select * from customer;
select * from rental;

select 
c.cid as 'Car ID',
c.ccat as 'Car Type',
cu.cusid as 'Customer ID',
cu.cusname as 'Name',
r.bookingdate as 'Booking Date'
from rental as r
inner join car as c
inner join customer as cu;





-- stored procedure























