use master
drop database axdb3_test

/* Restore database axdb_remy from disk='f:\MSSQL7\BACKUP\remy_test' WITH RECOVERY, stats=10 */

Restore database axdb3_test from disk='c:\ax\axdb3_testdata.bak' WITH REPLACE, stats=10
go