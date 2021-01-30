SELECT TOP(10) FirstName,LastName,DepartmentID
FROM
Employees as e
WHERE Salary > 
(	SELECT AVG(Salary) FROM
		Employees as m 
		WHERE m.DepartmentID=e.DepartmentID
	GROUP BY DepartmentID
)
ORDER BY DepartmentID ASC