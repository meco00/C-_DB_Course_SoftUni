--5
SELECT FirstName,LastName,
FORMAT(BirthDate,'MM-dd-yyyy') AS BirthDate,
c.Name,
Email
FROM Accounts AS a
JOIN Cities AS c ON c.Id=a.CityId
WHERE Email LIKE 'e%'
ORDER BY c.Name

--6
SELECT c.Name,COUNT(h.Id) AS [HotelCount] FROM Cities AS c
 JOIN Hotels AS h ON h.CityId=c.Id

GROUP BY c.Name
ORDER BY HotelCount DESC,c.Name ASC

--7
SELECT a.Id,a.FirstName+' '+a.LastName  AS FullName,
MAX(DATEDIFF(DAY,t.ArrivalDate,t.ReturnDate)) AS LongestTrip,
MIN(DATEDIFF(DAY,t.ArrivalDate,t.ReturnDate)) AS ShortestTrip
FROM Accounts AS a
JOIN AccountsTrips AS ac ON ac.AccountId=a.Id
JOIN Trips AS t ON t.Id=ac.TripId
WHERE t.CancelDate IS NULL AND a.MiddleName IS NULL
GROUP BY a.Id,a.FirstName,a.LastName 
ORDER BY LongestTrip DESC ,ShortestTrip ASC

--8
SELECT TOP(10) c.Id,
c.Name,
c.CountryCode,
COUNT(a.Id) AS AccountCount 
FROM Accounts AS a 
JOIN Cities AS c ON c.Id=a.CityId
GROUP BY c.Id,c.Name,c.CountryCode
ORDER BY AccountCount DESC

--9
SELECT a.Id,
a.Email,
c.Name,COUNT(c.Id) AS TripsCount 

FROM Accounts AS a
	JOIN AccountsTrips AS at ON at.AccountId=a.Id
	 JOIN Trips AS t ON t.Id=at.TripId
	    JOIN Rooms AS r ON r.Id=t.RoomId
	       JOIN Hotels AS h ON h.Id=r.HotelId
	          JOIN Cities AS c ON c.Id=a.CityId
WHERE h.CityId=a.CityId
GROUP BY a.Id,a.Email,c.Name
ORDER BY TripsCount DESC,a.Id ASC

--10
--GDPR

SELECT t.Id AS [Id] ,
CONCAT(a.FirstName,' ',IIF(a.MiddleName IS NULL,'',a.MiddleName+' '),a.LastName) AS [Full Name],
ac.Name AS [From],
c.Name AS [To],
IIF(t.CancelDate IS NOT NULL,'Canceled',CONVERT(varchar, DATEDIFF(DAY,t.ArrivalDate,t.ReturnDate)) 
+	' days'	)
AS Diff
FROM Accounts AS a
JOIN Cities AS ac ON ac.Id=a.CityId
JOIN AccountsTrips AS at ON at.AccountId=a.Id
	 JOIN Trips AS t ON t.Id=at.TripId
	    JOIN Rooms AS r ON r.Id=t.RoomId
	       JOIN Hotels AS h ON h.Id=r.HotelId
	          JOIN Cities AS c ON c.Id=h.CityId
ORDER BY [Full Name],t.Id
			





