CREATE TABLE Employees
(
--Id, FirstName, LastName, Title, Notes

Id INT IDENTITY PRIMARY KEY,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Title VARCHAR(50) NOT NULL,
Notes VARCHAR(MAX) 
)



INSERT INTO Employees(FirstName,LastName,Title,Notes) VALUES

('Petur','Niki','Upravitel',NULL),
('Vanka','Miki','Owner',NULL),
('Naiden','Michael','Rabotnik',NULL)




CREATE TABLE Customers
(


AccountNumber INT IDENTITY PRIMARY KEY,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
PhoneNumber CHAR(10) NOT NULL,
EmergencyName VARCHAR(50) ,
EmergencyNumber CHAR(10) ,
Notes VARCHAR(MAX) 

)




INSERT INTO Customers(FirstName,LastName,PhoneNumber,EmergencyName,EmergencyNumber,Notes) VALUES

('Petur','Niki','0892131231',NULL,NULL,NULL),
('Michael','Niki','0892631231',NULL,NULL,NULL),
('Hoshka','Niki','0892151231',NULL,NULL,NULL)




CREATE TABLE RoomStatus 
(

RoomStatus VARCHAR(10) NOT NULL PRIMARY KEY,

Notes VARCHAR(MAX) 

)


INSERT INTO RoomStatus(RoomStatus,Notes) VALUES

('Free',NULL),
('Reserved',NULL),
('DontUsing',NULL)


CREATE TABLE RoomTypes 
(

RoomType VARCHAR(10) NOT NULL PRIMARY KEY,

Notes VARCHAR(MAX) 

)





INSERT INTO RoomTypes(RoomType,Notes) VALUES

('VIP',NULL),
('MIDDLE-VIP',NULL),
('Cheaper',NULL)


CREATE TABLE BedTypes 
(

BedType VARCHAR(50) NOT NULL PRIMARY KEY,

Notes VARCHAR(MAX)

)



INSERT INTO BedTypes(BedType,Notes) VALUES

('Comfort',NULL),
('Beko',NULL),
('Prima',NULL)


CREATE TABLE Rooms 
(

--RoomNumber, RoomType, BedType, Rate, RoomStatus, Notes
 RoomNumber INT IDENTITY PRIMARY KEY,
RoomType VARCHAR(50) NOT NULL ,
BedType VARCHAR(50) NOT NULL,
Rate DECIMAL(18,2) NOT NULL,
RoomStatus VARCHAR(10) NOT NULL,
Notes VARCHAR(MAX) 


)


INSERT INTO Rooms(RoomType,BedType,Rate,RoomStatus,Notes) VALUES

('VIP','Comfort',50.55,'Reserved',NULL),

('MIDDLE-VIP','Beko',10.51,'Free',NULL),

('Cheaper','Prima',2.56,'DontUsing',NULL)

CREATE TABLE PAYMENTS
(

Id INT IDENTITY PRIMARY KEY,

EmployeeId INT NOT NULL,
PaymentDate SMALLDATETIME NOT NULL,
AccountNumber INT NOT NULL ,

FirstDateOccupied SMALLDATETIME NOT NULL,
LastDateOccupied SMALLDATETIME NOT NULL,


TotalDays AS DATEDIFF(DAY,FirstDateOccupied,LastDateOccupied),



AmountCharged DECIMAL(18,2) NOT NULL,

TaxRate INT NOT NULL,



TaxAmount   DECIMAL(18,2)  NOT NULL,



PaymentTotal  DECIMAL(18,2) NOT NULL,

Notes VARCHAR(MAX) 

)

INSERT INTO PAYMENTS(EmployeeId,PaymentDate,AccountNumber,FirstDateOccupied,LastDateOccupied,AmountCharged,TaxRate,TaxAmount,PaymentTotal,Notes) VALUES

(1,GETDATE(),1,GETDATE(),GETDATE(),1500,100,20,2000,NULL),
(2,GETDATE(),2,GETDATE(),GETDATE(),1500,100,20,2000,NULL),
(3,GETDATE(),3,GETDATE(),GETDATE(),1500,100,20,2000,NULL)



CREATE TABLE Occupancies
(


Id INT IDENTITY PRIMARY KEY,

EmployeeId INT NOT NULL,

DateOccupied SMALLDATETIME NOT NULL,

AccountNumber SMALLDATETIME NOT NULL,

RoomNumber INT NOT NULL,

RateApplied DECIMAL(18,2) NOT NULL,

PhoneCharge BIT ,

Notes VARCHAR(MAX)

)

--Bonus

ALTER TABLE Occupancies ADD
CONSTRAINT FK_Occupancies_EmployeeId
		FOREIGN KEY (EmployeeId)
			REFERENCES Employees (Id)

ALTER TABLE Occupancies ADD
			CONSTRAINT FK_Occupancies_RoomNumber
		FOREIGN KEY (RoomNumber)
			REFERENCES Rooms (RoomNumber)
-------

INSERT INTO Occupancies(EmployeeId,DateOccupied,AccountNumber,RoomNumber,RateApplied,PhoneCharge,Notes) VALUES
(1,GETDATE(),1,1,10.5,NULL,NULL),
(2,GETDATE(),2,2,11.5,NULL,NULL),
(3,GETDATE(),3,3,12.5,NULL,NULL)


