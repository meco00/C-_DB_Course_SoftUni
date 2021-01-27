
SELECT TOP(5) Country,
[Highest Peak Name],
[Highest Peak Elevation],
Mountain 
FROM (
    SELECT c.CountryName AS [Country],
CASE 
   WHEN p.PeakName IS NULL THEN '(no highest peak)' 
   ELSE P.PeakName
   END AS [Highest Peak Name], 

CASE 
   WHEN p.Elevation IS NULL THEN 0
   ELSE p.Elevation
   END AS [Highest Peak Elevation],

   CASE 
   WHEN m.MountainRange IS NULL THEN '(no mountain)' 
   ELSE m.MountainRange
   END AS [Mountain],

   DENSE_RANK() OVER (PARTITION BY c.CountryName ORDER BY  p.Elevation DESC)
   AS [Rank]

 FROM Countries AS c
   LEFT JOIN MountainsCountries AS mc
 ON c.CountryCode=mc.CountryCode
   LEFT JOIN Mountains AS m
 ON mc.MountainId=m.Id
   LEFT JOIN Peaks AS p
 ON m.Id=p.MountainId
 
 ) AS k
 WHERE k.Rank=1
 ORDER BY k.Country ASC,K.[Highest Peak Name] ASC