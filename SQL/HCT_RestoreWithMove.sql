use master
EXEC sp_dropdevice 'axdb3_demo_device'
EXEC sp_addumpdevice 'disk', 'axdb3_demo_device', 'c:\ax300\axdb3_demo_device.bak' 
GO
BACKUP DATABASE axdb3_demo TO axdb3_demo_device
go
use master
drop database axdb3_develop
go
Restore database axdb3_develop from disk='c:\ax300\axdb3_demo.bak' 
   WITH REPLACE, stats=10,
   MOVE 'axdb3_demo_Data' TO 'c:\sql_data\axdb3_develop.mdf',
   MOVE 'axdb3_demo_log' TO 'c:\sql_data\axdb3_develop_log.ldf'

go
