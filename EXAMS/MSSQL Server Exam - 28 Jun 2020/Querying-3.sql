--5
SELECT j.Id,
FORMAT(j.JourneyStart,'dd/MM/yyyy') AS JourneyStart ,
FORMAT(j.JourneyEnd,'dd/MM/yyyy') 
FROM Journeys AS j
WHERE j.Purpose='Military'
ORDER BY JourneyStart ASC

--6
SELECT Id,FirstName+' '+LastName AS FullName FROM Colonists
WHERE Id IN (SELECT ColonistId 
				FROM TravelCards WHERE JobDuringJourney ='Pilot')
ORDER BY Id ASC

--7
SELECT COUNT(*) AS count FROM Colonists
WHERE Id IN (SELECT ColonistId 
			FROM TravelCards 
			WHERE JourneyId IN (SELECT Id 
								FROM Journeys 
								WHERE Purpose='Technical'))



--8
SELECT s.Name,s.Manufacturer 
FROM Colonists AS c
JOIN TravelCards AS tc ON tc.ColonistId=c.Id
JOIN Journeys AS j ON j.Id=tc.JourneyId
JOIN Spaceships AS s ON s.Id=j.SpaceshipId
WHERE tc.JobDuringJourney='Pilot' AND DATEDIFF(YEAR,c.BirthDate,'01/01/2019') < 30
ORDER BY s.Name


--9
SELECT p.Name,COUNT(j.Id) AS [Count] FROM Planets AS p 
JOIN Spaceports AS s ON s.PlanetId=p.Id
JOIN Journeys AS j ON j.DestinationSpaceportId=s.Id
GROUP BY p.Name
ORDER BY Count DESC,p.Name ASC



--10
SELECT *  FROM
(
SELECT tc.JobDuringJourney,c.FirstName+' '+c.LastName AS [FullName],
ROW_NUMBER() OVER (PARTITION BY tc.JobDuringJourney ORDER BY c.BirthDate ASC )
AS [JobRank]
FROM Colonists AS c
JOIN TravelCards AS tc ON tc.ColonistId=c.Id
) AS k
WHERE k.[JobRank] = 2 


