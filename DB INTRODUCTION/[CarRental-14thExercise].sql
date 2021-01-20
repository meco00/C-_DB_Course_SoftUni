CREATE TABLE Categories 
(
Id  INT NOT NULL PRIMARY KEY,
CategoryName VARCHAR(50) NOT NULL,
DailyRate DECIMAL(18,2) NOT NULL,
WeeklyRate DECIMAL(18,2) NOT NULL,
MonthlyRate DECIMAL(18,2) NOT NULL,
WeekendRate DECIMAL(18,2) NOT NULL,


)

INSERT INTO Categories(Id,CategoryName,DailyRate,WeeklyRate,MonthlyRate,WeekendRate) VALUES
(1,'Zaza',15.52,50.51,1500.15,10.1),
(2,'Zaza',15.52,50.51,1500.15,10.1),
(3,'Zaza',15.52,50.51,1500.15,10.1)


CREATE TABLE CARS
(
--Id, PlateNumber, Manufacturer, Model, CarYear, CategoryId, Doors, Picture, Condition, Available
Id  INT NOT NULL PRIMARY KEY,
PlateNumber VARCHAR(10) ,
Manufacturer VARCHAR(10) NOT NULL,
Model VARCHAR(10) NOT NULL,
CarYear INT NOT NULL,
CategoryId INT NOT NULL ,
Doors TINYINT NOT NULL,
Picture VARCHAR(50) ,
Condition VARCHAR(50) ,
Available BIT NOT NULL


)

INSERT INTO CARS(Id,PlateNumber,Manufacturer,Model,CarYear,CategoryId,Doors,Picture,Condition,Available) VALUES
(1,'K1564BK','BMW','E36',1990,1,2,NULL,NULL,1),
(2,'K1569BK','BMW','E90',2015,1,2,NULL,NULL,2),
(3,'K1560BK','NISSAN','GTR',2015,1,2,NULL,NULL,3)


CREATE TABLE Employees
(

Id  INT NOT NULL PRIMARY KEY,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Title VARCHAR(50) NOT NULL, 
NOTES VARCHAR(MAX) 

)

INSERT INTO Employees(Id,FirstName,LastName,Title,NOTES) VALUES
(1,'Zaza','Zuzu','CEO',NULL),
(2,'Zaza','Zuzu','CTO',NULL),
(3,'Zaza','Zuzu','CGO',NULL)


CREATE TABLE Customers 
(
--Id, DriverLicenceNumber, FullName, Address, City, ZIPCode, Notes
Id  INT NOT NULL PRIMARY KEY,
DriverLicenceNumber VARCHAR(50) NOT NULL,
FullName VARCHAR(50) NOT NULL,
[Address] VARCHAR(50) NOT NULL,
City VARCHAR(50) NOT NULL,
ZIPCode VARCHAR(10) ,
Notes VARCHAR(MAX) 

)

INSERT INTO Customers(Id,DriverLicenceNumber,FullName,Address,City,ZIPCode,Notes) VALUES
(1,'NqmamNikakuvLicenz','NqkoiSi','NqkudeIzBg','Somewhere',NULL,NULL),
(2,'NqmamNikakuvLicenz','NqkoiSi','NqkudeIzBg','Somewhere',NULL,NULL),
(3,'NqmamNikakuvLicenz','NqkoiSi','NqkudeIzBg','Somewhere',NULL,NULL)

CREATE TABLE RentalOrders 
(
--Id, EmployeeId, CustomerId, CarId, TankLevel, KilometrageStart, 
--KilometrageEnd, TotalKilometrage, StartDate, EndDate, TotalDays, RateApplied, TaxRate, OrderStatus, Notes
Id  INT NOT NULL PRIMARY KEY,
EmployeeId INT NOT NULL UNIQUE,
CustomerId INT NOT NULL UNIQUE,
CarId INT NOT NULL UNIQUE,
TankLevel INT NOT NULL,
KilometrageStart INT NOT NULL,
KilometrageEnd INT NOT NULL,
TotalKilometrage INT NOT NULL,
StartDate SMALLDATETIME NOT NULL,
EndDate SMALLDATETIME NOT NULL,
TotalDays INT NOT NULL,
RateApplied DECIMAL(18,2) NOT NULL,
TaxRate DECIMAL(18,2) NOT NULL,
OrderStatus BIT NOT NULL,
Notes VARCHAR(MAX) 
)

INSERT INTO RentalOrders(Id,EmployeeId,CustomerId,CarId,TankLevel,KilometrageStart,KilometrageEnd,TotalKilometrage
,StartDate,EndDate,TotalDays,RateApplied,TaxRate,OrderStatus,Notes) VALUES

(1,1,1,1,100,0,150,150,'08-05-2025','11-05-2025',90,5.12,50,0,NULL),
(2,2,2,2,100,0,150,150,'08-05-2025','11-05-2025',90,5.12,50,0,NULL),
(3,3,3,3,100,0,150,150,'08-05-2025','11-05-2025',90,5.12,50,0,NULL)