CREATE FUNCTION ufn_IsWordComprised(@setOfLetters VARCHAR(MAX), @word VARCHAR(MAX))
RETURNS BIT 
AS
BEGIN

DECLARE @Count INT 
SET @Count = 1

	 WHILE (@Count<=LEN(@word))
BEGIN
	IF(CHARINDEX((SUBSTRING(@word,@Count,1)),@setOfLetters) = 0)
     RETURN 0;
	ELSE
	SET @Count+=1;
END

RETURN 1
END


 



