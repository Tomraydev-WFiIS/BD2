USE AdventureWorks;
GO

IF OBJECT_ID('dbo.DMLHistory') IS NOT NULL
	DROP TABLE dbo.DMLHistory;
GO

CREATE TABLE dbo.DMLHistory (
	VendorID INT,
	last_modified_time datetime,
    last_modified_user nvarchar(255),
);
GO

IF OBJECT_ID('Purchasing.DateModified', 'TR') IS NOT NULL
	DROP TRIGGER Purchasing.DateModified;
GO

CREATE TRIGGER Purchasing.DateModified ON Purchasing.Vendor
	AFTER INSERT, UPDATE
	AS
	BEGIN
		INSERT INTO dbo.DMLHistory VALUES((SELECT VendorID FROM inserted), CURRENT_TIMESTAMP, CURRENT_USER)
	END
GO

INSERT INTO Purchasing.Vendor VALUES ('TEST0001', 'Test', 1, 1, 1, NULL, CURRENT_TIMESTAMP);
UPDATE Purchasing.Vendor SET Name = 'Test1' WHERE AccountNumber = 'TEST0001';
UPDATE Purchasing.Vendor SET Name = 'Test2' WHERE AccountNumber = 'TEST0001';
UPDATE Purchasing.Vendor SET Name = 'Test3' WHERE AccountNumber = 'TEST0001';
SELECT * FROM dbo.DMLHistory;
