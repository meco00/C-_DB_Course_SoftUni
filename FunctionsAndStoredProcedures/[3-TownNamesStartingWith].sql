CREATE PROCEDURE usp_GetTownsStartingWith  (@Input VARCHAR(MAX)) 
AS
SELECT [Name]
	FROM
Towns
WHERE [Name] LIKE CONCAT(@Input,'%')
	
GO

EXEC usp_GetTownsStartingWith 'b'
