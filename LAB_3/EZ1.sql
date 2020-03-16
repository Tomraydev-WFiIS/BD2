--EZ1
-- w nowszej wersji u¿y³bym STRING_AGG
USE AdventureWorks2008;
GO
IF OBJECT_ID('dbo.BEstring') IS NOT NULL
	DROP FUNCTION dbo.BEstring;
GO

CREATE FUNCTION dbo.BEstring(@BEID INT)
RETURNS nchar(255)
WITH RETURNS NULL ON NULL INPUT AS
BEGIN
RETURN(
	SELECT
		pp.LastName + ';' +
		pp.FirstName + ';' +
		pea.EmailAddress + ';' +
		pa.AddressLine1
	FROM Person.Person pp
	JOIN Person.EmailAddress pea ON pea.BusinessEntityID = pp.BusinessEntityID
	JOIN Person.BusinessEntityAddress pbea ON pbea.BusinessEntityID = pp.BusinessEntityID
	JOIN Person.BusinessEntity pbe ON pbe.BusinessEntityID = pp.BusinessEntityID
	JOIN Person.Address pa ON pa.AddressID = pbea.AddressID
	WHERE pbe.BusinessEntityID = @BEID
)
END

GO
SELECT dbo.BEstring(42);