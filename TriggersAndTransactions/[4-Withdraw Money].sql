
CREATE PROCEDURE usp_WithdrawMoney (@accountId INT , @moneyAmount DECIMAL(15,4))
AS

IF(@moneyAmount<0)
THROW 5001 , 'Negative MoneyAmount' ,1


UPDATE Accounts 
SET Balance-=@moneyAmount
WHERE Accounts.Id=@accountId
