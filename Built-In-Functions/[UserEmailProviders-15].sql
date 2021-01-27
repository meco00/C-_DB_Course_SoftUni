

SELECT Username,
SUBSTRING(EMAIL,CHARINDEX('@',Email)+1,LEN(EMAIL)) AS [Email Provider]
FROM
Users
ORDER BY [Email Provider] ASC ,Username