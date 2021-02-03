CREATE  FUNCTION ufn_CashInUsersGames (@GameName VARCHAR(MAX))
RETURNS TABLE
AS
RETURN 
SELECT SUM(k.Cash) AS [SumCash] FROM
(
SELECT Name,Cash ,ROW_NUMBER() OVER (ORDER BY CASH DESC) AS [RowNumber]
  FROM UsersGames AS us
  JOIN Games AS g
  ON g.Id=us.GameId
WHERE g.Name = @GameName 
) AS k
WHERE K.RowNumber % 2 = 1

GO