SELECT JobTitel, COUNT(JobTitel) AS 'Number of Emp'

FROM EmployeeSalary
Group By JobTitel

SELECT JobTitel, COUNT(JobTitel) AS 'Number of Emp'

FROM EmployeeSalary
Group By JobTitel
Having Count(JobTitel)>1


SELECT JobTitel, AVG(Salary) AS 'AVG Salary'

FROM EmployeeSalary
Group By JobTitel 
Order by AVG(Salary) desc


SELECT JobTitel, AVG(Salary) AS 'AVG Salary'
FROM EmployeeSalary
Group By JobTitel 
Having AVG(Salary)>45000
Order by AVG(Salary) desc
