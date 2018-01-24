USE master
GO
-- First determine the number and names of the files in the backup.
-- MyNwind_2 is the name of the backup device.
RESTORE FILELISTONLY
   FROM disk='c:\ax300\axdb3_demo.bak'
-- Restore the files for MyNwind2_Test.

RESTORE DATABASE axdb3_Weinaas
   FROM disk='c:\ax300\axdb3_demo.bak'
   WITH REPLACE,RECOVERY,
   MOVE 'axdb3_demo_Data' TO 'c:\sqldata\axdb3_Weinaas_data.mdf',
   MOVE 'axdb3_demo_log' TO 'c:\sqldata\axdb3_Weinaas_log.ldf'
GO
ALTER DATABASE axdb3_Weinaas 
	modify file(NAME='axdb3_demo_data',NEWNAME='axdb3_Weinaas_data')
ALTER DATABASE axdb3_Weinaas 
	modify file(NAME='axdb3_demo_log',NEWNAME='axdb3_Weinaas_log')