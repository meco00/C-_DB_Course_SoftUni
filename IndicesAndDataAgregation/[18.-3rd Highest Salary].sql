SELECT DISTINCT k.DepartmentID,k.Salary AS [ThirdHighestSalary] FROM 
(
SELECT 
DepartmentID,
Salary,
DENSE_RANK()  OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS [RANK]
FROM Employees
) AS k
WHERE k.RANK=3