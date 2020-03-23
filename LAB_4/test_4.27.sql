--- Skrypt Lab04.27
-- INTERFACE - input and output parameters
 USE AdventureWorks;
 GO
 
 IF OBJECT_ID('dbo.usp_GetCustOrders') IS NOT NULL
 DROP PROC dbo.usp_GetCustOrders;
 GO
 
CREATE PROC dbo.usp_GetCustOrders
	@custid AS NCHAR(5),
	@fromdate AS DATETIME = '19000101',
	@todate AS DATETIME = '99991231'
	AS
	SET NOCOUNT ON;
	SELECT SalesOrderID, CustomerID, SalesPersonID, OrderDate
		FROM Sales.SalesOrderHeader
		WHERE CustomerID = @custid
		AND OrderDate >= @fromdate
		AND OrderDate < @todate;
GO

-- sposoby uzycia
--EXEC dbo.usp_GetCustOrders N'676';
--EXEC dbo.usp_GetCustOrders N'676', DEFAULT, '20040212';
--EXEC dbo.usp_GetCustOrders N'676', '20021010', '20041010';
--EXEC dbo.usp_GetCustOrders
--	@custid = N'676',
--	@fromdate = '19970101',
--	@todate = '19980101';