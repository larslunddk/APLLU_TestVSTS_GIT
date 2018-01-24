-- Compare 2 databases on record level - with updates
IF EXISTS (SELECT name 
	   FROM   sysobjects 
	   WHERE  name = N'LLU_UpdatedRecordsIdentify' 
	   AND 	  type = 'P')
    DROP PROCEDURE LLU_UpdatedRecordsIdentify
GO

CREATE PROCEDURE LLU_UpdatedRecordsIdentify 
	@RecType   varchar(10),
	@TableNum varchar(49) = N'Blank',
	@DB1		varchar(100) = N'AxProd',
	@DB2		varchar(100) = N'AxProd2407'

AS
	declare @TableName as nvarchar(60)
	declare @dyn_cmd	as varchar(4000)
	declare @RecCount	as int
	select @TableName = SQLNAME from SQLDICTIONARY where tableid=@Tablenum and fieldid=0
	--select @TableName
	if (@TableName <> '')
	BEGIN
		
		select @dyn_cmd = 
		'select '''+@DB1+''' as DBName,'''+@TableName+''' as TableName, SQLDict1.RECID,* '+ 
			'from '+@DB1+'.dbo.'+@TableName+' as SQLDict1 '+
			'join '+@DB2+'.dbo.'+@TableName+' as SQLDict2 '+
			'on SQLDict1.RECID = SQLDict2.recid '+
			'and SQLDict1.RECVERSION <> SQLDict2.RECVERSION '+
			''--'join name from sqldictionary as SD where SD.tableId = '+@TableNum+' and SD.fieldid=0'

		select @dyn_cmd2 = 
		'declare c2 cursor for '+@dyn_cmd
		+'open c1
		fetch c2 into @RecType,@Tablenum, @Tablename        //////NEEDS TO BE Adjusted here
			while @@fetch_status >= 0
				begin
					SET @tablenumStr = cast(@tablenum as nvarchar(10))
					execute LLU_UpdatedRecordsIdentify @RecType, @TablenumStr
					fetch c1 into @Tablenum
				end
				close c2
			deallocate c2'

		--select @dyn_cmd
		EXECUTE(@dyn_cmd)
		insert into dbo.[LLU_RecDifferences] (RecType, Tablenum,tablename,records) values(@RecType,@Tablenum, @Tablename, EXECUTE(@dyn_cmd))
	END
	
		--where ItemId = 'P5'
GO

-- =============================================
-- example to execute the store procedure
-- =============================================
Use AxProd2407

DROP TABLE dbo.LLU_RecDifferences
GO
CREATE TABLE [dbo].[LLU_RecDifferences](
	[RecType] [nchar](10) NULL,
	[Tablenum] [nchar](10) NULL,
	[TableName] [nvarchar](50) NULL,
	[RecID] [numeric](18, 0) NULL
) ON [PRIMARY]
GO


declare @tablenum as int = 0
declare @tablenumStr as nvarchar(10)
declare @RecType as nvarchar(10)

declare c1 cursor for
		select tableid from sysobjects 
		inner join  SQLDICTIONARY on SQLNAME = sysobjects.NAME and xtype = 'U' and fieldid=0 and SQLDICTIONARY.name like 'ledgerjournal%'
select @RecType = 'LLUTest_'+
		right('00'+cast(datepart(DD,getdate()) as nvarchar(2)),2)+
		SUBSTRING( CONVERT(VARCHAR(20), GETDATE(), 113), 13,2)+
		SUBSTRING( CONVERT(VARCHAR(20), GETDATE(), 113), 16,2)
open c1
fetch c1 into @TableNum
while @@fetch_status >= 0
	begin
		SET @tablenumStr = cast(@tablenum as nvarchar(10))
		execute LLU_UpdatedRecordsIdentify @RecType, @TablenumStr
		fetch c1 into @Tablenum
	end
	close c1
deallocate c1
GO

select * from LLU_RecDifferences where RecType = @RecType order by records desc
GO 
DROP TABLE dbo.LLU_RecDifferences
GO


