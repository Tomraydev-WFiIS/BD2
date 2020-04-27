-- c)
USE testCLR
GO
CREATE ASSEMBLY [Lab7.GreetUser] FROM 'c:\Users\Administrator\Desktop\BAZY_2\LAB_7\GreetUser.dll';

--GO
--CREATE FUNCTION [dbo].[fnGreetUser]()
--RETURNS varchar
--AS
--EXTERNAL NAME
--[Lab7.GetSystemTime].[LabCLR].[GreetUser];

--GO
--SELECT [dbo].[GreetUser]();