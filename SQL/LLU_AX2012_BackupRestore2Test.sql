--**************************************  DATA FILE *************************************
use master

BACKUP DATABASE AlfapeopleAX2012 TO  DISK = N'C:\SQLBackup\AX2012\AlfapeopleAX2012_Temp.bak' 
	WITH NOFORMAT, NOINIT,  NAME = N'AlfapeopleAX2012 Backup', 
	SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO

drop database AlfapeopleAX2012_Test
go

Restore database AlfapeopleAX2012_Test from disk=N'C:\SQLBackup\AX2012\AlfapeopleAX2012_Temp.bak' 
   WITH REPLACE, stats=10,
   MOVE 'AlfapeopleAX2012' TO 'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\AlfapeopleAX2012_Test.mdf',
   MOVE 'AlfapeopleAX2012_log' TO 'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\AlfapeopleAX2012_Test_log.ldf'
go
ALTER DATABASE AlfapeopleAX2012_Test 
	modify file(NAME='AlfapeopleAX2012',NEWNAME='AlfapeopleAX2012_TEST')
ALTER DATABASE AlfapeopleAX2012_Test 
	modify file(NAME='AlfapeopleAX2012_log',NEWNAME='AlfapeopleAX2012_TEST_log')


--**************************************  MODEL FILE *************************************
use master

BACKUP DATABASE AlfapeopleAX2012_model TO  DISK = N'C:\SQLBackup\AX2012\AlfapeopleAX2012_Model_Temp.bak' 
	WITH NOFORMAT, NOINIT,  NAME = N'AlfapeopleAX2012 Model Backup', 
	SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO

drop database AlfapeopleAX2012_Test_model
go

Restore database AlfapeopleAX2012_Test_model from disk=N'C:\SQLBackup\AX2012\AlfapeopleAX2012_Model_Temp.bak' 
   WITH REPLACE, stats=10,
   MOVE 'AlfapeopleAX2012_model' TO 'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\AlfapeopleAX2012_Test_model.mdf',
   MOVE 'AlfapeopleAX2012_model_log' TO 'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\AlfapeopleAX2012_Test_model_log.ldf'
go
ALTER DATABASE AlfapeopleAX2012_Test_model 
	modify file(NAME='AlfapeopleAX2012_model',NEWNAME='AlfapeopleAX2012_TEST_model')
ALTER DATABASE AlfapeopleAX2012_Test_model 
	modify file(NAME='AlfapeopleAX2012_model_log',NEWNAME='AlfapeopleAX2012_TEST_model_log')