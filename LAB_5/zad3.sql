USE AdventureWorks;
GO

EXEC sp_addrolemember @rolename=db_datawriter, @membername=[MSSQLSERVER\grupa11];
EXEC sp_addrolemember @rolename=db_datawriter, @membername=[MSSQLSERVER\grupa2];

--EXEC sp_addrolemember @rolename=sysadmin, @membername=[MSSQLSERVER\tester3];