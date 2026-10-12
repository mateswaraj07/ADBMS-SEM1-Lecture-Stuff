-- drop database TCL;
create database TCL;
use TCL;
Create table orders(order_id INT PRIMARY KEY, customer_name VARCHAR(100), status VARCHAR(50));
desc orders;
-- Start the transaction --
set autocommit=0; /* in mysql auto commit mode is enabled by default which means whenever we execute any sql statement is automatically */
/* so in such cases succeded transactions ae automatically commited.
to disable the auto commit mode we are using this
also we cannot disable the auto commit mode of DDL Commands
In many DBMS it is disabled automatically*/

begin;

insert into orders values(101,'Geet','Pending'),(102,'Bob','Pending');
truncate table orders;
select * from orders;
rollback;
commit;

-- for commit
insert into orders values(101,'Alice','Pending'),(102,'Bob','Pending');
select * from orders;
commit;
select * from orders;
update orders set customer_name="Raj" where order_id=102;
rollback;
select * from orders;
select * from orders;

-- Step 1: Insert few orders
insert into orders values(103,'Om','Pending'),(104,'Sahil','Pending');
savepoint sp1;
select * from orders;

-- Step 2: Update one order
update orders set status='Shipped' where order_id=103;
select * from orders;
savepoint sp2;
rollback to savepoint sp1;
select * from orders;

-- Step3:delete another order
Delete from orders where order_id=102;
savepoint sp3;

-- We want to undo the delete but keep the update
rollback to savepoint sp1;
select * from orders;
rollback;
commit;