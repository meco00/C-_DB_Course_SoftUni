
CREATE TABLE Logs
(
Id INT IDENTITY PRIMARY KEY,
AccountId INT FOREIGN KEY REFERENCES Accounts(Id),
OldSum DECIMAL (15,2),
NewSum DECIMAL(15,2) 

)
GO

CREATE TRIGGER tr_AccountsUpdate ON Accounts FOR UPDATE 
AS
BEGIN

INSERT INTO Logs(AccountId,OldSum,NewSum)
SELECT deleted.Id,deleted.Balance,inserted.Balance
FROM deleted 
JOIN inserted 
ON deleted.Id=inserted.Id

END
GO

SELECT * FROM Accounts WHERE Id IN(1,2)

UPDATE Accounts 
SET Balance =Balance+10
 WHERE Id IN(1,2)
