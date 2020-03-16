USE AdventureWorks2008;
GO

CREATE FUNCTION dbo.zad1(@BEntID INT)
RETURNS nchar(100)
WITH RETURNS NULL ON NULL INPUT
AS
BEGIN
RETURN (SELECT pp.LastName + ';' + pp.FirstName + ';' + pea.EmailAddress + ';' + pa.AddressLine1 FROM Person.Person pp JOIN Person.EmailAddress pea ON pea.BusinessEntityID = pp.BusinessEntityID JOIN Person.BusinessEntityAddress pbea ON pbea.BusinessEntityID = pp.BusinessEntityID JOIN Person.BusinessEntity pbe ON pbe.BusinessEntityID = pp.BusinessEntityID JOIN Person.Address pa ON pa.AddressID = pbea.AddressID
where pbe.BusinessEntityID = 1)
END

GO
SELECT dbo.zad1(4);