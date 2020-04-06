--EXEC sp_revokelogin 'MSSQLSERVER\grupa3';
--CREATE LOGIN [MSSQLSERVER\grupa3] FROM WINDOWS WITH DEFAULT_DATABASE=[master];

--Przydzielanie ról
EXEC sp_addsrvrolemember @loginame=[MSSQLSERVER\grupa3], @rolename=dbcreator;
EXEC sp_addsrvrolemember @loginame=[MSSQLSERVER\grupa3], @rolename=serveradmin;

--select * from sys.server_role_members
--select * from sys.server_principals
--select * from sys.server_principals
--JOIN sys.server_role_members ON principal_id = member_principal_id