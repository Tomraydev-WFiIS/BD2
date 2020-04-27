USE testCLR
GO
CREATE ASSEMBLY [Lab7.GetSystemTime] FROM 'c:\Users\Administrator\Desktop\BAZY_2\LAB_7\GetSystemTime.dll';

GO
CREATE FUNCTION [dbo].[fnGetSystemTime]()
RETURNS [datetime]
AS
EXTERNAL NAME
[Lab7.GetSystemTime].[LabCLR].[GetSystemTime];

GO
SELECT SqlCLRSystemTime=[dbo].[fnGetSystemTime]();