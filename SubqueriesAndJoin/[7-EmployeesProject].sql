SELECT TOP(5) e.EmployeeID,e.FirstName,p.Name
FROM Employees AS e
JOIN EmployeesProjects AS ep
ON e.EmployeeID=ep.EmployeeID
JOIN Projects AS p
ON ep.ProjectID=p.ProjectID AND p.StartDate > CONVERT(datetime,'13.08.2002',104 ) 
WHERE p.EndDate IS NULL
ORDER BY e.EmployeeID ASC

