create database training;
use training;
-- creating table in mysql--
create table customers(
cust_id int,
cust_name varchar(50),
age int,
gender char(1),
city varchar(50)
);

-- insert statement in mysql
insert into customers values (1,'Rakeyshh',30,'M','Pune');
insert into customers values (2,'Rahoul',35,'M','Pune');
insert into customers (cust_id,cust_name,age,gender) values (3,'Geeta',40,'F');   -- insert statment when some values are missing
select * from customers;

-- inserting multiple record in single time
insert into customers values (4,'Pratik',28,'M','Bangalore'),(5,'Nikita',24,'F','Kolhapur'),(6,'Nandni',30,'F','Ahmedabad');

select * from customers;

-- update statement in mysql (whenever updating the data safe mode must be disabled)
set sql_safe_updates=0;
update customers set age=31 where cust_id=6;   -- single entry
update customers set city='Mahad' where cust_id=3;
update customers set age=26, city='Gadhinglaj'where cust_name='Nikita'; -- multiple entries in single statement
select * from customers;

-- delete statement in mysql
delete from customers where cust_id=4;
delete from customers where age>38;
delete from customers where city in ('Ahmedabad','Bangalore');
delete from customers where city not in ('Pune','Gadhinglaj');

select * from customers;

create table product(
prod_id int,
prod_name varchar(50),
amount int
);

insert into product values(100,'Mobile',50000),(101,'Laptop',75000),(102,'Fridge',25000),(103,'Air conditioner',35000),
						  (104,'Sound system',10000),(105,'Sofa set',20000);
                          
select * from product;
update product set prod_name='Home theatre' where prod_id=104;

select * from product;
select * from product where prod_name='Fridge';

delete from product where prod_name='Fridge';
delete from product where prod_id='100';

select * from product;

