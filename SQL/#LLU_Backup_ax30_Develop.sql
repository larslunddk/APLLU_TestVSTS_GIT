use master
EXEC sp_dropdevice ax30_develop
GO
EXEC sp_addumpdevice 'disk', 'ax30_develop', 'c:\ax300\ax30_develop.bak'
GO
BACKUP DATABASE ax30_develop TO ax30_develop  WITH INIT, SKIP, STATS=10
go
