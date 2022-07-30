SELECT *
FROM EmployeeDemo
Inner Join EmployeeSalary
ON EmployeeDemo.EmployeeID = EmployeeSalary.EmployeeID

SELECT *
FROM EmployeeDemo
Inner Join EmployeeSalary
ON EmployeeDemo.EmployeeID = EmployeeSalary.EmployeeID
Where LastName <> 'Scott'
Order BY Salary desc


SELECT *
FROM EmployeeDemo
 Inner Join EmployeeSalary
ON EmployeeDemo.EmployeeID = EmployeeSalary.EmployeeID
Where LastName <> 'Scott'
Order BY Salary desc

SELECT JobTitel,  Max(Salary)
FROM EmployeeDemo
Inner Join EmployeeSalary
ON EmployeeDemo.EmployeeID = EmployeeSalary.EmployeeID
Where JobTitel = 'Salesman'
Group BY JobTitel

