CREATE TABLE Monasteries
(
Id INT IDENTITY PRIMARY KEY ,
[Name] VARCHAR(50) NOT NULL,
CountryCode CHAR(2) FOREIGN KEY REFERENCES Countries(CountryCode) NOT NULL
)

INSERT INTO Monasteries(Name,CountryCode) VALUES
('Rila Monastery “St. Ivan of Rila”', 'BG'), 
('Bachkovo Monastery “Virgin Mary”', 'BG'),
('Troyan Monastery “Holy Mother''s Assumption”', 'BG'),
('Kopan Monastery', 'NP'),
('Thrangu Tashi Yangtse Monastery', 'NP'),
('Shechen Tennyi Dargyeling Monastery', 'NP'),
('Benchen Monastery', 'NP'),
('Southern Shaolin Monastery', 'CN'),
('Dabei Monastery', 'CN'),
('Wa Sau Toi', 'CN'),
('Lhunshigyia Monastery', 'CN'),
('Rakya Monastery', 'CN'),
('Monasteries of Meteora', 'GR'),
('The Holy Monastery of Stavronikita', 'GR'),
('Taung Kalat Monastery', 'MM'),
('Pa-Auk Forest Monastery', 'MM'),
('Taktsang Palphug Monastery', 'BT'),
('Sümela Monastery', 'TR')

ALTER TABLE Countries
ADD IsDeleted  BIT  DEFAULT (0)
GO

UPDATE Countries
SET IsDeleted =0
GO


UPDATE c
SET c.IsDeleted = 1
FROM Countries AS c
WHERE c.CountryCode IN (SELECT c.CountryCode FROM CountriesRivers AS cr
						WHERE cr.CountryCode=c.CountryCode 
						HAVING COUNT(*) > 3 )


SELECT m.Name,c.CountryName FROM Monasteries  AS m
JOIN Countries AS c ON c.CountryCode=m.CountryCode
WHERE c.IsDeleted <> 1
ORDER BY m.Name ASC






