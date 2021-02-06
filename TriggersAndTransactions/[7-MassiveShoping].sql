SELECT ug.Id 
FROM UsersGames AS ug 
JOIN Users AS u ON u.Id=ug.UserId
WHERE GameId IN (SELECT Id FROM Games WHERE Name='Safflower') AND
u.Username='Stamat'


 

BEGIN TRANSACTION 
DECLARE @Cash DECIMAL(15,2) = (SELECT Cash FROM UsersGames WHERE Id=110)

DECLARE @TotalSumOfItems DECIMAL(15,2) = (SELECT SUM(Price) FROM Items WHERE MinLevel BETWEEN 11 AND 12)

IF(@Cash-@TotalSumOfItems>=0)
BEGIN

UPDATE UsersGames
SET Cash-=@TotalSumOfItems
WHERE Id=110

INSERT INTO UserGameItems(ItemId,UserGameId) 
SELECT Id, 110 FROM Items 
WHERE MinLevel BETWEEN 11 AND 12


COMMIT
END
ELSE
ROLLBACK



BEGIN TRANSACTION
SET @Cash  = (SELECT Cash FROM UsersGames WHERE Id=110)

SET @TotalSumOfItems  = (SELECT SUM(Price) FROM Items WHERE MinLevel BETWEEN 19 AND 21)

IF(@Cash-@TotalSumOfItems>=0)
BEGIN

UPDATE UsersGames
SET Cash-=@TotalSumOfItems
WHERE Id=110

INSERT INTO UserGameItems(ItemId,UserGameId) 
SELECT Id, 110 FROM Items 
WHERE MinLevel BETWEEN 19 AND 21


COMMIT
END
ELSE
ROLLBACK



SELECT Name AS [Item Name] FROM Items  AS i
JOIN UserGameItems ugi ON ugi.ItemId=i.Id
WHERE ugi.UserGameId=110