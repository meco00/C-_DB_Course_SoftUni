SELECT * FROM
(
SELECT cur.CurrencyCode,
cur.Description AS Currency,
COUNT(*) AS NumberOfCountries
FROM Countries AS c
 JOIN Currencies AS cur ON cur.CurrencyCode=c.CurrencyCode
GROUP BY cur.CurrencyCode,cur.Description
) AS k
ORDER BY k.NumberOfCountries DESC,k.Currency ASC



