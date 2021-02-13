--5
SELECT Id,Message,RepositoryId,ContributorId FROM Commits
ORDER BY Id,Message,RepositoryId,ContributorId

--6
SELECT Id,Name,Size FROM Files
WHERE Size >1000 AND NAME LIKE '%html%'
ORDER BY Size DESC,Id ASC ,Name ASC

--7

SELECT i.Id,
CONCAT(u.Username,' : ',+i.Title)
FROM Issues AS i
JOIN Users AS u ON u.Id=i.AssigneeId
ORDER BY i.Id DESC,I.AssigneeId ASC

--8
SELECT f.Id,f.Name,CAST(f.Size as varchar)+'KB' AS Size
FROM Files AS f
WHERE NOT EXISTS (SELECT Id FROM Files 
					WHERE ParentId=f.Id	)
ORDER BY f.Id ASC ,f.Name ASC,f.Size DESC

--9
SELECT TOP(5) r.Id,r.Name,COUNT(c.Id) AS Commits FROM Repositories AS r
JOIN RepositoriesContributors AS rc ON rc.RepositoryId=r.Id
JOIN Commits AS c ON c.RepositoryId=r.Id
GROUP BY r.Id,r.Name
ORDER BY Commits DESC,r.Id ASC,r.Name ASC

--10
SELECT u.Username,AVG(f.Size) as Average FROM Users AS u
JOIN Commits AS c ON c.ContributorId=u.Id
JOIN Files AS f ON f.CommitId=c.Id
GROUP BY u.Username
ORDER BY Average DESC,u.Username ASC







