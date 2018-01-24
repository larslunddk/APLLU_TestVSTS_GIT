/*	Lars Lund - 2002-05-12 Count records in tables and sort by this  */
create procedure sp_LLU_RecordsInTable as
	declare @name sysname
	declare @SQL  nvarchar(600)
	declare @Tablename   varchar(35)
	set nocount on

	/* Use temporary table to sum up database size w/o using group by */
	--drop table #tables
	create table #tables (
				  TABLE_NAME 	sysname NOT NULL,
				  TableRecords 	int 	NOT NULL )
	

	declare c1 cursor for
		select sysobjects.name
			from sysobjects 
			join sqldictionary as sd
			on sd.name = sysobjects.name
			where	xtype = 'U' 
			and		FIELDID = 0
			and exists(select 1 from sqldictionary as sd_field where sd_field.tableid = sd.tableid and sd_field.sqlname = 'dataareaid')
			order by sysobjects.name

		--select name from sysobjects where xtype = 'U'

	open c1
	fetch c1 into @Tablename

	while @@fetch_status >= 0
	begin
		select @SQL = 'insert into #tables
				select N'''+ @Tablename + ''', count(*)'+
				' from '+ QuoteName(@Tablename)
		--		+' where dataareaid=''dat'''
				
		/* Insert row for each database */
		--print @SQL
		execute (@SQL)
		fetch c1 into @Tablename
	end
	deallocate c1

	select	
		TABLE_NAME,
		TableRecords
	from #tables where TableRecords > 100
	order by 2 DESC
	
	delete from #Tables
go

--begin tran
exec sp_LLU_RecordsInTable
drop procedure sp_LLU_RecordsInTable
