CREATE TABLE Subjects
(
SubjectID INT IDENTITY PRIMARY KEY,
SubjectName NVARCHAR(50) NOT NULL
)


CREATE TABLE Majors
(
MajorID INT IDENTITY PRIMARY KEY,
[Name] NVARCHAR(50) NOT NULL
)


CREATE TABLE Students
(
StudentID INT IDENTITY PRIMARY KEY,
StudentNumber INT  UNIQUE NOT NULL,
StudentName NVARCHAR(50) NOT NULL,
MajorID INT NOT NULL,
 CONSTRAINT FK_Students_Major 
   FOREIGN KEY (MajorID) REFERENCES Majors(MajorID)
)



CREATE TABLE Agenda
(
StudentID INT NOT NULL,
SubjectID INT NOT NULL,
 CONSTRAINT PK_Composite_Student_Subject 
   PRIMARY KEY(StudentID,SubjectID),

 CONSTRAINT FK_Agenda_SubjectID 
    FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID),

	 CONSTRAINT FK_Agenda_StudentID
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)



)


CREATE TABLE Payments
(
PaymentID INT IDENTITY PRIMARY KEY,
PaymentDate DATE NOT NULL,
PaymentAmount DECIMAL(18,2) NOT NULL,
StudentID INT NOT NULL,

 CONSTRAINT FK_Payments_StudentID FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
)

