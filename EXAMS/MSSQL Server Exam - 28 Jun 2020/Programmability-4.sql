--11
CREATE FUNCTION dbo.udf_GetColonistsCount(@PlanetName VARCHAR (30)) 
RETURNS INT
AS
BEGIN

DECLARE @Count INT = (SELECT COUNT(*) FROM Planets AS p
						JOIN Spaceports AS s ON s.PlanetId=p.Id
						JOIN Journeys AS j ON j.DestinationSpaceportId =s.Id
						JOIN TravelCards AS tc ON tc.JourneyId=j.Id
						JOIN Colonists AS c ON c.Id=tc.ColonistId
						WHERE p.Name=@PlanetName)

RETURN @Count
END
GO

SELECT dbo.udf_GetColonistsCount('Otroyphus')


--12
GO

CREATE PROCEDURE usp_ChangeJourneyPurpose(@JourneyId INT , @NewPurpose VARCHAR(MAX))
AS

DECLARE @IsJourneyExist INT= (SELECT Id FROM Journeys WHERE Id=@JourneyId)

IF(@IsJourneyExist IS NULL)
THROW 50001,'The journey does not exist!',1


DECLARE @CurrentJourneyPurpose VARCHAR(MAX) = (SELECT Purpose FROM Journeys WHERE Id=@JourneyId)

IF(@CurrentJourneyPurpose = @NewPurpose)
THROW 50002,'You cannot change the purpose!',1


UPDATE Journeys
SET Purpose=@NewPurpose
WHERE Id=@JourneyId




GO


EXEC usp_ChangeJourneyPurpose 4, 'Technical'
EXEC usp_ChangeJourneyPurpose 2, 'Educational'
EXEC usp_ChangeJourneyPurpose 196, 'Technical'
