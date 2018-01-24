use master
EXEC sp_addumpdevice 'disk', 'axdb_lp', 'c:\ax\axdb_lp.bak'
GO
BACKUP DATABASE axdb_lp TO axdb_lp  WITH INIT, SKIP, STATS=10
go
