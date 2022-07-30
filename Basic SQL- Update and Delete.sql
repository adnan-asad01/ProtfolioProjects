SELECT *
FROM EmployeeDemo

UPDATE EmployeeDemo
Set LastName = 'Flax'
	Where FirstName='Holy'

	UPDATE EmployeeDemo
Set Age = 31, Gender = 'Female'
	Where FirstName='Holy'

	UPDATE EmployeeDemo
Set EmployeeID= 1020
	Where FirstName='Ryan'

	Insert into EmployeeDemo VALUES
(1017, 'Kelly', '', 27, 'Female')
Insert into EmployeeDemo VALUES
(1018, 'Kelly', '', 27, 'Female')

	--Delete From EmployeeDemo

	Select *
	From EmployeeDemo
	Where EmployeeID= 1018

	Delete 
	From EmployeeDemo
	Where EmployeeID= 1018

