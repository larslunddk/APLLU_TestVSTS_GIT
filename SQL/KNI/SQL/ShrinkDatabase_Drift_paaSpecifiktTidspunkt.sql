use master
waitfor time '02:00'
BACKUP LOG AX40_KNI_DRIFT WITH TRUNCATE_ONLY
go
DBCC SHRINKDATABASE (AX40_KNI_DRIFT,25)
