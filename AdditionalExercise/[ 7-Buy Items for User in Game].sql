


BEGIN TRANSACTION 

DECLARE @TotalCostOfItems DECIMAL (15,2) = (SELECT SUM(Price) FROM Items
WHERE Name IN ('Blackguard', 'Bottomless Potion of Amplification', 
'Eye of Etlich (Diablo III)', 'Gem of Efficacious Toxin', 
'Golden Gorget of Leoric' , 'Hellfire Amulet'))



--SELECT ug.Id FROM Users AS u
--JOIN UsersGames AS ug ON ug.UserId=u.Id
--JOIN Games AS g ON g.Id=ug.GameId
--WHERE u.Username='Alex' AND  
--g.Name='Edinburgh'

UPDATE UsersGames
SET Cash -= @TotalCostOfItems 
WHERE Id=235

INSERT INTO UserGameItems(ItemId,UserGameId)
SELECT Id,235 FROM Items
WHERE Name IN ('Blackguard', 'Bottomless Potion of Amplification', 
'Eye of Etlich (Diablo III)', 
'Gem of Efficacious Toxin', 'Golden Gorget of Leoric' , 'Hellfire Amulet')

COMMIT


SELECT u.Username ,'Edinburgh' AS [Game],ug.Cash,i.Name AS [Item Name] FROM UsersGames AS ug
JOIN  Users AS u ON u.Id=ug.UserId
JOIN UserGameItems AS ugi ON ugi.UserGameId=ug.Id
JOIN Items AS i ON i.Id=ugi.ItemId
WHERE ug.GameId=221
ORDER BY i.Name ASC