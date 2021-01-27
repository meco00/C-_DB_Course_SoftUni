
SELECT  PeakName,  RiverName,
LOWER(CONCAT(SUBSTRING(PeakName,1,LEN(PeakName)-1),RiverName)) AS Mix
FROM
Peaks,Rivers
WHERE RIGHT(PeakName,1)=LEFT(RiverName,1)
ORDER BY Mix

USE Diablo
GO

SELECT TOP(50) Name,FORMAT(Start,'yyyy-MM-dd') AS Start
FROM Games
WHERE DATEPART(YEAR,Start) IN (2011, 2012)
ORDER BY Start, Name
