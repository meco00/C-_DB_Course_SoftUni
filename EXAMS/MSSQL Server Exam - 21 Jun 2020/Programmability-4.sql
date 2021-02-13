--11
CREATE OR ALTER FUNCTION udf_GetAvailableRoom(@HotelId INT, @Date DATE, @People INT)
RETURNS VARCHAR(MAX)
AS
BEGIN
DECLARE @OutputInfo VARCHAR(MAX);

DECLARE @FreeRoomId INT= (SELECT TOP(1) r.Id FROM Trips AS t
							JOIN Rooms AS r
							ON r.Id=t.Id
							WHERE r.HotelId=@HotelId AND t.CancelDate IS  NULL AND @Date NOT BETWEEN t.ArrivalDate AND t.ReturnDate
							AND r.Beds >= @People
							ORDER BY (r.Price*@People) DESC)

IF(@FreeRoomId IS NULL)
BEGIN
SET @OutputInfo ='No rooms available'
END
ELSE
BEGIN
DECLARE @RoomType VARCHAR(MAX)=(SELECT Type FROM Rooms
					WHERE Id=@FreeRoomId)

DECLARE @BedOfRoom INT = (SELECT Beds FROM Rooms
					WHERE Id=@FreeRoomId)

DECLARE @TotalPrice DECIMAL(18,2) =(SELECT (r.Price+h.BaseRate) *2  FROM Trips AS t
							JOIN Rooms AS r
							ON r.Id=t.Id
							JOIN Hotels AS h ON h.Id=r.HotelId
							 AND r.Id=@FreeRoomId)

SET @OutputInfo ='Room '+CONVERT(varchar,@FreeRoomId)+': ' +CONVERT(varchar,@RoomType)+ ' ('+CONVERT(varchar,@BedOfRoom)+' beds'+') '+ '-'+ ' $'+CONVERT(varchar,@TotalPrice)

END

RETURN @OutputInfo

END

GO

SELECT dbo.udf_GetAvailableRoom(112, '2011-12-17', 2)
SELECT dbo.udf_GetAvailableRoom(94, '2015-07-26', 3)


--12

CREATE PROCEDURE usp_SwitchRoom(@TripId INT , @TargetRoomId INT)
AS

DECLARE @CurrentHotelId INT =(SELECT r.HotelId FROM Trips AS t
							JOIN Rooms AS r ON r.Id=t.RoomId
							WHERE t.Id=@TripId )

DECLARE @TargetHotelId INT =(SELECT HotelId FROM Rooms
								WHERE Id=@TargetRoomId)

IF(@CurrentHotelId != @TargetHotelId)
THROW 50001,'Target room is in another hotel!',1


DECLARE @PeopleCount INT =(SELECT COUNT(*) FROM AccountsTrips AS ac
						WHERE ac.TripId=@TripId)

IF(@PeopleCount > (SELECT Beds FROM Rooms
					WHERE Id=@TargetRoomId))
THROW 50002,'Not enough beds in target room!',1


UPDATE Trips
SET RoomId=@TargetRoomId
WHERE Id=@TripId

GO

EXEC usp_SwitchRoom 10, 11
SELECT RoomId FROM Trips WHERE Id = 10

EXEC usp_SwitchRoom 10, 7
EXEC usp_SwitchRoom 10, 8
