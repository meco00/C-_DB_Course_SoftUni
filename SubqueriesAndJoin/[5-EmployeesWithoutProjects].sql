SELECT TOP(3) E.EmployeeID,e.FirstName
FROM Employees AS e
 LEFT JOIN EmployeesProjects AS ep
ON e.EmployeeID=ep.EmployeeID 
WHERE ep.ProjectID IS NULL
ORDER BY e.EmployeeID ASC