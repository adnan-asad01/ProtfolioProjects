SELECT *
FROM EmployeeDemo


SELECT *
FROM EmployeeDemo As Demo
Join EmployeeSalary As Sal on
Demo.EmployeeID=Sal.EmployeeID


SELECT FirstName, LastName, Salary, Gender, Count(Gender) Over (Partition by Gender) As Total
FROM EmployeeDemo As Demo
Join EmployeeSalary As Sal on
Demo.EmployeeID=Sal.EmployeeID

