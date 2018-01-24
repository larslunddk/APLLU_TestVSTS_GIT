use master

BACKUP DATABASE [axdb_HCT] TO  DISK = N'H:\MSSQL\BACKUP\AX_HCT_20130428.bak' 
	WITH NOFORMAT, NOINIT,  NAME = N'axdb_HCT-Full Database Backup', 
	SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO

drop database axdb_TEST
go

Restore database axdb_TEST from disk=N'H:\MSSQL\Backup\AX_HCT_20130428.bak' 
   WITH REPLACE, stats=10,
   MOVE 'axdb_HCT' TO 'H:\MSSQL\data\axdb_test.mdf',
   MOVE 'axdb_HCT_log' TO 'E:\MSSQL\log\axdb_test.ldf'
go
ALTER DATABASE axdb_TEST 
	modify file(NAME='axdb_HCT',NEWNAME='axdb_TEST')
ALTER DATABASE axdb_TEST 
	modify file(NAME='axdb_HCT_log',NEWNAME='axdb_TEST_log')