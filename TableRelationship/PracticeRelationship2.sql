
USE Geography



SELECT TOP(1) c.CountryName,c.Population,c.Capital,m.MountainRange,p.PeakName,p.Elevation
FROM Peaks P
JOIN Mountains m
ON p.MountainId=m.Id
JOIN MountainsCountries mc
ON m.Id=mc.MountainId
JOIN Countries c
ON mc.CountryCode=c.CountryCode
WHERE c.CountryName='Bulgaria'
ORDER BY p.Elevation DESC

