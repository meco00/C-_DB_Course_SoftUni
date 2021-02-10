SELECT p.PeakName,m.MountainRange,p.Elevation FROM Peaks AS p
JOIN Mountains AS m ON m.Id=p.MountainId
ORDER BY P.Elevation DESC ,p.PeakName ASC