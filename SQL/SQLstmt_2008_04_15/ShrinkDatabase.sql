BACKUP LOG widsql3_cit_udv with truncate_only
go
dbcc shrinkfile(WIDSQL_Log,10000) 
--dbcc shrinkdatabase (widsql3_cit_udv,5)
go

select name, database_id,log_reuse_wait_desc from sys.databases