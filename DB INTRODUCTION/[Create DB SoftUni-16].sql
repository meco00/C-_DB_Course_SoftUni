CREATE TABLE Towns
(
Id INT IDENTITY PRIMARY KEY,
[Name] VARCHAR(50) NOT NULL

)


CREATE TABLE Addresses 
(

Id INT IDENTITY PRIMARY KEY,
AddressText VARCHAR(50) ,
TownId  INT NOT NULL

 CONSTRAINT FK_AddressesTownId FOREIGN KEY (TownId)
    REFERENCES Towns(Id)

)

CREATE TABLE Departments 
(
Id INT IDENTITY PRIMARY KEY,
[Name] VARCHAR(50) NOT NULL

)

CREATE TABLE Employees
(
--Id, FirstName, MiddleName, LastName, JobTitle, DepartmentId, HireDate, Salary, AddressId
Id INT IDENTITY PRIMARY KEY,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
JobTitle VARCHAR(50) NOT NULL,
DepartmentId INT NOT NULL,
HireDate SMALLDATETIME,
Salary DECIMAL(7,2) NOT NULL,
AddressId INT NOT NULL

 CONSTRAINT FK_EmployeesDepartmentId FOREIGN KEY (DepartmentId)
    REFERENCES Departments(Id),

	CONSTRAINT FK_EmployeesAddressId
	FOREIGN KEY (AddressId)
    REFERENCES Addresses(Id)

)