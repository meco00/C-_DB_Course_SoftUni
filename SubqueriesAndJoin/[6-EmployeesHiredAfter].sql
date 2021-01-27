SELECT e.FirstName,e.LastName,e.HireDate,d.[Name] AS [DeptName]
FROM 
Employees AS e
JOIN Departments AS d
ON e.DepartmentID=d.DepartmentID AND d.Name IN('Sales','Finance')
WHERE e.HireDate > CONVERT(datetime,'1.1.1999',104)
ORDER BY e.HireDate ASC
