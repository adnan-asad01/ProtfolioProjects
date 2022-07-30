
SELECT FirstName, LastName, Age,
CASE
	WHEN Age > 30 Then 'Old'
	WHEN AGE BETWEEN 28 AND 30 Then 'Young'
	ELSE 'Baby'
END
FROM EmployeeDemo
Order By Age



SELECT FirstName, LastName, JobTitel, Salary,
CASE
	When JobTitel='Salesman'Then Salary + (Salary * .10)
	When JobTitel='Accountant'Then Salary + (Salary * .5)
	When JobTitel='HR'Then Salary + (Salary * .000001)
	Else Salary + (Salary * .3)
END AS SalaryAfterRaise

FROM EmployeeDemo
JOIN EmployeeSalary
ON EmployeeDemo.EmployeeID = EmployeeSalary.EmployeeID