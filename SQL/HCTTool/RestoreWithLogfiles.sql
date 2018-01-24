drop database axdb_TEST
go

Restore database axdb_TEST from disk=N'H:\MSSQL\Backup\axdb_HCT_backup_2013_05_29_230008_8165442.bak' 
   WITH REPLACE, stats=10,
   MOVE 'axdb_HCT' TO 'H:\MSSQL\data\axdb_test.mdf',
   MOVE 'axdb_HCT_log' TO 'E:\MSSQL\log\axdb_test.ldf',
   NORECOVERY
go
RESTORE LOG axdb_TEST
from disk=N'H:\MSSQL\Backup\axdb_HCT_backup_2013_05_30_080005_8298197.trn' WITH NORECOVERY

RESTORE LOG axdb_TEST
from disk=N'axdb3_HCT_backup_2013_05_29_080006_1201218.trn' WITH STOPAT = N'6/28/2007 4:01:45 PM', RECOVERY


ALTER DATABASE axdb_TEST 
	modify file(NAME='axdb_HCT',NEWNAME='axdb_TEST')
ALTER DATABASE axdb_TEST 
	modify file(NAME='axdb_HCT_log',NEWNAME='axdb_TEST_log')