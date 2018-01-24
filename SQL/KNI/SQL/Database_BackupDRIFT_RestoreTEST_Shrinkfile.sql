--DROP DATABASE AX40_KNI_COPY
--GO
begin
WAITFOR delay '00:01';
select 'Hertil';
end;
begin
WAITFOR delay '04:00';
BACKUP DATABASE [AX40_KNI_DRIFT] TO  DISK = N'G:\AX40_KNI_DRIFT_Backup.bak' 
	WITH NOFORMAT, INIT,  NAME = N'AX40_KNI_DRIFT-Full Database Backup', 
	SKIP, NOREWIND, NOUNLOAD,  STATS = 10;
end;
--RESTORE DATABASE AX40_KNI_COPY
--   FROM disk='G:\AX40_KNI_DRIFT_Backup.bak'
--   WITH REPLACE,RECOVERY,stats=10,
--   MOVE 'Dynamics' TO 'g:\sqldata\DynamicsCOPY.mdf',
--   MOVE 'Dynamics_log' TO 'h:\sqllog\DynamicsCOPY_log.ldf'
--GO
--ALTER DATABASE AX40_KNI_COPY 
--	modify file(NAME='Dynamics',NEWNAME='DynamicsCOPY')
--ALTER DATABASE AX40_KNI_COPY 
--	modify file(NAME='Dynamics_log',NEWNAME='DynamicsCOPY_log')
--
----go
----DBCC SHRINKDATABASE (AX40_KNI_DRIFT,10)
--exec sp_helpfile
--BACKUP LOG AX40_KNI_DRIFT WITH TRUNCATE_ONLY
--DBCC SHRINKFILE (2,20000)
