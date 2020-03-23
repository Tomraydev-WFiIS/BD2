USE AdventureWorks;
GO

IF OBJECT_ID('dbo.print_person_address') IS NOT NULL
	DROP PROC dbo.print_person_address;
GO

CREATE PROC dbo.print_person_address
	@AddressID AS INT
	AS
	DECLARE @error_msg AS NVARCHAR(255);

	IF @AddressID IS NULL
	BEGIN
		SET @error_msg = 'Please provide an addressID.';
		RAISERROR(@error_msg, 10,1);
		RETURN;
	END

	IF @AddressID NOT IN (SELECT AddressID FROM Person.Address)
	BEGIN
		SET @error_msg = 'Provided AddressID does not exist.';
		RAISERROR(@error_msg, 10,1);
		RETURN;
	END

	SELECT
		pa.AddressLine1 + '; '
		+ pa.City
		AS 'PersonInfo'
		FROM Person.Address pa
		WHERE pa.AddressID = @AddressID
		
GO

EXEC dbo.print_person_address @AddressID = 10;