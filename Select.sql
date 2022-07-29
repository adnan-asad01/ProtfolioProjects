SELECT *
FROM EmployeeDemo

SELECT top 5 *
FROM EmployeeDemo

SELECT FirstName, LastName
FROM EmployeeDemo

SELECT DISTINCT(EmployeeID)
FROM EmployeeDemo

SELECT DISTINCT(Gender)
FROM EmployeeDemo

SELECT COUNT(EmployeeID) As EmployeeIDCount
FROM EmployeeDemo

SELECT *
FROM EmployeeSalary

SELECT  MAX(Salary) As Salary
FROM EmployeeSalary
SELECT  MIN(Salary) As Salary
FROM EmployeeSalary
SELECT  AVG(Salary) As Salary
FROM EmployeeSalary