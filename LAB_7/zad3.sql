USE AdventureWorks;
GO
DROP PROCEDURE find_email_address;

GO
CREATE PROCEDURE find_email_address(@pattern varchar(max))
AS
SELECT EmailAddress FROM HumanResources.Employee e
	JOIN Person.Contact c ON e.ContactID=c.ContactID
	WHERE EmailAddress LIKE '%' + @pattern + '%';

GO
EXEC find_email_address @pattern ='chris';