SELECT * FROM
(
SELECT C.CountryName,cont.ContinentName ,
ISNULL(COUNT(r.RiverName),0) AS RiversCount,
ISNULL(SUM(r.Length),0) AS TotalLength 
FROM Countries AS c
 JOIN Continents AS cont ON cont.ContinentCode=c.ContinentCode
LEFT JOIN CountriesRivers AS cr ON cr.CountryCode=c.CountryCode
LEFT JOIN Rivers AS r ON r.Id=cr.RiverId
GROUP BY C.CountryName,cont.ContinentName 
) AS k
ORDER BY k.RiversCount DESC,k.TotalLength DESC , k.CountryName ASC