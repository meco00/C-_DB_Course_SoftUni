CREATE TABLE  NotificationEmails
(
Id INT IDENTITY PRIMARY KEY,
Recipent INT FOREIGN KEY REFERENCES Logs(Id),
[Subject] VARCHAR(MAX),
Body VARCHAR(MAX)

)
 

 GO

CREATE OR ALTER TRIGGER tr_LogsInsert ON Logs FOR INSERT
AS

INSERT INTO NotificationEmails(Recipent,Subject,Body)
SELECT 
i.Id,
'Balance change for account: '+CONVERT(varchar,i.AccountId),
'On '+ CONVERT(varchar, GETDATE(), 0)+ ' your balance was changed from '+ CONVERT(varchar,i.OldSum)  +' to '+ CONVERT(varchar,i.NewSum)+'.'
FROM inserted AS i

GO



