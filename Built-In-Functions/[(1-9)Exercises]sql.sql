SELECT FirstName,LastName 
FROM Employees
WHERE LastName LIKE '%ei%'


SELECT FirstName 
FROM Employees
WHERE DepartmentID IN(3,10) AND 
 DATEPART(YEAR,HireDate) BETWEEN 1995 AND 2005


SELECT FirstName,LastName 
FROM Employees
 WHERE JobTitle  NOT LIKE  '%engineer%'


SELECT * FROM
Towns
WHERE Name Like '[^RBD]%'
ORDER BY Name ASC

CREATE VIEW V_EmployeesHiredAfter2000 AS
SELECT FirstName,LastName FROM 
Employees
WHERE DATEPART(YEAR,HireDate) > 2000

SELECT FirstName,LastName FROM 
Employees 
WHERE LEN(LastName) = 5