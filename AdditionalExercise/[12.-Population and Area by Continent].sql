SELECT * FROM
(
SELECT cont.ContinentName,
SUM(CAST(c.AreaInSqKm AS BIGINT)) AS CountriesArea,
SUM(CAST(c.Population AS BIGINT)) AS CountriesPopulation
FROM Continents AS cont
JOIN Countries AS c ON c.ContinentCode=cont.ContinentCode
GROUP BY cont.ContinentName
) AS k
ORDER BY k.CountriesPopulation DESC