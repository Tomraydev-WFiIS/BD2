USE AdventureWorks;
GO

IF OBJECT_ID('dbo.print_employees') IS NOT NULL
	DROP PROC dbo.print_employees;
GO

CREATE PROC dbo.print_employees
	AS
		DECLARE @query NVARCHAR(255)
		SET @query = 'DECLARE cur CURSOR READ_ONLY FOR (SELECT pc.FirstName, pc.LastName, hr.Title FROM HumanResources.Employee hr JOIN Person.Contact pc ON pc.ContactID=hr.ContactID)'
		EXEC(@query)

		DECLARE
			@FirstName NVARCHAR(255),
			@LastName NVARCHAR(255),
			@Title NVARCHAR(255)		
		
		OPEN cur
			FETCH NEXT FROM cur
			INTO @FirstName, @LastName, @Title;
		
		WHILE @@FETCH_STATUS = 0
			BEGIN
				PRINT @FirstName + ' ' + @LastName + ' ' + @Title;
				FETCH NEXT FROM cur
				INTO @FirstName, @LastName, @Title;
			END
		CLOSE cur
		DEALLOCATE cur

GO

EXEC dbo.print_employees;