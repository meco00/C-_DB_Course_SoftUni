SELECT SUM(k.[Difference]) FROM
(
SELECT Host.FirstName AS [Host Wizard],
Host.DepositAmount AS [Host Wizard Deposit],
Guest.FirstName AS [Guest Wizard],
Guest.DepositAmount  AS [Guest Wizard Deposit] ,
Host.DepositAmount-Guest.DepositAmount
AS [Difference] 
FROM
WizzardDeposits AS Host
JOIN WizzardDeposits AS Guest
ON Host.Id+1=Guest.Id
) AS k

---2

SELECT SUM(m.Difference) FROM (
SELECT FirstName,
DepositAmount, 
LEAD(Firstname,1) OVER (  ORDER BY Id) AS [Guest Wizard],
LEAD(DepositAmount,1) OVER ( ORDER BY Id) AS [Guest Wizard Deposit],
(DepositAmount-LEAD(DepositAmount,1) OVER (ORDER BY Id)) AS [Difference]
FROM
WizzardDeposits
) AS m

--3
SELECT SUM(d.Difference) FROM
(
SELECT DepositAmount-LEAD(DepositAmount,1) OVER ( ORDER BY Id) AS [Difference] 
FROM 
WizzardDeposits
) AS d