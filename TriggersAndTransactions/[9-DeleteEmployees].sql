
CREATE TRIGGER tr_EmployeesDeleted ON Employees FOR DELETE 
AS

 INSERT INTO Deleted_Employees(FirstName,LastName,MiddleName,JobTitle,DepartmentId,Salary)
 SELECT FirstName,LastName,MiddleName,JobTitle,DepartmentId,Salary FROM deleted

GO