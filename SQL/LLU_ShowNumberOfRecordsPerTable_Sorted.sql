/*	Lars Lund - 2002-05-12 Count records in tables and sort by this  */
create procedure sp_LLU_RecordsInTable as
--use axdb


	declare @name sysname
	declare @SQL  nvarchar(600)
	declare @Tablename   varchar(35)
	set nocount on

	/* Use temporary table to sum up database size w/o using group by */
	drop table #tables
	create table #tables (
				  TABLE_NAME sysname NOT NULL,
				  TableRecords int NOT NULL)
	

	declare c1 cursor for
		select name from sysobjects where xtype = 'U'

	open c1
	fetch c1 into @Tablename

	while @@fetch_status >= 0
	begin
		select @SQL = 'insert into #tables
				select N'''+ @Tablename + ''', count(*) from '
				+ QuoteName(@Tablename)
		/* Insert row for each database */
		execute (@SQL)
		fetch c1 into @Tablename
	end
	deallocate c1

	select	
		TABLE_NAME,
		TableRecords

	from #tables where TableRecords > 1000
	order by 2 DESC
	
	delete from #Tables
go
use ax30_dannet
exec sp_LLU_RecordsInTable