--11
CREATE PROCEDURE usp_PlaceOrder (@jobID INT,  @serialNumber CHAR(50) ,@quantity INT)
AS
BEGIN TRANSACTION
IF EXISTS (SELECT * FROM Jobs WHERE JobId=@jobID AND Status = 'Finished')
BEGIN
ROLLBACK;
  THROW 50011 ,'This job is not active!',1;
END;

IF (@quantity<=0)
BEGIN
ROLLBACK;
   THROW 50012 ,'Part quantity must be more than zero!',1;
END

IF  (SELECT COUNT(*) FROM Jobs WHERE JobId=@jobID ) = 0
BEGIN
ROLLBACK;
		THROW 50013 ,'Job not found!',1;
END



DECLARE @PartId INT = (SELECT PartId FROM Parts WHERE SerialNumber=@serialNumber)

IF (@PartId IS NULL)
BEGIN
ROLLBACK;
 THROW 50014 ,'Part not found!',1;
END


DECLARE @OrderId INT=(SELECT OrderId FROM Orders WHERE JobId=@jobID AND IssueDate IS NULL AND Delivered =0 );



IF (@OrderId IS NULL)
BEGIN
	INSERT INTO Orders(JobId,IssueDate,Delivered)VALUES
	(@jobID,NULL,0)
	
	SET @OrderId =(SELECT OrderId FROM Orders WHERE JobId=@jobID AND IssueDate IS NULL AND Delivered =0 )

END

DECLARE @OrderPartQty INT =(SELECT Quantity FROM OrderParts 
			WHERE OrderId = @OrderId
			AND PartId =@PartId)

IF  (@OrderPartQty IS NULL)
BEGIN
	
	INSERT INTO OrderParts(OrderId,PartId,Quantity) VALUES
	(@OrderId,@PartId,@quantity)
	
	
END

ELSE
	BEGIN 
	
	UPDATE OrderParts
	SET Quantity+=@quantity
	WHERE OrderId = @OrderId
		AND PartId = @PartId

END



COMMIT

GO


DECLARE @err_msg AS NVARCHAR(MAX);
BEGIN TRY
  EXEC usp_PlaceOrder 1, 'ZeroQuantity', 0
END TRY

BEGIN CATCH
  SET @err_msg = ERROR_MESSAGE();
  SELECT @err_msg
END CATCH


--12
GO

CREATE FUNCTION udf_GetCost (@JobId INT)
RETURNS DECIMAL(18,2)
AS
BEGIN 
DECLARE @TotalSum DECIMAL(18,2) = (SELECT ISNULL(SUM(p.Price*op.Quantity),0) FROM Jobs  AS j
									JOIN Orders AS o ON o.JobId=j.JobId
									JOIN OrderParts AS op ON op.OrderId=o.OrderId
									JOIN Parts AS p ON p.PartId=op.PartId
									WHERE j.JobId=@JobId)

RETURN @TotalSum
END

GO