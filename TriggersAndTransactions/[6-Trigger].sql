CREATE TRIGGER tr_UserGameItems ON UserGameItems INSTEAD OF INSERT
AS

INSERT INTO  UserGameItems (ItemId,UserGameId)
SELECT i.ItemId,i.UserGameId
FROM inserted AS i
JOIN UsersGames AS ug ON ug.Id=i.UserGameId
JOIN Items AS it ON it.Id=i.ItemId
WHERE it.MinLevel<=ug.Level

GO

---2---
UPDATE UsersGames
SET Cash +=50000
FROM UsersGames AS ug 
JOIN Users AS u ON ug.UserId= u.Id
JOIN Games  g ON g.Id=ug.GameId 
WHERE g.Name='Bali' AND u.Username IN ('baleremuda', 'loosenoise', 'inguinalself', 'buildingdeltoid', 'monoxidecos')

GO
--3---
CREATE OR ALTER PROCEDURE usp_BuyItem(@Username VARCHAR(50),@ItemId INT,@GameName VARCHAR(50))
AS
BEGIN TRANSACTION
DECLARE @userId INT  = (SELECT Id FROM Users AS u WHERE u.Username=@Username)

DECLARE @IdOfItem INT  = (SELECT Id FROM Items AS i WHERE i.Id=@ItemId)

DECLARE @GameId INT  = (SELECT Id FROM Games AS g WHERE g.Name=@GameName)



IF ( @IdOfItem IS NULL)
BEGIN
	ROLLBACK;
	THROW 50002, 'Invalid ItemId',1
	RETURN
END

IF (@userId IS NULL )
BEGIN
	ROLLBACK;
	THROW 50001, 'Invalid UserId',1
	RETURN
END




DECLARE @CASHofUser DECIMAL(15,2) = (SELECT Cash FROM UsersGames as ug JOIN Users u ON u.Id=ug.UserId WHERE u.Id=@userId AND ug.GameId=@GameId )
DECLARE @PRICEofItem DECIMAL(15,2)= (SELECT Price FROM Items WHERE Id=@ItemId)

IF(@CASHofUser < @PRICEofItem)
BEGIN
 ROLLBACK;
 THROW 50003,'Insufficient funds',1
 RETURN
END


UPDATE UsersGames
SET Cash-=@PRICEofItem
FROM UsersGames AS ug 
JOIN Users AS u ON ug.UserId= u.Id
WHERE u.Id=@userId

INSERT INTO UserGameItems(ItemId,UserGameId)VALUES
(@userId,@IdOfItem)

COMMIT




DECLARE @count INT =251;

WHILE (@count<=299)
BEGIN
EXEC usp_BuyItem 'baleremuda',@count,'Bali'
SET @count+=1
END

GO

DECLARE @count INT =251;

WHILE (@count<=299)
BEGIN
EXEC usp_BuyItem 'loosenoise',@count,'Bali'
SET @count+=1
END
 GO

 DECLARE @count INT =251;

WHILE (@count<=299)
BEGIN
EXEC usp_BuyItem 'inguinalself',@count,'Bali'
SET @count+=1
END
 GO


  DECLARE @count INT =251;

WHILE (@count<=299)
BEGIN
EXEC usp_BuyItem 'buildingdeltoid',@count,'Bali'
SET @count+=1
END
 GO


   DECLARE @count INT =251;

WHILE (@count<=299)
BEGIN
EXEC usp_BuyItem 'monoxidecos',@count,'Bali'
SET @count+=1
END
 GO

 ---4----

 SELECT Username,'Bali' AS Name,Cash,i.Name AS ItemName FROM Users AS u
 JOIN UsersGames AS ug ON ug.UserId=u.Id
 JOIN UserGameItems AS ugi ON ugi.UserGameId=ug.Id
 JOIN Items AS i ON i.Id=ugi.ItemId
 WHERE ug.GameId IN (SELECT Id FROM GAMES WHERE Name ='Bali')
 ORDER BY Username ASC ,Name ASC