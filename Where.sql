SELECT *
FROM EmployeeDemo
Where FirstName = 'Jim'

SELECT *
FROM EmployeeDemo
Where FirstName <> 'Jim'

SELECT *
FROM EmployeeDemo
Where Age <= 30

SELECT *
FROM EmployeeDemo
Where Age >= 30 AND Gender= 'Male'


/-- WILD CARD S%starts with S| %S% has S
SELECT *
FROM EmployeeDemo
Where LastName Like 'S%'

SELECT *
FROM EmployeeDemo
Where FirstName IN ('Jim','Pam')