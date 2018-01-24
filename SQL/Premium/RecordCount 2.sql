-- =============================================
-- Create procedure basic template
-- =============================================
-- creating the store procedure

IF EXISTS (SELECT name 
	   FROM   sysobjects 
	   WHERE  name = N'LLU_UpdateRecCnt' 
	   AND 	  type = 'P')
    DROP PROCEDURE LLU_UpdateRecCnt
GO

CREATE PROCEDURE LLU_UpdateRecCnt 
	@RecType   varchar(20),
	@TableNum varchar(49) = N'Blank'
AS
	declare @TableName as nvarchar(60)
	declare @dyn_cmd	as varchar(4000)
	declare @RecCount	as int
	select @TableName = SQLNAME from SQLDICTIONARY where tableid=@Tablenum and fieldid=0

	if (@TableName <> '')
	BEGIN
		--select @dyn_cmd = 'select count(*) from dbo.'+@TableName
		select @dyn_cmd = 'insert into LLU_RecCount (RecType,TableNum, Tablename, Records) values('''+
						   @RecType+''','''+@Tablenum+''','''+@Tablename+''', (select count(*) from dbo.'+@TableName+'))'
		--select @dyn_cmd
		EXECUTE(@dyn_cmd)
		--insert into dbo.LLU_RecCount (Tablenum,tablename,records) values(@Tablenum, @Tablename, EXECUTE(@dyn_cmd))
	END
GO

-- =============================================
-- example to execute the store procedure
-- =============================================
Use AXDMVPROD


--DROP TABLE dbo.LLU_RecCount
--GO

-- ****************** MUST BE ENABLED FIRST TIME *****************
--CREATE TABLE [dbo].[LLU_RecCount](
--	[RecType] [nchar](20) NULL,
--	[Tablenum] [nchar](20) NULL,
--	[TableName] [nvarchar](50) NULL,
--	[Records] [numeric](18, 0) NULL
--) ON [PRIMARY]
--GO

declare @tablenum as int = 0
declare @tablenumStr as nvarchar(20)
declare @RecType as nvarchar(20)
--declare c1 cursor for select TableId from SQLDICTIONARY where fieldid=0
declare c1 cursor for
		select tableid from sysobjects inner join  SQLDICTIONARY on SQLNAME = sysobjects.NAME and xtype = 'U' and fieldid=0
select @RecType = 'Loop7_'+
		right('00'+cast(datepart(DD,getdate()) as nvarchar(2)),2)+
		SUBSTRING( CONVERT(VARCHAR(20), GETDATE(), 113), 13,2)+
		SUBSTRING( CONVERT(VARCHAR(20), GETDATE(), 113), 16,2)
open c1
fetch c1 into @TableNum
while @@fetch_status >= 0
	begin
		SET @tablenumStr = cast(@tablenum as nvarchar(20))
		execute LLU_UpdateRecCnt @RecType, @TablenumStr
		fetch c1 into @Tablenum
	end
	close c1
GO

--select * from LLU_RecCount where RecType = 'Loop7_1908' order by records desc 