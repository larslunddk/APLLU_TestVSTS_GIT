-- Lars Lund 2004-07-06
-- Truncate and shrink databases
BACKUP LOG AX40_KNI_DRIFT WITH TRUNCATE_ONLY
go
DBCC SHRINKDATABASE (AX40_KNI_DRIFT,0)
go

