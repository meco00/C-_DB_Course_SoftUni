--11
CREATE VIEW v_UserWithCountries  AS
SELECT CONCAT(cus.FirstName,' ',cus.LastName) AS CustomerName,cus.Age,cus.Gender,c.Name
FROM Customers AS cus
JOIN Countries AS c ON c.Id =cus.CountryId


GO
--12
CREATE TRIGGER tr_ProductsDelete ON Products INSTEAD OF DELETE
AS

DELETE FROM ProductsIngredients
WHERE ProductId IN (SELECT deleted.Id FROM deleted)

DELETE FROM Feedbacks
WHERE ProductId IN (SELECT deleted.Id FROM deleted)

DELETE FROM Products
WHERE Id IN (SELECT deleted.Id FROM deleted)


GO

DELETE FROM Products
WHERE Id=7

