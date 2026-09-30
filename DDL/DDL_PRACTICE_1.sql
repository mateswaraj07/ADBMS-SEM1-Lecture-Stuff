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

ALTER TABLE Staff ADD PRIMARY KEY (staff_id);
ALTER TABLE Department ADD PRIMARY KEY (dept_id);

DESC Staff;
DESC Department;

ALTER TABLE Staff add foreign key (dept_id) references Department (dept_id);
DESC Staff;

ALTER TABLE Staff add constraint FK_Staff_Department foreign key (dept_id) references Department (dept_id);

ALTER TABLE Staff RENAME staff1;
-- or
RENAME TABLE staff1 to Staff;

DESC staff1;

ALTER TABLE Staff RENAME COLUMN first_name to FirstName;

DROP TABLE Department; /*error due to fk*/

DROP TABLE Staff;

DROP TABLE Department;

DROP DATABASE Institute;