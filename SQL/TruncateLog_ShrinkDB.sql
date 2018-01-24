-- SQL SERVER 2005 and before
backup log axdb_lp to disk = 'c:\axdb_lp_log.bak'
go
dbcc shrinkdatabase (axdb_lp,10)
go

-- SQL SERVER 2008 and after
SELECT name,size from sys.database_files
select name,recovery_model_desc from sys.databases
go
Alter database axdb_lp SET Recovery simple
dbcc shrinkdatabase (axdb_lp,10)
go
