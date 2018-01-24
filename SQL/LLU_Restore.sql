use master
drop database axdb_rc_test

/* Restore database axdb_remy from disk='f:\MSSQL7\BACKUP\remy_test' WITH RECOVERY, stats=10 */

Restore database axdb_rc_test from disk='f:\MSSQL7\BACKUP\axdb_rc20.bak' WITH REPLACE, stats=10
go