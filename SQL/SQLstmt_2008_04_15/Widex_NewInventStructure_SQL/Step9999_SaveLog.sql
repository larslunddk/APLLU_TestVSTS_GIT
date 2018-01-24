use widsql3_cit_1
select * from cit_upglogtable 
	--where	txt like '%step 2b%' 
	
	order by timestrfrom,timestrto


--drop database CIT_LogSave
--go
--CREATE DATABASE CIT_LogSave
--ON 
--( NAME = CIT_LogSave,
--    FILENAME = 'G:\MSSQL\Data\CIT_LogSave.mdf',
--    SIZE = 1000MB,
--    MAXSIZE = 1000MB,
--    FILEGROWTH = 5 )
--LOG ON
--( NAME = Sales_log,
--    FILENAME = 'G:\MSSQL\Data\CIT_LogSave_log.ldf',
--    SIZE = 2MB,
--    MAXSIZE = 25MB,
--    FILEGROWTH = 2MB )

--go
--use CIT_LogSave
--drop table CIT_LogSave.dbo.cit_upglogtable
--select * 
--	into CIT_LogSave.dbo.cit_upglogtable
--	from widsql3_cit_1.dbo.cit_upglogtable
--go
