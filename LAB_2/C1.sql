--Opracuj zapytanie dla przyk³adów z punktu Skrypt Lab02.08 i  Skrypt Lab02.09 z wykorzystaniem operatora CASE.
USE AdventureWorks
GO
IF OBJECT_ID('SalesOrderTotalsMonthly') IS NOT NULL
	DROP TABLE SalesOrderTotalsMonthly;
GO

--- Skrypt Lab02.08
CREATE TABLE SalesOrderTotalsMonthly
(
 CustomerID int NOT NULL,
 OrderMonth int NOT NULL,
 SubTotal money NOT NULL
)
GO
INSERT SalesOrderTotalsMonthly
 SELECT CustomerID, DATEPART(m, OrderDate), SubTotal
 FROM Sales.SalesOrderHeader
 WHERE CustomerID IN (1,2,4,6)
GO
SELECT * FROM SalesOrderTotalsMonthly
PIVOT (SUM(SubTotal) FOR OrderMonth IN
([1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12])) AS a