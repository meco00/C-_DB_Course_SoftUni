SELECT TOP (1) AVG(e.Salary) AS MinAverageSalary
FROM Employees AS e
JOIN Departments AS d
ON e.DepartmentID=d.DepartmentID
GROUP BY(d.Name)
ORDER BY MinAverageSalary ASC