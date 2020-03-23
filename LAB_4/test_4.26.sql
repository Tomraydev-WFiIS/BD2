-- Skrypt Lab04.26
USE AdventureWorks;
GO
IF OBJECT_ID('dbo.usp_GetSortedPersons') IS NOT NULL
	DROP PROC dbo.usp_GetSortedPersons;
GO

CREATE PROC dbo.usp_GetSortedPersons
	@colname AS sysname = NULL
	AS
	DECLARE @msg AS NVARCHAR(500);
	-- Input validation
	IF @colname IS NULL
	BEGIN
		SET @msg = N'A value must be supplied for parameter @colname.';
		RAISERROR(@msg, 16, 1);
		RETURN;
	END

	IF @colname NOT IN(N'ContactID', N'LastName', N'Phone')
	BEGIN
		SET @msg = N'Valid values for @colname are: '
		+ N'N''ContactID'', N''LastName'', N''Phone''.';
		RAISERROR(@msg, 16, 1);
		RETURN;
	END

	-- Return person sorted by requested sort column
	IF @colname = N'ContactID'
		SELECT ContactID, LastName, Phone FROM Person.Contact ORDER BY ContactID;
	ELSE IF @colname = N'LastName'
		SELECT ContactID, LastName, Phone FROM Person.Contact ORDER BY LastName;
	ELSE IF @colname = N'Phone'
		SELECT ContactID, LastName, Phone FROM Person.Contact ORDER BY Phone;
GO

-- test procedury
USE AdventureWorks;
EXEC dbo.usp_GetSortedPersons @colname = N'LastName';

-- zadanie z uprawnieniami

--DENY SELECT ON Person.Contact TO user1;
-- test z uprawnieniami
--SELECT ContactID, LastName, Phone FROM Person.Contact;

--GRANT EXECUTE ON dbo.usp_GetSortedPersons TO user1
-- test z uprawnieniami
--SELECT ContactID, LastName, Phone FROM Person.Contact;
