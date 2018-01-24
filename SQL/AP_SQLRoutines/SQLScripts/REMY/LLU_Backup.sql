use master
EXEC sp_addumpdevice 'disk', 'LLUBackup', 'f:\mssql7\backup\dump1.bak'
BACKUP DATABASE axdb_remy TO LLUBackupgo