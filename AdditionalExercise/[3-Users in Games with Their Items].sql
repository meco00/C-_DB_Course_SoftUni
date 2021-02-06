SELECT 
u.Username,g.Name AS [Game],COUNT(i.Name) AS [Items Count] ,SUM(i.Price) AS [Items Price]
FROM
Users AS u
 JOIN UsersGames AS ug ON ug.UserId=u.id
  JOIN Games AS g ON g.Id=ug.GameId
	JOIN UserGameItems AS ugi ON ugi.UserGameId=ug.Id
	  JOIN Items AS i ON i.Id=ugi.ItemId
 GROUP BY u.Username,g.Name
   HAVING COUNT(i.Name) >=10 
    ORDER BY COUNT(i.Name) DESC,
      SUM(i.Price) DESC,
         u.Username ASC

