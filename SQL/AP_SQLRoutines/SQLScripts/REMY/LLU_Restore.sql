/* use axdb_remy
drop database axdb_remy
*/
use master
/* Restore database axdb_remy from disk='f:\MSSQL7\BACKUP\remy_test' WITH RECOVERY, stats=10 */
Restore database axdb_remy from disk='f:\MSSQL7\BACKUP\remy_test' WITH REPLACE, stats=10
go