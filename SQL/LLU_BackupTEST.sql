use master
EXEC sp_addumpdevice 'disk', 'axdb3_test', 'c:\ax\axdb3_testdata.bak'
GO
BACKUP DATABASE axdb3_test TO axdb3_test  WITH INIT, SKIP, STATS=10
go
