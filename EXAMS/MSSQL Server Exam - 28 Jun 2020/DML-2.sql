INSERT INTO Planets(Name) VALUES
('Mars'),
('Earth'  ),
('Jupiter' ),
('Saturn'  )

INSERT INTO Spaceships(Name,Manufacturer,LightSpeedRate) VALUES
('Golf',	'VW',	3),
('WakaWaka',	'Wakanda',	4),
('Falcon9',	'SpaceX'	,1),
('Bed',	'Vidolov',	6)



--Update 
UPDATE Spaceships
SET LightSpeedRate+=1
WHERE Id BETWEEN 8 AND 12

--Delete
DELETE TravelCards
WHERE JourneyId IN (SELECT TOP(3) Id FROM Journeys
ORDER BY Id ASC)

DELETE Journeys
WHERE Id IN 
(SELECT TOP(3) Id FROM Journeys
  ORDER BY Id ASC)
  
