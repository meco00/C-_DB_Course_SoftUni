--3
SELECT e.EmployeeID,e.FirstName,e.LastName,d.Name 
FROM Employees AS e
JOIN Departments AS d
ON e.DepartmentID=d.DepartmentID AND d.Name = 'Sales'
ORDER BY e.EmployeeID ASC



--4

SELECT TOP(5) e.EmployeeID,e.FirstName,e.Salary,d.Name 
FROM Employees AS e 
JOIN Departments AS d
ON e.DepartmentID=d.DepartmentID 
WHERE e.Salary > 15000
ORDER BY e.DepartmentID ASC
