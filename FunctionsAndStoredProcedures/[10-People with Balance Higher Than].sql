CREATE PROCEDURE usp_GetHoldersWithBalanceHigherThan (@Number DECIMAL(18,2))
AS

SELECT FirstName,LastName
   FROM AccountHolders AS ah
   JOIN  Accounts as a
   ON a.AccountHolderId=ah.Id
   GROUP BY FirstName,LastName
   HAVING SUM(Balance) > @Number
   ORDER BY FirstName,LastName

   GO