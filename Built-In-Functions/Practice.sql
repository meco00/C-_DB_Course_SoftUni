/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
      [FirstName],
      [LastName],
	 CONCAT(SUBSTRING(PaymentNumber,1,6),REPLICATE('*',LEN(PaymentNumber)-6)) 
	 AS PaymentNumber
     
  FROM [Demo].[dbo].[Customers]


  SELECT (A*H)*1/2  FROM Triangles2

 SELECT FLOOR(
 SQRT(SQUARE(X2-X1)+SQUARE(Y2-Y1)) 
 )  AS Length
 FROM Lines

 SELECT * 

 ,CEILING(
 1.0*Quantity/(BoxCapacity*PalletCapacity)
 ) AS NumberOfPalletes
 FROM
 Products

 USE Orders

 SELECT * 
 ,DATEPART(QUARTER,OrderDate) AS [Quarter]
 ,DATEPART(MONTH,OrderDate) AS [Month]
 ,DATEPART(YEAR,OrderDate) AS [Year]
  ,DATEPART(DAY,OrderDate) AS [Day]
 FROM Orders
 ORDER BY OrderDate ASC


 USE SoftUni


 SELECT 

 ROW_NUMBER() OVER(ORDER BY SALARY DESC) AS ROW_NUMB,
 RANK() OVER (ORDER BY SALARY DESC) AS RANK,
 DENSE_RANK() OVER(ORDER BY SALARY DESC) AS DENSE_RANK,
 NTILE(10) OVER (ORDER BY SALARY DESC) AS NTILE,
  FirstName,
  LastName,
  Salary,
  DepartmentID

 FROM Employees
