CREATE PROCEDURE usp_DepositMoney (@AccountId INT,@MoneyAmount DECIMAL(18,4))
AS
BEGIN TRANSACTION
DECLARE @MoneyToWithDraw DECIMAL(18,4) =(SELECT Balance FROM Accounts WHERE @AccountId=Accounts.Id)
DECLARE @accountIdIsValid INT=(SELECT Id FROM Accounts WHERE @AccountId=Accounts.Id)

IF(@MoneyAmount<0 OR @accountIdIsValid IS NULL)
BEGIN
ROLLBACK
RAISERROR('Invalid Operation',16,1)
RETURN 
END

UPDATE Accounts
SET Balance+=@MoneyAmount
WHERE Accounts.Id=@AccountId

COMMIT

GO

SELECT * FROM Accounts
WHERE ID =1

EXEC usp_DepositMoney 1,10