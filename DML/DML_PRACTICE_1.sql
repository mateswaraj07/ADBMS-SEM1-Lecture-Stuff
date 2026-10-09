create database college;
use college;
show databases;
create table Employees(EmpID int, FirstName varchar(10), LastName varchar(10), EmpAge int, Empzone varchar(10));
desc Employees;
insert into Employees values(1,'Swaraj','Mate',21,'EAST');
select * from Employees;
ALTER TABLE Employees MODIFY LastName VARCHAR(20);
insert into Employees values(2,'Shreepad','Suryavanshi',20,'WEST'),
							(3,'Om','Malusare',22,'NORTH'),
                            (3,NULL,'Malusare',23,'NORTH'),
                            (2,'Shreepad',NULL,24,NULL);

insert into Employees(EmpID, FirstName, LastName) values(4,'Vaibhav','Patil'),
														(5,NULL,'Garg');
select * from Employees;

update Employees set FirstName='Sneha' where EmpAge=23;
update Employees set LastName='Maileshwar' where EmpAge=24;
select * from Employees;
update Employees set EmpAge=25, Empzone='SOUTH' where EmpID=4;
insert into Employees values(6,NULL,'Potdar',26,'NORTH');
update Employees set FirstName='Harshita' Where EmpID=6;
delete from Employees where EmpID=5;
select * from Employees;

truncate table Employees;
select * from Employees;
drop table Employees;

-- =================================================================================================================
drop database companydb;
create database company_db;
use company_db;
create table Employees(EmpID int NOT NULL, FirstName varchar(15), LastName varchar(15), EmpAge int);
desc Employees;
-- insert into Employees values(null,'Swaraj','Mate',21); -- gives error because of not null constraint
insert into Employees values(1,'Swaraj','Mate',21);
insert into Employees values(2,Null,Null,20);

create table Employee1(EmpID int NOT NULL, FirstName varchar(15), LastName varchar(15), unique(EmpID));
desc Employee1;
-- insert into Employee1 values(null,'Ravi','Kumar'); -- gives error
insert into Employee1 values(1,'Ravi','Kumar');
-- insert into Employee1 values(1,'Ravi','Kumar'); -- duplicate entry will give error
insert into Employee1 values(2,'Ravi','Kumar');
select * from Employee1;
desc Employee1;

create table Employee3(EmpID int NOT NULL, FirstName varchar(15), LastName varchar(15), EmpAge int, Check(EmpAge>20));
desc Employee3;
-- insert into Employee3 values(1,'Geeta','Kumari',15); -- gives error (age>20)
-- insert into Employee3 values(1,'Geeta','Kumari',20); -- gives error(age>20)
insert into Employee3 values(1,'Geeta','Kumari',21);
select * from Employee3;

Alter table Employee3 Add column Salary int;
Alter table Employee3 Add check(Salary>=5000);

-- Alter table Employee3 Add column Salary int, add check(Salary>=5000);
desc Employee3;
-- update Employee3 set Salary=4000 where EmpID=1; -- gives error (Salary>=5000)
update Employee3 set Salary=6000 where EmpID=1;
select * from Employee3;

create table Employee4(EmpID int PRIMARY KEY, FirstName varchar(15), LastName varchar(15), EmpAge int);
-- insert into Employee4 values(null,'ram','kumar',20); -- gives error PK NOT NULL
ALTER TABLE Employee4 ADD Column Salary int;
-- TO allow naming and defining a check constraint on multiple columns
Alter Table Employee4 add constraint chk_EmpAge_Salary check(EmpAge>20 AND Salary>=5000);
desc Employee4;
-- insert into Employee4 values(2,'geet','gore',14,4000); -- gives error bcoz salary>=5000, age>20
insert into Employee4 values(2,'geet','gore',21,5000);
select * from Employee4;

Alter table Employee4 drop check chk_EmpAge_Salary; 
SHOW CREATE TABLE Employee4;
insert into Employee4 values(5, 'anushka','naik',10,1000);
select * from Employee4;


-- ALTER TABLE Employee4 DROP CHECK chk_EmpAge_Salary;
-- ALTER TABLE Employee4
-- ADD CONSTRAINT chk_EmpAge CHECK(EmpAge > 20);

-- ALTER TABLE Employee4
-- ADD CONSTRAINT chk_Salary CHECK(Salary >= 5000);

-- DESC Employee4;

-- INSERT INTO Employee4 VALUES(3,'anushka','naik',21,5000);

-- SELECT * FROM Employee4;

-- ALTER TABLE Employee4 DROP CHECK chk_EmpAge;

-- INSERT INTO Employee4 VALUES(4,'priya','shah',10,5000);

-- SELECT * FROM Employee4;

-- ALTER TABLE Employee4 DROP CHECK chk_Salary;

-- INSERT INTO Employee4 VALUES(5,'anushka','naik',10,1000);

-- SELECT * FROM Employee4;
DELETE FROM Employee4
WHERE EmpAge <= 20 OR Salary < 5000;

ALTER TABLE Employee4
ADD CONSTRAINT chk_EmpAge CHECK(EmpAge > 20);

ALTER TABLE Employee4
ADD CONSTRAINT chk_Salary CHECK(Salary >= 5000);

SELECT * FROM Employee4;

-- Test Age constraint
-- INSERT INTO Employee4 VALUES(6,'rahul','patil',20,5000);

-- Test Salary constraint
-- INSERT INTO Employee4 VALUES(7,'priya','shah',25,4000);

-- Remove Age constraint
ALTER TABLE Employee4 DROP CHECK chk_EmpAge;

-- Age can now be any value
INSERT INTO Employee4 VALUES(6,'rahul','patil',20,5000);

-- Remove Salary constraint
ALTER TABLE Employee4 DROP CHECK chk_Salary;

-- Salary can now be any value
INSERT INTO Employee4 VALUES(7,'priya','shah',20,4000);

SELECT * FROM Employee4;

create table Employee5(EmpID int NOT NULL, FirstName varchar(15), LastName varchar(15), EmpAge int, EmpDept varchar(10) default 'Operations');
insert into Employee5(EmpID, FirstName, LastName, EmpAge) values(2,'kirti','giri',21);
-- insert into Employee5(EmpID, FirstName, LastName, EmpAge, EmpDept) values(3,'kirti','giri',21); -- error
select * from Employee5;
-- ================================================================ 9/10/26=====================================================================
use company_db;
create table Employee7 (EmpID int Primary Key, FirstName varchar(20), LastName varchar(20), EmpAge int, Salary int);
desc Employee7;
-- alter table Employee7 add check(Salary>=5000); -- defining check constraint on single column
Alter table Employee7 add constraint chk_EmpAge_Salary check (EmpAge>20 AND Salary >=5000); -- to allow naming and defining  check constraint on multiple columns
 desc Employee7;
show create table Employee7; -- to check table details and constraints applied on the table.
-- insert into Employee7 values(1,'Swaraj','Mate',20,6000); -- gives error salary>=5000
insert into Employee7 values(1,'Swaraj','Mate',21,6000);
select * from Employee7;
Alter table Employee7 Drop Check chk_EmpAge_Salary;
show create table Employee7;
alter table Employee7 add check(Salary>=5000);
-- insert into Employee7 values(1,'Shreepad','Suryawanshi',20,6000); -- gives error salary>=5000
insert into Employee7 values(2,'Shreepad','Suryawanshi',22,6000);
select * from Employee7;
show create table Employee7;
Alter table Employee7 Drop Check employee7_chk_1;
-- index
select * from Employee7;
create index DemoIndex on Employee7(FirstName); -- single column
show indexes from Employee7;
create index DemoIndex2 on Employee7(FirstName,LastName);
show indexes from Employee7;

Drop index DemoIndex on Employee7; 
Drop index DemoIndex2 on Employee7;

