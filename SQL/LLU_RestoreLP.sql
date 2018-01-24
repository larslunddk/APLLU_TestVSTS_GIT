use master
drop database axdb_lp

/* Restore database axdb_remy from disk='f:\MSSQL7\BACKUP\remy_test' WITH RECOVERY, stats=10 */

Restore database axdb_lp from disk='c:\ax25\axdb_lp.bak' WITH REPLACE, stats=10
go