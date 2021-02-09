--5
SELECT Name,Price,Description FROM Products
ORDER BY Price DESC,Name Asc

GO


--6
SELECT ProductId,Rate,Description,CustomerId,Age,Gender FROM Feedbacks
JOIN Customers AS c ON c.Id=Feedbacks.CustomerId
WHERE Rate < 5.0
ORDER BY ProductId DESC,Rate ASC 

GO

--7
SELECT CONCAT(c.FirstName,' ',c.LastName) AS CustomerName,c.PhoneNumber,c.Gender FROM Customers AS c
LEFT JOIN Feedbacks AS f ON f.CustomerId=c.Id
WHERE f.Id IS NULL
ORDER BY c.Id ASC

GO

--8
SELECT C.FirstName,C.Age,C.PhoneNumber FROM Customers AS c
WHERE c.Age>=21 AND c.FirstName LIKE '%an%' OR  c.PhoneNumber LIKE '%38'
AND c.CountryId !=31
ORDER BY c.FirstName ASC,c.Age DESC

GO

--9
SELECT d.[Name],i.Name AS IngredianName,p.Name AS ProductName, AVG(f.Rate)
FROM ProductsIngredients AS pi
JOIN Ingredients AS i ON i.Id=pi.IngredientId
JOIN Products AS p ON p.Id=pi.ProductId
JOIN Feedbacks AS f ON f.ProductId=p.Id
JOIN Distributors AS d ON d.Id=i.DistributorId

GROUP BY d.Name,i.Name,p.Name
HAVING AVG(f.Rate) BETWEEN 5 AND 8
ORDER BY d.Name,i.Name,p.Name 

GO

--10
SELECT k.CountryName,k.Distributor FROM
(
SELECT c.Name AS CountryName,d.Name AS Distributor,COUNT(i.Name) AS [Count],
DENSE_RANK() OVER (PARTITION BY c.Name ORDER BY COUNT(i.Name) DESC) AS [Rank]
FROM Countries AS c
JOIN Distributors AS d ON d.CountryId=c.Id
LEFT JOIN Ingredients AS i ON i.DistributorId=d.Id

GROUP BY c.Name,d.Name
) AS k
WHERE k.Rank=1
ORDER BY k.CountryName,k.Distributor