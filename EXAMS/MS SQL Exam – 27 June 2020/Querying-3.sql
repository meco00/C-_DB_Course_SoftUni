
--5
SELECT m.FirstName+ ' '+m.LastName AS Mechanic,
j.Status,j.IssueDate
FROM Jobs AS j
JOIN Mechanics AS m ON m.MechanicId=j.MechanicId
ORDER BY m.MechanicId,IssueDate ASC,j.JobId


--6
DECLARE @CurrentTime DATE ='2017-04-24'

SELECT c.FirstName+' '+c.LastName AS Client,
DATEDIFF(DAY,j.IssueDate,@CurrentTime) AS [Days going],
j.Status
FROM Jobs AS j
JOIN Clients AS c ON c.ClientId=j.ClientId
WHERE j.Status<>'Finished'
ORDER BY [Days going] DESC,c.ClientId ASC

--7
SELECT k.Mechanic,k.AvgDays FROM
(
SELECT m.MechanicId, m.FirstName+' '+m.LastName AS Mechanic  ,AVG(ISNULL(DATEDIFF(DAY,j.IssueDate,j.FinishDate ),0)) AS AvgDays
FROM Jobs AS j
JOIN Mechanics AS m ON m.MechanicId=j.MechanicId
WHERE j.FinishDate IS NOT NULL
GROUP BY m.MechanicId,m.FirstName,m.LastName
) AS k
ORDER BY k.MechanicId ASC 



--8

SELECT m.FirstName+' '+m.LastName AS Available FROM Mechanics AS m 
WHERE  m.MechanicId NOT IN  (SELECT MechanicId FROM Jobs WHERE Status IN ('Pending','In Progress') )

--9
SELECT j.JobId,ISNULL(SUM(op.Quantity*p.Price),0) AS TotalPrice 
FROM Jobs AS j
	LEFT JOIN Orders AS o ON o.JobId=j.JobId
	LEFT JOIN OrderParts AS op ON op.OrderId=o.OrderId
	LEFT JOIN Parts AS p ON p.PartId=op.PartId
WHERE j.Status='Finished'
GROUP BY j.JobId
ORDER BY TotalPrice DESC,j.JobId ASC


--10
SELECT p.PartId,p.Description,pn.Quantity AS Required,p.StockQty AS Stock ,ISNULL(op.Quantity,0) AS Ordered
FROM PartsNeeded AS pn
	LEFT JOIN JOBS AS j ON j.JobId=pn.JobId
	LEFT JOIN Parts AS p ON p.PartId=pn.PartId
	LEFT JOIN Orders AS o ON o.JobId=j.JobId
	LEFT JOIN OrderParts AS op ON op.OrderId=o.OrderId
	LEFT JOIN Parts AS pordered ON pordered.PartId=op.PartId
WHERE j.Status<>'Finished' AND pn.Quantity> ISNULL(op.Quantity,0) AND pn.Quantity>p.StockQty
ORDER BY p.PartId ASC