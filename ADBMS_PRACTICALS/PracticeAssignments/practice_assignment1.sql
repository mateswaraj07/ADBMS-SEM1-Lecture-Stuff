-- 1.Create a database named CompanyDB.
create database CompanyDB;
use CompanyDB;

-- 2.Create a table Employees with the following columns:
-- Employees (EmpID (Integer, Primary Key), EmpName, Salary, JoinDate )
create table Employees(
EmpID INTEGER PRIMARY KEY,
EmpName VARCHAR(20),
Salary INTEGER,
JoinDate DATE);

-- 3.Create a table Departments with:
-- Departments (DeptID (Integer, Primary Key), DeptName)
CREATE TABLE Departments(
DeptID INTEGER PRIMARY KEY,
DeptName VARCHAR(20));

-- 4.Add a column Email (VARCHAR(100)) to the Employees table.
ALTER TABLE Employees ADD COLUMN Email VARCHAR(100);

-- 5.Add a column dept_location to the Departments table.
ALTER TABLE Departments ADD COLUMN dept_location VARCHAR(10);

-- 6.Add a NOT NULL Constraint to the Phone column
ALTER TABLE Employees ADD COLUMN Phone NUMERIC(10) NOT NULL;

-- 7.Change the size of the EmpName column from VARCHAR (50) to VARCHAR (100).
ALTER TABLE Employees MODIFY EmpName VARCHAR(100);

-- 8.Drop the primary key Constraint from Departments
ALTER TABLE Employees Drop PRIMARY KEY;

-- 9. Create a foreign key constraint between two tables
ALTER TABLE Employees ADD DeptID INTEGER;
ALTER TABLE Employees ADD FOREIGN KEY Employees(DeptID) REFERENCES Departments(DeptID);

-- 10.Rename the column EmpName to EmployeeName.
ALTER TABLE Employees RENAME COLUMN EMPNAME to EmployeeName;

-- 11.Apply a CHECK constraint on the Age and Salary columns.
ALTER TABLE Employees
ADD Age INT;

ALTER TABLE Employees
ADD CONSTRAINT chk_age
CHECK (Age >= 18);

ALTER TABLE Employees
ADD CONSTRAINT chk_salary
CHECK (Salary > 0);

-- 12.Remove the Phone column from the Employees table.
ALTER TABLE Employees DROP COLUMN Phone;

-- 13.Rename the table Employees to EmployeeDetails.
RENAME TABLE Employees TO EmployeeDetails;

-- 14.Drop the CHECK constraints.
ALTER TABLE EmployeeDetails
DROP CHECK chk_age;

ALTER TABLE EmployeeDetails
DROP CHECK chk_salary;

-- 15.Delete the Departments table permanently.
ALTER TABLE EmployeeDetails DROP FOREIGN KEY employeedetails_ibfk_1;
DROP TABLE Departments;

-- 16.Drop the database.
DROP DATABASE CompanyDB;