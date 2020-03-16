--Skrypt Lab02.02 - Zadanie A
IF OBJECT_ID('tmp') IS NOT NULL
	DROP TABLE tmp;
GO

CREATE TABLE tmp (
	RowNumber int,
	Rank int,
	DenseRank int,
	NTile_3 int,
	NTile_4 int,
	ContactID int,
	FirstName varchar(20),
	LastName varchar(20)
);
SET ANSI_WARNINGS OFF;

INSERT INTO tmp SELECT
	Row_Number() OVER (ORDER BY LastName) AS RowNumber,
	Rank() OVER (ORDER BY LastName) AS Rank,
	Dense_Rank() OVER (ORDER BY LastName) AS DenseRank,
	NTile(3) OVER (PARTITION BY LastName ORDER BY LastName) AS NTile_3,
	NTile(4) OVER (PARTITION BY LastName ORDER BY LastName) AS NTile_4,
	ContactID,
	FirstName,
	LastName
FROM AdventureWorks.Person.Contact;

SELECT * from tmp WHERE (RowNumber > 50) AND (RowNumber <= 100);