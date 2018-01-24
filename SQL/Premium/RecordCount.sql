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
	@RecType   varchar(10),
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
	--Update bmssa.InventTrans set DEL_ConfigID=@NewVal
		--where ItemId = 'P5'
GO

-- =============================================
-- example to execute the store procedure
-- =============================================
Use AXDMVPROD

--DROP TABLE dbo.LLU_RecCount
GO
--CREATE TABLE [dbo].[LLU_RecCount](
--	[RecType] [nchar](10) NULL,
--	[Tablenum] [nchar](10) NULL,
--	[TableName] [nvarchar](50) NULL,
--	[Records] [numeric](18, 0) NULL
--) ON [PRIMARY]
--GO

declare @tablenum as int = 0
declare @tablenumStr as nvarchar(10)
declare @RecType as nvarchar(10) = 'Mid_061130'
--declare c1 cursor for select TableId from SQLDICTIONARY where fieldid=0
declare c1 cursor for
		select tableid from sysobjects inner join  SQLDICTIONARY on SQLNAME = sysobjects.NAME and xtype = 'U' and fieldid=0
open c1
fetch c1 into @TableNum
while @@fetch_status >= 0
	begin
		SET @tablenumStr = cast(@tablenum as nvarchar(10))
		execute LLU_UpdateRecCnt @RecType, @TablenumStr
		fetch c1 into @Tablenum
	end
	close c1
--while (@Tablenum<99999)
--BEGIN
--	SET @tablenum = @tablenum + 1
--	SET @tablenumStr = cast(@tablenum as nvarchar(10))
--	execute LLU_UpdateRecCnt @RecType, @TablenumStr
--END
GO
select * from LLU_RecCount order by records desc

