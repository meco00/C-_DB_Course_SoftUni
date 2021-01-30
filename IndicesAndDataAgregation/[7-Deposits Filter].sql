
SELECT * FROM
(

SELECT DepositGroup,SUM(DepositAmount)  AS [TotalSum]
FROM 
WizzardDeposits
WHERE MagicWandCreator='Ollivander family'
GROUP BY (DepositGroup)

) AS k
WHERE k.TotalSum < 150000
ORDER BY k.TotalSum DESC

