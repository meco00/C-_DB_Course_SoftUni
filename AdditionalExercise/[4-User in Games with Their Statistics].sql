SELECT * FROM
(
SELECT 
u.Username , g.Name AS [Game],MAX(c.Name) AS [Character],
SUM(iStat.Strength)+MAX(gtStat.Strength)+MAX(cStat.Strength) AS [Strength],
SUM(iStat.Defence)+MAX(gtStat.Defence)+MAX(cStat.Defence) AS Defence,
SUM(iStat.Speed)+MAX(gtStat.Speed)+MAX(cStat.Speed) AS Speed,
SUM(iStat.Mind)+MAX(gtStat.Mind)+MAX(cStat.Mind) AS Mind,
SUM(iStat.Luck)+MAX(gtStat.Luck)+MAX(cStat.Luck) AS Luck
FROM Users AS u
LEFT JOIN UsersGames AS ug ON ug.UserId=u.Id
 LEFT JOIN Games AS g ON g.Id=ug.GameId
  LEFT  JOIN GameTypes AS gt ON gt.Id=g.GameTypeId
	LEFT	JOIN [Statistics] AS gtStat ON gtStat.Id=gt.BonusStatsId

LEFT JOIN Characters AS c ON c.Id=ug.CharacterId
	LEFT JOIN [Statistics] AS cStat ON cStat.Id=c.StatisticId

LEFT JOIN UserGameItems AS ugi ON ugi.UserGameId=ug.Id
	LEFT JOIN Items AS i ON i.Id=ugi.ItemId
	LEFT JOIN [Statistics] AS iStat ON iStat.Id=i.StatisticId
	GROUP BY u.Username , g.Name
) AS k 
ORDER BY Strength DESC,
Defence DESC,
Speed DESC,
Mind DESC ,
Luck DESC

