--Opracuj zapytanie dla przyk³adów z punktu Skrypt Lab02.08 i  Skrypt Lab02.09 z wykorzystaniem operatora CASE.
USE AdventureWorks
GO
IF OBJECT_ID('SalesOrderTotalsMonthly') IS NOT NULL
	DROP TABLE SalesOrderTotalsMonthly;
GO
IF OBJECT_ID('SalesOrderTotalsYearly') IS NOT NULL
	DROP TABLE SalesOrderTotalsYearly;
GO

--- Skrypt Lab02.08
CREATE TABLE SalesOrderTotalsMonthly(
	CustomerID int NOT NULL,
	OrderMonth int NOT NULL,
	SubTotal money NOT NULL
)
GO

INSERT INTO SalesOrderTotalsMonthly
SELECT CustomerID, DATEPART(m, OrderDate), SubTotal
FROM Sales.SalesOrderHeader
WHERE CustomerID IN (1,2,4,6)
GO

SELECT
	CustomerID,
	SUM(CASE WHEN OrderMonth=1 THEN SubTotal END) AS [1],
	SUM(CASE WHEN OrderMonth=2 THEN SubTotal END) AS [2],
	SUM(CASE WHEN OrderMonth=3 THEN SubTotal END) AS [3],
	SUM(CASE WHEN OrderMonth=4 THEN SubTotal END) AS [4],
	SUM(CASE WHEN OrderMonth=5 THEN SubTotal END) AS [5],
	SUM(CASE WHEN OrderMonth=6 THEN SubTotal END) AS [6],
	SUM(CASE WHEN OrderMonth=7 THEN SubTotal END) AS [7],
	SUM(CASE WHEN OrderMonth=8 THEN SubTotal END) AS [8],
	SUM(CASE WHEN OrderMonth=9 THEN SubTotal END) AS [9],
	SUM(CASE WHEN OrderMonth=10 THEN SubTotal END) AS [10],
	SUM(CASE WHEN OrderMonth=11 THEN SubTotal END) AS [11],
	SUM(CASE WHEN OrderMonth=12 THEN SubTotal END) AS [12]
FROM SalesOrderTotalsMonthly
GROUP BY CustomerID;



--- Skrypt Lab02.09
CREATE TABLE SalesOrderTotalsYearly(
	CustomerID int NOT NULL,
	OrderYear int NOT NULL,
	SubTotal money NOT NULL
)

GO
INSERT INTO SalesOrderTotalsYearly
SELECT CustomerID, YEAR(OrderDate), SubTotal
FROM Sales.SalesOrderHeader
WHERE CustomerID IN (1,2,4,6,35)

GO
SELECT
	CustomerID,
	SUM(CASE WHEN OrderYear=2002 THEN SubTotal END) AS [2002],
	SUM(CASE WHEN OrderYear=2003 THEN SubTotal END) AS [2003],
	SUM(CASE WHEN OrderYear=2004 THEN SubTotal END) AS [2004]
FROM SalesOrderTotalsYearly
GROUP BY CustomerID;

GO
SELECT
	OrderYear,
	SUM(CASE WHEN CustomerID=1 THEN SubTotal END) AS [1],
	SUM(CASE WHEN CustomerID=2 THEN SubTotal END) AS [2],
	SUM(CASE WHEN CustomerID=4 THEN SubTotal END) AS [4],
	SUM(CASE WHEN CustomerID=6 THEN SubTotal END) AS [6]
FROM SalesOrderTotalsYearly
GROUP BY OrderYear;