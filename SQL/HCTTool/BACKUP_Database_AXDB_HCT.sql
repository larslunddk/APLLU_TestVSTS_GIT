BACKUP DATABASE [axdb_HCT] 
TO  DISK = N'E:\MSSQL\Backup\axdb_hct_20120323.bak' 
WITH NOFORMAT, INIT,  stats=10

NAME = N'axdb_HCT-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO
