USE testCLR
GO
CREATE ASSEMBLY [Lab7.GreetUser] FROM 'c:\Users\Administrator\Desktop\BAZY_2\LAB_7\GreetUser.dll';

--GO
--DROP FUNCTION [dbo].[fnGreetUser];

GO
CREATE FUNCTION [dbo].[fnGreetUser](@current_user NVARCHAR(max), @serever_name NVARCHAR(max), @system_name NVARCHAR(max))
RETURNS NVARCHAR(max)
AS
EXTERNAL NAME
[Lab7.GreetUser].[LabCLR].[GreetUser];

GO
SELECT greeting=[dbo].[fnGreetUser](CURRENT_USER, @@SERVERNAME, @@VERSION);