CREATE TABLE  NotificationEmails
(
Id INT IDENTITY PRIMARY KEY,
Recipent INT FOREIGN KEY REFERENCES Logs(Id),
[Subject] VARCHAR(MAX),
Body VARCHAR(MAX)

)
GO



UPDATE Accounts 
SET Balance =Balance+10
 WHERE Id IN(1,2)

 GO

CREATE TRIGGER tr_LogsInsert ON Logs FOR INSERT
AS

INSERT INTO NotificationEmails(Recipent,Subject,Body)
SELECT inserted.Id,
'Balance change for account: '+CONVERT(varchar,inserted.AccountId),
'On '+ CONVERT(varchar, GETDATE(), 0)+ ' your balance was changed from '+ CONVERT(varchar,inserted.OldSum)  +' to '+ CONVERT(varchar,inserted.NewSum)+'.'
FROM inserted

GO
