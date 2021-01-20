

CREATE TABLE Cities
(
CityID INT IDENTITY PRIMARY KEY,
[Name] VARCHAR(50) NOT NULL,

)


CREATE TABLE Customers
(
CustomerID INT IDENTITY PRIMARY KEY,
[Name] VARCHAR(50) NOT NULL,
Birthday DATE ,
CityID INT FOREIGN KEY REFERENCES Cities(CityID)

)

CREATE TABLE Orders
(
OrderID INT  IDENTITY PRIMARY KEY,
CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID)
)

CREATE TABLE ItemTypes
(
ItemTypeID INT IDENTITY PRIMARY KEY,
[Name] VARCHAR(50) NOT NULL
)

CREATE TABLE Items
(
ItemID INT IDENTITY PRIMARY KEY,
[Name] VARCHAR(50) NOT NULL,
ItemTypeID INT FOREIGN KEY REFERENCES ItemTypes(ItemTypeID)

)


CREATE TABLE OrderItems
(
OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
ItemID INT FOREIGN KEY REFERENCES Items(ItemId)

CONSTRAINT PK_Order_Item PRIMARY KEY (OrderID,ItemID),



)


--SELECT * 
--FROM Orders AS orders
--JOIN Customers AS customers
--ON orders.CustomerID=customers.CustomerID
--JOIN Cities AS cities
--ON customers.CityId=cities.CityID
--JOIN OrderItems AS orderItems
--ON orders.OrderID=orderItems.OrderID
--JOIN Items AS items
--ON orderItems.ItemID=items.ItemID
--JOIN ItemTypes AS itemTypes
--ON items.ItemTypeID=itemTypes.ItemTypeID


