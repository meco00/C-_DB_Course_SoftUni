CREATE  PROCEDURE usp_AssignProject(@emloyeeId INT, @projectID INT)
AS
 BEGIN
BEGIN TRANSACTION

IF(SELECT COUNT(*) FROM EmployeesProjects WHERE EmployeeID=@emloyeeId) >= 3
BEGIN
	ROLLBACK
	RAISERROR('The employee has too many projects!',16,1)
END


 INSERT INTO EmployeesProjects(EmployeeID,ProjectID) VALUES
 (@emloyeeId,@projectID)

COMMIT
 END



