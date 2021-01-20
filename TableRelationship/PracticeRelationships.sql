
CREATE TABLE Towns
(
Id INT IDENTITY PRIMARY KEY,
[Name] VARCHAR(20) NOT NULL

)

CREATE TABLE Courses
(
Id INT IDENTITY PRIMARY KEY,
[Name] VARCHAR(20) NOT NULL,
Description VARCHAR(MAX)
)
CREATE TABLE Students
(
Id INT IDENTITY PRIMARY KEY,
FirstName NVARCHAR(20),
LastName NVARCHAR(20),





)

INSERT INTO Students(FirstName,LastName) VALUES
('Joro','Ignatovi'),
('Bobi','Bobov'),
('Zarko','Ignatovic')

CREATE TABLE StudentsTownsCourses
(
StudentId INT ,
TownId INT,
CoursesId INT

CONSTRAINT PK_TownsCourses PRIMARY KEY(StudentId,TownId,CoursesId),

CONSTRAINt FK_StudentsId 
    FOREIGN KEY (StudentId) REFERENCES Students(Id),

CONSTRAINt FK_TownId 
    FOREIGN KEY (TownId) REFERENCES Towns(Id),

CONSTRAINT FK_CoursesId 
    FOREIGN KEY (CoursesId) REFERENCES Courses(Id),

)




INSERT INTO StudentsTownsCourses(StudentId,TownId,CoursesId)VALUES
(3,3,1),
(3,3,2),
(3,3,3)


SELECT s.FirstName+' '+s.LastName AS [Full Name],c.[Name],ISNULL(c.[Description],'No Info') AS [Description],t.Name
FROM StudentsTownsCourses stc
Join Courses c 
ON stc.CoursesId=c.Id
JOIN Students s
ON stc.StudentId=s.Id
JOIN Towns t
ON stc.TownId=t.Id

