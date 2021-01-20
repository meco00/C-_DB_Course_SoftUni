
CREATE TABLE Teachers
(
TeacherID INT IDENTITY(101,1) PRIMARY KEY,
[Name] NVARCHAR(50) NOT NULL,
ManagerID INT,
CONSTRAINT FK_ManagerID_TeachersID FOREIGN KEY (ManagerID) REFERENCES Teachers(TeacherID)
)


INSERT INTO Teachers(Name,ManagerID) VALUES
('John',NULL),
('Maya',106),
('Silvia',106),
('Ted',105),
('Mark',101),
('Greta',101)

--SELECT * FROM Teachers

--WHERE ManagerID=106