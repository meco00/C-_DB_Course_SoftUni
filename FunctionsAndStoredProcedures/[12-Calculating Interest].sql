CREATE  PROCEDURE usp_CalculateFutureValueForAccount (@AccountId INT ,@InterestRate FLOAT)
AS
SELECT a.Id AS [Account Id], FirstName,
LastName,
Balance AS [Current Balance],
dbo.ufn_CalculateFutureValue(Balance, @InterestRate , 5) AS [Balance in 5 years]

 FROM AccountHolders AS ah
 JOIN Accounts AS a
 ON a.AccountHolderId=a.Id
 WHERE ah.Id=@AccountId

 GO

 EXEC dbo.usp_CalculateFutureValueForAccount 1,0.1