--1
UPDATE Countries
SET CountryName='Burma'
WHERE CountryName='Myanmar'

--2
INSERT INTO Monasteries(Name,CountryCode) VALUES
('Hanga Abbey',(SELECT CountryCode FROM Countries WHERE CountryName LIKE 'Tanzania'))

--3
INSERT INTO Monasteries(Name,CountryCode) VALUES
('Myin-Tin-Daik',(SELECT CountryCode FROM Countries WHERE CountryName LIKE 'Burma'))

SELECT * FROM
(
SELECT cont.ContinentName,c.CountryName,COUNT(m.Name) AS [MonasteriesCount]  
FROM Continents AS cont
JOIN Countries AS c ON c.ContinentCode=cont.ContinentCode
LEFT JOIN Monasteries AS m ON m.CountryCode=c.CountryCode
WHERE c.IsDeleted <> 1
GROUP BY cont.ContinentName,c.CountryName
) AS k
ORDER BY k.MonasteriesCount DESC,k.CountryName

