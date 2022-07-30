/*
Cleaning Data in SQL Queries
*/
CREATE TABLE EmployeeDemo
(EmployeeID int,
FirstName varchar(50),
LastName varchar(50),
Age int,
Gender varchar(50)
)

CREATE TABLE WHEmployeeDemo
(EmployeeID int,
FirstName varchar(50),
LastName varchar(50),
Age int,
Gender varchar(50)
)

CREATE TABLE EmplyeeSalary
(EmployeeID int,
JobTitel varchar(50),
Salary int,
)

Insert into EmployeeDemo VALUES
(1001, 'Jim', 'Halpert', 30, 'Male'),
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male')

Insert into WHEmployeeDemo VALUES
(1001, 'Kevin', 'Halpert', 30, 'Male'),
(1002, 'Stanley', 'Beasley', 30, 'Female'),
(1003, 'Meredith', 'Schrute', 29, 'Male'),
(1004, 'Michael', 'Martin', 31, 'Female'),
(1005, 'Hudson', 'Flenderson', 32, 'Male'),
(1006, 'Toby', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Kevin', 32, 'Female'),
(1008, 'Toby', 'Beasley', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male')

Insert Into EmployeeSalary VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000)