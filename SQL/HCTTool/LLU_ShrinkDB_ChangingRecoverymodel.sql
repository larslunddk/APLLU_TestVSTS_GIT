use master
ALTER DATABASE axdb_HCT SET RECOVERY SIMPLE
go
USE [axdb_HCT]
DBCC SHRINKFILE (N'axdb_HCT_log' , 500)
go
use master
ALTER DATABASE axdb_HCT SET RECOVERY FULL 