use master
EXEC sp_dropdevice 'Backupaxdb_demo21', 'DELFILE'
EXEC sp_addumpdevice 'disk', 'Backupaxdb_demo21', 'c:\mssql7\backup\axdb_demo21.bak'
BACKUP DATABASE axdb_demo21 TO Backupaxdb_demo21
go
EXEC sp_dropdevice 'Backupaxdb_km21', 'DELFILE'
EXEC sp_addumpdevice 'disk', 'Backupaxdb_km21', 'c:\mssql7\backup\axdb_km21.bak'
BACKUP DATABASE axdb_km21 TO Backupaxdb_km21
go
EXEC sp_dropdevice 'Backupaxdb_pivotal21', 'DELFILE'
EXEC sp_addumpdevice 'disk', 'Backupaxdb_pivotal21', 'c:\mssql7\backup\axdb_pivotal21.bak'
BACKUP DATABASE axdb_pivotal21 TO Backupaxdb_pivotal21
go
EXEC sp_dropdevice 'Backupcias_bm', 'DELFILE'
EXEC sp_addumpdevice 'disk', 'Backupcias_bm', 'c:\mssql7\backup\cias_bm.bak'
BACKUP DATABASE cias_bm TO Backupcias_bm
go
EXEC sp_dropdevice 'Backupcias_ed', 'DELFILE'
EXEC sp_addumpdevice 'disk', 'Backupcias_ed', 'c:\mssql7\backup\cias_ed.bak'
BACKUP DATABASE cias_ed TO Backupcias_ed
go
EXEC sp_dropdevice 'Backupdemo_bm', 'DELFILE'
EXEC sp_addumpdevice 'disk', 'Backupdemo_bm', 'c:\mssql7\backup\demo_bm.bak'
BACKUP DATABASE demo_bm TO Backupdemo_bm
go
EXEC sp_dropdevice 'Backupdemo_ed', 'DELFILE'
EXEC sp_addumpdevice 'disk', 'Backupdemo_ed', 'c:\mssql7\backup\demo_ed.bak'
BACKUP DATABASE demo_ed TO Backupdemo_ed
go
EXEC sp_dropdevice 'Backupsales_bm', 'DELFILE'
EXEC sp_addumpdevice 'disk', 'Backupsales_bm', 'c:\mssql7\backup\sales_bm.bak'
BACKUP DATABASE sales_bm TO Backupsales_bm
go
EXEC sp_dropdevice 'Backupsales_ed', 'DELFILE'
EXEC sp_addumpdevice 'disk', 'Backupsales_ed', 'c:\mssql7\backup\sales_ed.bak'
BACKUP DATABASE sales_ed TO Backupsales_ed
go
