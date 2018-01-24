RESTORE DATABASE AX40_KNI_COPY
   FROM disk='T:\share\AX40_KNI_DRIFT_Backup.bak'
   WITH REPLACE,RECOVERY,stats=10,
   MOVE 'Dynamics' TO 't:\sqldata\DynamicsCOPY.mdf',
   MOVE 'Dynamics_log' TO 't:\sqllog\DynamicsCOPY_log.ldf'
GO
ALTER DATABASE AX40_KNI_COPY 
	modify file(NAME='Dynamics',NEWNAME='DynamicsCOPY')
ALTER DATABASE AX40_KNI_COPY 
	modify file(NAME='Dynamics_log',NEWNAME='DynamicsCOPY_log')
GO
BACKUP LOG AX40_KNI_COPY WITH TRUNCATE_ONLY
DBCC SHRINKDATABASE (AX40_KNI_COPY,10)