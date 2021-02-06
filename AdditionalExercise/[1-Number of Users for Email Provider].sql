SELECT K.[Email Provider], COUNT([Email Provider]) AS [Number Of Users] FROM
(
SELECT SUBSTRING (Email,CHARINDEX('@',Email)+1 ,LEN(Email) - CHARINDEX('@',Email)) AS [Email Provider] 
FROM Users
) AS k
GROUP BY [Email Provider]
ORDER BY COUNT([Email Provider]) DESC , [Email Provider] ASC