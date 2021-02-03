CREATE FUNCTION ufn_GetSalaryLevel(@salary DECIMAL(18,4)) 
RETURNS VARCHAR(MAX)
AS
BEGIN
	DECLARE @Level  AS VARCHAR(MAX) 
	
	IF(@salary < 30000)
	  SET @Level ='Low'
	  ELSE IF(@salary <= 50000)
	  SET @Level ='Average'
	  ELSE IF(@salary > 50000)
	  SET @Level ='High'
	  ELSE
	  SET @Level = NULL
							
RETURN @Level
	
		
END;



