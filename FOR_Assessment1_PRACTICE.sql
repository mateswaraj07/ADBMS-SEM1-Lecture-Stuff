CREATE DATABASE SQL_Practice;
USE SQL_Practice;
-- 1. Create Departments table
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL,
    dept_location VARCHAR(50)
);
INSERT INTO Departments VALUES
(1, 'IT', 'Pune'),
(2, 'HR', 'Mumbai'),
(3, 'Finance', 'Delhi'),
(4, 'Marketing', 'Nashik'),
(5, 'Sales', 'Nagpur');
-- 2. Create Employees table
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100) NOT NULL,
    Age INT,
    Salary DECIMAL(10,2),
    JoinDate DATE,
    Email VARCHAR(100),
    Phone VARCHAR(15),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);
INSERT INTO Employees VALUES
(101, 'Raghav', 23, 35000, '2023-01-15', 'raghav@example.com', '9000000001', 1),
(102, 'Raashi', 25, 45000, '2022-06-10', 'raashi@example.com', '9000000002', 2),
(103, 'Rohan', 28, 60000, '2021-03-20', 'rohan@example.com', '9000000003', 1),
(104, 'Mohan', 30, 50000, '2020-11-05', 'mohan@example.com', '9000000004', 3),
(105, 'Pravin', 26, 40000, '2023-08-12', NULL, '9000000005', 4),
(106, 'Akshay', 24, 30000, '2024-02-01', 'akshay@example.com', NULL, 2),
(107, 'Harsh', 32, 70000, '2019-09-18', 'harsh@example.com', '9000000007', 3),
(108, 'Sneha', 27, 55000, '2022-12-25', 'sneha@example.com', '9000000008', 1);
-- 3. Create Projects table
CREATE TABLE Projects (
    PID INT PRIMARY KEY,
    PName VARCHAR(50) NOT NULL,
    EmpID INT,
    FOREIGN KEY (EmpID) REFERENCES Employees(EmpID)
);
INSERT INTO Projects VALUES
(1, 'Project A', 101),
(2, 'Project B', 102),
(3, 'Project C', 101),
(4, 'Project D', 103),
(5, 'Project E', 104),
(6, 'Project F', NULL),
(7, 'Project G', 108);
-- Extra project with no employee assigned
INSERT INTO Projects (PID, PName)
VALUES (8, 'Project H');

select * from Departments;
select * from Employees;
select * from Projects;

/*Basic SQL and DQL*/

-- 1.Display all records from Employees.
select * from employees;
-- 2.Display only EmpName and Salary from Employees.
select EmpName, Salary from Employees;
-- 3.Display all records from Departments.
select * from Departments;
-- 4.Display all records from Projects.
select * from Projects;
-- 5.Display employee names in alphabetical order.
select EmpName from Employees order by EmpName ASC;
-- 6.Display employees in descending order of Salary.
select EmpName, Salary from Employees order by Salary DESC;
-- 7.Display distinct DeptID values from Employees.
select distinct DeptID from Employees;
-- 8.Display employees whose Salary is greater than 40000.
select * from employees where Salary>40000;
-- 9. Display employees whose Age is less than or equal to 25.
select * from employees where Age<=25;
-- 10. Display employees whose Salary is between 35000 and 55000.
select * from employees where Salary between 35000 and 55000;
-- 11. Display employees whose DeptID is either 1 or 3 using IN.
select * from Employees where DeptID in (1,3);
-- 12. Display employees whose names start with the letter R.
select * from employees where EmpName like 'R%';
-- 13. Display employees whose names contain the letter a.
select * from employees where EmpName like '%a%';
-- 14. Display employees who do not have an Email.
select * from employees where Email is null;
-- 15. Display employees who have a Phone number.
select * from employees where Phone is not null;

/*DDL, DML and constraints*/

-- 16.
-- Create a database named CompanyDB.
create database CompanyDB;
-- 17.
-- Create a table named TestEmployees with EmpID as INT PRIMARY KEY and EmpName as VARCHAR(50).
create table TestEmployees(EmpID INT PRIMARY KEY, EmpName VARCHAR(50));
-- 18.
-- Insert three records into TestEmployees.
insert into TestEmployees values (101,'Swaraj'),(102,'Shreepad'),(103,'Pravin');
-- 19.
-- Add a column Email VARCHAR(100) to TestEmployees.
alter table TestEmployees Add column Email VARCHAR(100);
-- 20.
-- Modify EmpName from VARCHAR(50) to VARCHAR(100).
alter table TestEmployees MODIFY EmpName Varchar(100);
-- 21.
-- Rename the column EmpName to EmployeeName.
alter table TestEmployees Rename Column EmpName To EmployeeName;
-- 22.
-- Rename TestEmployees to EmployeeDetails.
RENAME Table TestEmployees to EmployeeDetails;
-- 23.
-- Add a NOT NULL constraint to a column when creating a new table.
create table Student(rno int primary key, sname varchar(50) not null);
desc Student;
-- 24.
-- Create a table with a CHECK constraint that Age must be at least 18.
create table s1(Age int, check(Age>=18));
-- 25.
-- Create a table with a CHECK constraint that Salary must be greater than 0.
create table s2(Salary Int, CHECK(Salary>0));
-- 26.
-- Add a foreign key from a child table to a parent table.
Alter table s1 add id int primary key;
ALTER TABLE s2 add id int;
Alter table s2 add constraint fk foreign key(id) references s1(id);
-- 27.
-- Remove a column from a table using ALTER TABLE.
alter table s2 drop column Salary;
-- 28.
-- Delete one selected employee record using DELETE and WHERE.
Delete from Employees Where EmpID=106;
-- 29.
-- Update the salary of one employee using UPDATE and WHERE.
UPDATE Employees Set Salary=70000 Where EmpID=105;
-- 30.
-- Remove all records from a test table using DELETE without dropping its structure.
delete from s2; -- or truncate table s2;
-- 31.
-- Drop a test table using DROP TABLE.
drop table s2;

/*Aggregate functions, GROUP BY and HAVING*/

-- Find the total number of employees using COUNT().
select count(EmpID) from employees;
-- Find the maximum salary.
select max(Salary) from employees;
-- Find the minimum salary.
select min(Salary) from employees;
-- Calculate the average salary.
select AVG(Salary) from employees;
-- Calculate the total salary paid to all employees.
select sum(Salary) from employees;
-- Count how many employees belong to each department.
select DeptID, COUNT(*) AS TOTAL_EMPS from Employees group by DeptID;
-- Find the average salary in each department.
select DeptID, AVG(Salary) AS Avg_Sal from Employees group by DeptID;
-- Display the maximum salary for each department.
select DeptID, MAX(Salary) AS Max_Sal from Employees group by DeptID;
-- Display departments having more than two employees using HAVING.
SELECT DeptID, COUNT(*) AS Tot_Emp From Employees group by DeptID Having count(*)>2;
-- Display departments whose average salary is greater than 45,000.
select DeptID, Avg(Salary) AS Avg_Sal from Employees group by DeptID having avg(Salary)>45000;
-- Count employees whose salary is greater than 40,000.
select count(*) From Employees where Salary>40000;
-- Display the total number of projects.
select count(PID) from Projects;
-- Display the number of projects assigned to each employee.
select EmpID, Count(*) from Projects where EmpID is not null group by EmpID;
-- Display departments in descending order of their average salary.
select DeptID, Avg(Salary) from Employees group by DeptID order by avg(Salary) desc;

/*SQL JOINs*/

-- 31. INNER JOIN
-- Display employee names alongside their department names, showing only matching records.
select EmpName, DeptName From Employees INNER JOIN Departments ON Employees.DeptID=Departments.DeptID;
-- 32. LEFT JOIN
-- Display every employee and their department name, including employees with no matching department.
Select EmpID, EmpName, DeptName from Employees LEFT JOIN Departments ON Employees.DeptID=Departments.DeptID;
-- 33. RIGHT JOIN
-- Display every department and the employees belonging to it, including departments with no employees.
Select DeptName, EmpName from Employees RIGHT JOIN Departments ON Employees.DeptID=Departments.DeptID;
-- 34. FULL OUTER JOIN using UNION
-- Display all employees and all departments, including matching and non-matching records. 
-- Implement it using LEFT JOIN, UNION, and RIGHT JOIN.
Select EmpName, DeptName From Employees LEFT JOIN Departments ON Employees.DeptID=Departments.DeptID
UNION
Select EmpName, DeptName From Employees RIGHT JOIN Departments ON Employees.DeptID=Departments.DeptID;

/*JOIN practice*/

-- 35. Display employee names and project names using INNER JOIN.
Select e.EmpName, p.PName From Employees e INNER JOIN Projects p ON e.EmpId=p.EmpID; 
-- 36. Display every employee and their project names using LEFT JOIN.
Select e.EmpName, p.PName From Employees e LEFT JOIN Projects p ON e.EmpId=p.EmpID; 
-- 37. Display every project and its employee name using RIGHT JOIN.
Select e.EmpName, p.PName From Employees e RIGHT JOIN Projects p ON e.EmpId=p.EmpID; 
-- 38. Display all employees and all projects, including unassigned projects, using a FULL OUTER JOIN equivalent with UNION.
Select e.EmpName, p.PName From Employees e LEFT JOIN Projects p ON e.EmpId=p.EmpID
UNION
Select e.EmpName, p.PName From Employees e RIGHT JOIN Projects p ON e.EmpId=p.EmpID; 
-- 39. Find employees who have no assigned projects using LEFT JOIN and IS NULL.
Select e.EmpName, p.PName From Employees e LEFT JOIN Projects p ON e.EmpId=p.EmpID where Pname is null; 
-- 40. Find employees who have at least one assigned project.
Select e.EmpName, p.PName From Employees e LEFT JOIN Projects p ON e.EmpId=p.EmpID where Pname is not null; 
-- 41. Display employees working on more than one project.
Select e.EmpID, e.EmpName, COUNT(p.PID) From Employees e LEFT JOIN Projects p ON e.EmpId=p.EmpID group by e.EmpID, e.EmpName having count(p.PID)>1; 
-- 42. Display each employee's name, salary, and department name.
SELECT e.EmpName, e.Salary, d.DeptName from Employees e INNER JOIN Departments d ON e.DeptID=d.DeptID;
-- 43. Display employees from the IT department using a JOIN and WHERE.
select e.EmpName, d.DeptName from Employees e LEFT JOIN Departments d ON e.DeptID=d.DeptID WHERE DeptName='IT';
-- 44. Display employee names, project names, and department names using the necessary JOINs.
SELECT e.EmpName, p.PName, d.DeptName FROM Employees e LEFT JOIN Projects p ON e.EmpID = p.EmpID LEFT JOIN Departments d ON e.DeptID = d.DeptID;
-- 45. Explain the difference between UNION and UNION ALL by running two simple SELECT statements.
SELECT 'IT' AS DeptName UNION SELECT 'IT' AS DeptName;
-- or SELECT 'IT' AS DeptName UNION ALL SELECT 'IT' AS DeptName;

-- Remember: MySQL does not directly support FULL OUTER JOIN. 

/*TCL and transactions*/

-- 46. Create a table called TestAccounts with AccountID as the primary key and Balance as a numeric column.
create table TestAccounts(AccountID INT PRIMARY KEY, Balance Numeric);
-- 47. Insert two accounts with balances of 5,000 and 8,000.
insert into TestAccounts Values(1,5000),(2,8000);
-- 48. Start a transaction using START TRANSACTION.
START transaction; -- or BEGIN;
-- 49. Deduct 1,000 from the first account and add 1,000 to the second account.
Update TestAccounts set Balance=Balance-1000 where AccountID=1;
Update TestAccounts set Balance=Balance+1000 where AccountID=2;
-- 50. Use COMMIT to save the changes.
COMMIT;
-- 51. Repeat a balance update, then use ROLLBACK to cancel the uncommitted change.
Update TestAccounts set Balance=Balance-1000 where AccountID=1;
Update TestAccounts set Balance=Balance+1000 where AccountID=2;
ROLLBACK;
-- 52. Explain the difference between COMMIT and ROLLBACK.
-- COMMIT: Saves the changes made during a transaction permanently.
-- ROLLBACK: Cancels uncommitted changes and restores the data to its state before the transaction began.
-- 53. Check the balances before and after a rollback.
select * from TestAccounts;
START TRANSACTION;
UPDATE TestAccounts
SET Balance = Balance - 1000
WHERE AccountID = 1;
UPDATE TestAccounts
SET Balance = Balance + 1000
WHERE AccountID = 2;
select * from TestAccounts;
ROLLBACK;
select * from TestAccounts;

/* Advanced mixed questions*/

-- 54. Find the second-highest salary using a subquery.
select max(Salary) as Sec_Max_Sal from employees where salary<(Select max(Salary) from Employees);
-- 55. Display employees earning more than the overall average salary.
select EmpName, Salary from Employees Where Salary>(Select Avg(Salary) from Employees);
-- 56. Find the department with the highest average salary.
SELECT DeptID, AVG(Salary) FROM Employees GROUP BY DeptID ORDER BY AVG(Salary) DESC LIMIT 1;
-- 57. Display employees who joined after 2022-01-01.
Select EmpName from Employees where JoinDate>'2022-01-01';
-- 58. Display employees whose salary is outside the range of 30,000 to 50,000.
select EmpName, Salary From Employees where Salary not between 30000 and 50000;
-- 59. Find employees whose names end with h.
select * from Employees where EmpName like '%h';
-- 60. Display the number of employees in each department, sorted from highest to lowest.
select DeptID, Count(*) from Employees group by DeptID order by count(*) Desc;
-- 61. Display departments having no employees using a JOIN and IS NULL.
SELECT d.DeptID, d.DeptName FROM Departments d LEFT JOIN Employees e ON d.DeptID = e.DeptID WHERE e.EmpID IS NULL;
-- 62. Find employees whose salary is greater than the salary of employee 101 using a subquery.
select EmpName from Employees where Salary>(Select Salary from Employees where EmpID=101);
-- 63. Increase salaries by 10% for employees in department 1.
update Employees set Salary=Salary*1.10 where DeptID=1;
-- 64. Delete a project with PID 8 using DELETE and WHERE.
Delete From Projects Where PID=8;
-- 65. Add a new department and then insert an employee belonging to it.
INSERT INTO Departments (DeptID, DeptName, dept_location) VALUES (6, 'Research', 'Pune');
INSERT INTO Employees(EmpID, EmpName, Age, Salary, JoinDate, Email, Phone, DeptID) VALUES(109, 'Amit', 24, 42000, '2024-05-10','amit@example.com', '9000000009', 6);
-- 66. Add a CHECK constraint to ensure salary is positive. Test it with a valid and an invalid value.
ALTER TABLE Employees ADD CONSTRAINT chk_salary CHECK (Salary > 0);
INSERT INTO Employees(EmpID, EmpName, Salary, DeptID)VALUES (110, 'TestUser', 25000, 1);
INSERT INTO Employees(EmpID, EmpName, Salary, DeptID)VALUES (111, 'InvalidUser', -5000, 1); -- gives error
-- 67. Add a new column called Bonus to Employees.
Alter table Employees Add column Bonus Decimal(10,2);
-- 68. Update the bonus for employees earning more than 50,000.
Update Employees Set Bonus=5000 where Salary>50000;
-- 69. Find the total salary for each department, but show only departments with a total salary above 80,000.
SELECT DeptID, SUM(Salary) AS TotalSalary FROM Employees GROUP BY DeptID HAVING SUM(Salary) > 80000;
-- 70. Display employees and projects using a FULL OUTER JOIN equivalent, then explain which rows have no matching record.
SELECT e.EmpID, e.EmpName, p.PID, p.PName
FROM Employees e
LEFT JOIN Projects p
ON e.EmpID = p.EmpID
UNION
SELECT e.EmpID, e.EmpName, p.PID, p.PName
FROM Employees e
RIGHT JOIN Projects p
ON e.EmpID = p.EmpID;

/*Exam-style challenge*/

-- 71. Create a new database, two related tables, primary and foreign keys, and insert at least five records into each table.
CREATE DATABASE CompanyPractice;
USE CompanyPractice;
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL
);
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);
INSERT INTO Departments VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Sales'),
(5, 'Marketing');
INSERT INTO Employees VALUES
(101, 'Raghav', 35000, 1),
(102, 'Raashi', 45000, 2),
(103, 'Rohan', 60000, 1),
(104, 'Mohan', 50000, 3),
(105, 'Sneha', 55000, 4);
-- 72. Display all employees whose salary is above the average salary of their department.
SELECT EmpName, Salary, DeptID
FROM Employees e
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
    WHERE DeptID = e.DeptID
);
-- 73. Display each department's name, number of employees, and average salary. Show only departments with at least two employees.
SELECT d.DeptName,
       COUNT(e.EmpID) AS TotalEmployees,
       AVG(e.Salary) AS AvgSalary
FROM Departments d
INNER JOIN Employees e
    ON d.DeptID = e.DeptID
GROUP BY d.DeptID, d.DeptName
HAVING COUNT(e.EmpID) >= 2;
-- 74. Display employees who have no project assigned, using LEFT JOIN and IS NULL.
SELECT e.EmpID, e.EmpName
FROM Employees e
LEFT JOIN Projects p
    ON e.EmpID = p.EmpID
WHERE p.PID IS NULL;
-- 75. Display all employees and projects, including unmatched rows, using LEFT JOIN + UNION + RIGHT JOIN.
SELECT e.EmpID, e.EmpName, p.PID, p.PName
FROM Employees e
LEFT JOIN Projects p
    ON e.EmpID = p.EmpID
UNION
SELECT e.EmpID, e.EmpName, p.PID, p.PName
FROM Employees e
RIGHT JOIN Projects p
    ON e.EmpID = p.EmpID;
-- 76. Change a column's data type, rename a column, and add a new column using ALTER TABLE.
-- Change the data type
ALTER TABLE Employees
MODIFY Salary DECIMAL(12,2);
-- Rename a column
ALTER TABLE Employees
RENAME COLUMN EmpName TO EmployeeName;
-- Add a new column
ALTER TABLE Employees
ADD Email VARCHAR(100);
-- 77. Create a foreign-key relationship, then try dropping the parent table. Resolve the foreign-key dependency correctly.
CREATE TABLE Parent (
    ID INT PRIMARY KEY
);
CREATE TABLE Child (
    ChildID INT PRIMARY KEY,
    ParentID INT,
    FOREIGN KEY (ParentID) REFERENCES Parent(ID)
);
-- Drop the child table first
DROP TABLE Child;
-- Then drop the parent table
DROP TABLE Parent;
-- 78. Update two account balances in one transaction and use ROLLBACK to cancel the changes.
START TRANSACTION;
UPDATE TestAccounts
SET Balance = Balance - 1000
WHERE AccountID = 1;
UPDATE TestAccounts
SET Balance = Balance + 1000
WHERE AccountID = 2;
ROLLBACK;
SELECT * FROM TestAccounts;
-- 79. Find the department with the highest total salary using GROUP BY, SUM(), and sorting.
SELECT DeptID, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY DeptID
ORDER BY TotalSalary DESC
LIMIT 1;
-- 80. Write a complete query that displays employee name, department name, project name, 
-- and salary for employees earning more than 40,000, sorted by salary from highest to lowest.
SELECT e.EmpName,
       d.DeptName,
       p.PName,
       e.Salary
FROM Employees e
INNER JOIN Departments d
    ON e.DeptID = d.DeptID
LEFT JOIN Projects p
    ON e.EmpID = p.EmpID
WHERE e.Salary > 40000
ORDER BY e.Salary DESC;