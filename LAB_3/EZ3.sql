--EZ3
USE AdventureWorks2008;
GO
IF OBJECT_ID('dbo.orders') IS NOT NULL
	DROP FUNCTION dbo.orders;
GO

CREATE FUNCTION dbo.orders(@LastName AS nchar(255))
RETURNS TABLE AS
RETURN
	SELECT sc.CustomerID, sc.PersonID, pp.BusinessEntityID
	FROM Sales.Customer sc
	JOIN Sales.SalesOrderHeader ssoh ON ssoh.CustomerID = sc.CustomerID
	JOIN Person.Person pp ON pp.BusinessEntityID = sc.PersonID
	WHERE pp.LastName=@LastName

GO
SELECT * FROM dbo.orders('Adams');