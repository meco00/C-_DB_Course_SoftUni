CREATE TABLE People
(
Id INT IDENTITY PRIMARY KEY,
[Name] NVARCHAR(50) NOT NULL,
Birthday SMALLDATETIME NOT NULL
)



INSERT INTO People([Name],Birthday) VALUES
('Victor','2000-12-07 00:00:00.000'),
('Steven','1992-09-10 00:00:00.000'),
('Stephen','1910-09-19 00:00:00.000'),
('John','2010-01-06 00:00:00.000')

SELECT [Name],
ABS(DATEDIFF(YEAR,GETDATE(),Birthday)) AS [Age in Years],
ABS(DATEDIFF(MONTH,GETDATE(),Birthday)) AS [Age in Months],
ABS(DATEDIFF(DAY,GETDATE(),Birthday)) AS [Age in Days],
ABS(DATEDIFF(MINUTE,GETDATE(),Birthday)) AS [Age in Minute]

FROM People