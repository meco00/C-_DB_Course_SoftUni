
SELECT i.Name,i.Price,i.MinLevel,s.Strength,s.Defence,s.Speed,s.Luck,s.Mind 
FROM Items AS i
JOIN [Statistics] AS s ON s.Id=i.StatisticId

WHERE s.Mind > (SELECT AVG(Mind) FROM Items JOIN [Statistics] AS s ON s.Id=Items.Id) AND
 s.Luck > (SELECT AVG(Luck) FROM Items JOIN [Statistics] AS s ON s.Id=Items.Id) AND	
  s.Speed > (SELECT AVG(Speed) FROM Items JOIN [Statistics] AS s ON s.Id=Items.Id) 
  ORDER BY Name ASC



