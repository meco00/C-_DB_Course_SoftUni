SELECT g.Name,gt.Name,u.Username,ug.Level,ug.Cash,c.Name 
FROM Users AS u
 JOIN UsersGames AS ug ON ug.UserId=u.Id
  JOIN Games AS g ON g.Id=ug.GameId
   JOIN Characters AS c ON ug.CharacterId=c.Id
	JOIN GameTypes AS gt ON gt.Id=g.GameTypeId 
	ORDER BY ug.Level DESC ,
	u.Username ASC,
	g.Name ASC