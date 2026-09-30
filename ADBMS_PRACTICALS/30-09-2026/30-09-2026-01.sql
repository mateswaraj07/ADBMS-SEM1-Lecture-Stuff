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

-- 8.Create a foreign key constraint between two tables

ALTER TABLE Employees ADD DeptID INTEGER;
ALTER TABLE Employees ADD FOREIGN KEY Employees(DeptID) REFERENCES Departments(DeptID);

-- 9.Drop the primary key Constraint from Departments

ALTER TABLE Employees Drop PRIMARY KEY;

-- 10.Rename the column EmpName to EmployeeName.

ALTER TABLE Employees RENAME COLUMN EMPNAME to EmployeeName;

-- 11.Remove the Phone column from the Employees table.

ALTER TABLE EmployeeDetails DROP COLUMN Phone;

-- 12.Rename the table Employees to EmployeeDetails.

RENAME TABLE Employees to EmployeeDetails;

-- 13.Delete the Departments table permanently.

-- DROP TABLE Departments;

-- 14. Add Values in both tables

INSERT INTO Departments (DeptID, DeptName, dept_location)
VALUES
(101, 'IT', 'Pune'),
(102, 'HR', 'Mumbai'),
(103, 'Sales', 'Delhi'),
(104, 'Finance', 'Nashik'),
(105, 'Admin', 'Pune');

SELECT * FROM Departments;

INSERT INTO EmployeeDetails 
(EmpID, EmployeeName, Salary, JoinDate, Email, DeptID)
VALUES
(1, 'Rahul', 45000, '2024-01-15', 'rahul@gmail.com', 101),
(2, 'Priya', 50000, '2023-06-20', 'priya@gmail.com', 102),
(3, 'Amit', 40000, '2024-03-10', 'amit@gmail.com', 103),
(4, 'Sneha', 55000, '2022-11-05', 'sneha@gmail.com', 104),
(5, 'Rohan', 48000, '2023-09-18', 'rohan@gmail.com', 105);

SELECT * FROM EmployeeDetails;