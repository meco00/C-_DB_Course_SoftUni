CREATE TABLE Students
(
StudentID INT IDENTITY PRIMARY KEY,
[Name] NVARCHAR(50) NOT NULL
)

CREATE TABLE Exams
(
ExamID INT IDENTITY(101,1) PRIMARY KEY,
[Name] NVARCHAR(50) NOT NULL
)


CREATE TABLE StudentsExams
(
StudentID INT ,
ExamID INT ,
CONSTRAINT PK_Student_Exams PRIMARY KEY (StudentID,ExamID),

CONSTRAINT FK_Students_ID FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
CONSTRAINT FK_Students_ExamID FOREIGN KEY (ExamID) REFERENCES Exams(ExamID)

)


INSERT INTO Exams([Name]) VALUES
('SpringMVC'),
('Neo4j'),
('Oracle 11g')
                                    

INSERT INTO Students([Name]) VALUES
('Mila'),
('Toni'),
('Ron')



INSERT INTO StudentsExams(StudentID,ExamID) VALUES
(1,101),
(1,102),
(2,101),
(3,103),
(2,102),
(2,103)

--SELECT s.Name,e.Name
--FROM StudentsExams AS se
--JOIN Students AS s
--ON se.StudentID=s.StudentID
--JOIN Exams AS e
--ON se.ExamID=e.ExamID