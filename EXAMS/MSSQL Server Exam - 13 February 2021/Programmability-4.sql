CREATE FUNCTION udf_AllUserCommits(@username VARCHAR(MAX))
RETURNS INT
AS
BEGIN

DECLARE @Count INT = (SELECT COUNT(*) FROM Users AS u
						JOIN Commits AS c ON c.ContributorId=u.Id
							where u.Username=@username)

RETURN @Count

END
GO



--12
CREATE PROCEDURE usp_SearchForFiles(@fileExtension VARCHAR(MAX))
AS

SELECT Id,Name,CAST(Size as varchar)+'KB' AS Size
FROM Files
WHERE Name Like '%'+@fileExtension
ORDER BY Id ASC,Name ASC,Size DESC


GO


