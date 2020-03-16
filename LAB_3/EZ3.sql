USE AdventureWorks2008;
GO

 CREATE FUNCTION dbo.Zamowienia(@nazwiskoodbiorcy AS nchar(25)) RETURNS TABLE 
 AS
 RETURN
 SELECT SC.CustomerID, SC.PersonID, PP.BusinessEntityID FROM Sales.Customer SC JOIN Sales.SalesOrderHeader SSOH 
 ON SSOH.CustomerID = SC.CustomerID JOIN Person.Person PP 
 ON PP.BusinessEntityID = SC.PersonID

 select * from dbo.zamowienia('Adams'); -- test 