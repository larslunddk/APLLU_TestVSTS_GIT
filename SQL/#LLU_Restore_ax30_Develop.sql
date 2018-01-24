use master
drop database ax30_develop
go
/* Restore database axdb_remy from disk='f:\MSSQL7\BACKUP\remy_test' WITH RECOVERY, stats=10 */

Restore database ax30_develop from disk='c:\ax300\ax30_develop.bak' WITH REPLACE, stats=10
go