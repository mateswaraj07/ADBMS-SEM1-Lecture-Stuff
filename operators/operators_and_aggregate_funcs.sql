-- 19/10/26
-- filtering data from tables
-- where ,select, distinct, and, or, not, in, not in, between, like,
-- limit, is null

-- create database
create database organization;
use organization;

create table employee (Empid int not null primary key,
First_name varchar(25), Last_name varchar(15), 
Gender char, Role varchar(15), Dept varchar(15), Manager_id varchar(10));

desc employee;

insert into employee values(1, 'John', 'Allen', 'M', 'Team Leader', 'Retail', 'M11');
insert into employee values(2, 'Rohit', 'Sharma', 'M', 'Team Leader', 'Finance', 'M12');
insert into employee values(3, 'Ravi', 'Kumar', 'M', 'Manager', 'Retail', 'M13');
insert into employee values(4, 'Aruna', 'Patel', 'F', 'Manager', 'Finance', 'M14');
insert into employee values(5, 'Kirti', 'Rai', 'F', 'President', 'HR', 'M15');

select * from employee;
-- distinct - to get all unique values of the specific column
select distinct dept from employee order by Dept;

select distinct Role from employee order by Role;

-- and operator
select * from employee where role = 'president' and dept = 'HR';
select * from employee where role = 'president' and dept = 'retail';

-- or operator 
select * from employee where role = 'president' or role = 'Team Leader';
select * from employee where role = 'Manager' or dept = 'HR';

-- In operator
select * from employee where role in ('president', 'Manager');
select * from employee where role in ('tester','finance');

-- Not In operator
-- it is constraint to in operator
select * from employee where role not in ('President' , 'Manager');

-- between operator 
alter table employee add column Experience int;
select * from employee;
update employee set Experience= 8 where empid= 1;
update employee set Experience= 5 where empid= 2;
update employee set Experience= 10 where empid= 3;
update employee set Experience= 15 where empid= 4;

select * from employee where Experience between 6 and 10; -- between operator
select * from employee where Experience = 5 or Experience = 10;

-- like operator 
select * from employee where last_name like  'a%';
select * from employee where last_name like  'z%';

-- limit operator 
select * from employee order by experience limit 3;

-- is null 
select * from employee where experience is null;
select * from employee where manager_id is null;

-- is not null 
select * from employee;
select * from employee where experience is not null;

-- 21/10/26
-- Aggregate Functions
-- COUNT, SUM, AVG, MIN, MAX

-- COUNT()
select count(*) from employee;
select count(*) from employee where dept="Finance";
select count(empid) from employee where role="Team Leader";

-- MIN()
select MIN(Experience) from employee;

-- MAX()
select MAX(Experience) from employee;

-- SUM()
select SUM(Experience) from employee;

-- AVG()
select AVG(Experience) as emp_exr from employee;

select * FROM employee;

/* GROUP BY Clause - It divides a set of rows into subgroups depending on column or expression values.
It is used with aggregate functions */

-- Find dept wise employee count
select dept, count(*) as emp_count from employee group by dept;

-- Find role wise employee count
select role, count(*) as emp_count from employee group by role;

-- Find gender wise employee count
select gender, count(*) as emp_count from employee group by gender;

/* HAVING CLAUSE - Each group produced by GROUP BY clause is evaluated by the HAVING CLAUSE, and if
result is true, the row is included in the result set.
it was added to SQL because the where keyword cannot be used with aggregate functions*/

select dept, sum(Experience) as total_Exp from employee group by dept having total_Exp>=10 and total_Exp <=20;

select role,sum(experience) as total_exprience from employee group by role having total_exprience >=10 and total_exprience <= 20;

/* Fetch dept wise employee count using having clause and sort the data*/
select dept, count(Empid) from employee group by dept having count(Empid)>1 order by count(Empid) desc;
select * from employee;

select dept, sum(Experience) as total_Exp from employee group by dept having total_Exp>=10 or total_Exp <=30;