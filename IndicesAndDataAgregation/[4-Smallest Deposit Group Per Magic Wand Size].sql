
SELECT TOP(2) k.DepositGroup FROM
(

SELECT DepositGroup,AVG(MagicWandSize) AS [AvgMagicWSize]
FROM WizzardDeposits
GROUP BY(DepositGroup)
) AS k
ORDER BY k.AvgMagicWSize 
