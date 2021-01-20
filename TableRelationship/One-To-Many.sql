CREATE TABLE Manufacturers
(
ManufacturerID INT IDENTITY PRIMARY KEY,
[Name] VARCHAR(50) NOT NULL,
EstablishedOn DATE NOT NULL
)

CREATE TABLE Models
(
ModelID INT IDENTITY(101,1) PRIMARY KEY,
[Name] VARCHAR(50) NOT NULL,
ManufacturerID INT NOT NULL,
 
CONSTRAINT FK_Models_Manufacturer 
FOREIGN KEY (ManufacturerID)
REFERENCES Manufacturers(ManufacturerID)
)

INSERT INTO Manufacturers(Name,EstablishedOn) VALUES
('BMW','07/03/1916'),
('Tesla','01/01/2003'),
('Lada','01/05/1966')


INSERT INTO Models(Name,ManufacturerID) VALUES
('X1',1),
('i6',1),
('Model S',2),
('Model X',2),
('Model 3',2),
('Nova',3)


--SELECT m.Name,man.Name,man.EstablishedOn 
--FROM Models AS m
--JOIN Manufacturers AS man
--ON m.ManufacturerID=man.ManufacturerID