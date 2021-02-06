CREATE PROCEDURE usp_TransferMoney(@senderId INT, @receiverId INT , @Amount DECIMAL(15,4))
AS
BEGIN TRANSACTION
EXEC usp_WithdrawMoney @senderId,@Amount
EXEC usp_DepositMoney @receiverId,@Amount
COMMIT

GO

EXEC usp_TransferMoney 5,1,5000

