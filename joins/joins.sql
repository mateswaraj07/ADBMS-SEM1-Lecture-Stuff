/*Basics of join queries*/
create database BasicJoins;
use BasicJoins;
Create Table employees(
emp_id int primary key,
ename varchar(50));
desc employees;
insert into employees values(101,'Raghav'),(102,'Raashi'),(103,'Rohan'),(104,'Mohan');
insert into employees values(105,'Pravin');
select * from employees;
create table projects(pid int primary key, pname varchar(20), emp_id int, Foreign key(emp_id) references employees(emp_id));
desc projects;
insert into projects values(1,'Project A',101),(2,'Project B',102),(3,'Project C',101),(4,'Project D',103),(5,'Project E',104);
insert into projects values(6,'Project F',NULL);
select * from projects;

-- inner join
-- only matching records will display from employee
select * from employees JOIN projects ON employees.emp_id=projects.emp_id;
-- find ename and project name in table using inner join
select e.ename, p.pname from projects p inner join employees e on e.emp_id=p.emp_id;

-- left join
-- matching data from right table and all data from left table
select e.emp_id, e.ename, p.pname from employees e LEFT JOIN projects p on e.emp_id=p.emp_id;

select e.emp_id, e.ename, p.pname from projects p LEFT JOIN employees e on e.emp_id=p.emp_id;

-- right join
-- matching data from left table and all data from right table
select e.emp_id, e.ename, p.pname from employees e right JOIN projects p on e.emp_id=p.emp_id;

select e.emp_id, e.ename, p.pname from projects p right JOIN employees e on e.emp_id=p.emp_id;

-- ------------------------------------

insert into projects(pid,pname) values(8,'Project I');
insert into employees(emp_id,ename) values(106,'Akshay'),(107,'Harsh');

select * from employees LEFT JOIN projects on employees.emp_id=projects.emp_id;

-- full outer join
-- matching and non-matching data from both tables
select * from employees LEFT JOIN projects on employees.emp_id=projects.emp_id
UNION
select * from employees Right JOIN projects on employees.emp_id=projects.emp_id;


-- display emp name who has not been assigned any project
select employees.ename, projects.pname from employees  LEFT JOIN projects on employees.emp_id=projects.emp_id where projects.emp_id is not null;
select employees.ename, projects.pname from employees  LEFT JOIN projects on employees.emp_id=projects.emp_id where projects.emp_id is null;