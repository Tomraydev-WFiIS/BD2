--EZ2
USE AdventureWorks2008;
IF OBJECT_ID('dbo.get_records') IS NOT NULL
	DROP FUNCTION dbo.get_records;
GO

CREATE FUNCTION dbo.get_records(
	@min_index INT,
	@max_index INT)
RETURNS table
AS
RETURN
	SELECT pp.LastName, pe.EmailAddress, pa.AddressLine1, pa.AddressLine2, pa.City
	FROM Person.Person AS pp
	JOIN Person.EmailAddress AS pe ON pp.BusinessEntityID=pe.BusinessEntityID
	JOIN Person.BusinessEntityAddress AS pbea ON pp.BusinessEntityID=pbea.BusinessEntityID
	JOIN Person.Address AS pa ON pbea.AddressID=pa.AddressID
	WHERE
		pp.BusinessEntityID >= @min_index AND
		pp.BusinessEntityID <= @max_index
;
GO
SELECT * FROM dbo.get_records(1, 10);