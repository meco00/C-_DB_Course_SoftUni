CREATE PROCEDURE usp_EmployeesBySalaryLevel(@Level VARCHAR(MAX)) 
AS
    
SELECT FirstName,LastName 
    FROM Employees
	WHERE @Level =dbo.ufn_GetSalaryLevel(Salary)
	
GO

	EXEC usp_EmployeesBySalaryLevel High

	


