CREATE DATABASE Institute;
SHOW DATABASES;
USE  Institute;
CREATE TABLE Staff(
staff_id INTEGER,
first_name VARCHAR(25),
last_name VARCHAR(25),
DOB DATE,
dept_id INTEGER
);
CREATE TABLE Department(
dept_id int,
dept_name VARCHAR(10),
dept_location varchar(10)
);
DESC Staff;
DESC Department;

ALTER TABLE Staff  ADD COLUMN location VARCHAR(10);
ALTER TABLE Staff ADD COLUMN joining_yr VARCHAR(4);

DESC Staff;

ALTER TABLE Staff ADD COLUMN age int, ADD COLUMN contact_number varchar(13);

DESC Staff;

ALTER TABLE Staff MODIFY last_name TEXT; 

desc Staff;

ALTER TABLE Staff DROP contact_number;

DESC Staff;