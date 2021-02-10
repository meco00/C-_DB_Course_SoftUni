SELECT i.Name AS [Item],i.Price,i.MinLevel,gt.Name AS [Forbidden Game Type] FROM Items AS i
JOIN GameTypeForbiddenItems AS gtfi ON gtfi.ItemId=i.Id
JOIN GameTypes AS gt ON gt.Id=gtfi.GameTypeId
ORDER BY [Forbidden Game Type] DESC , [Item] ASC