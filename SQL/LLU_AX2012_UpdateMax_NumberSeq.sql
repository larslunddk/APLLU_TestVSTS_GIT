-- =============================================
-- Create procedure basic template
-- =============================================
-- creating the store procedure

IF EXISTS (SELECT name 
	   FROM   sysobjects 
	   WHERE  name = N'LLU_UpdateRecIdCnt' 
	   AND 	  type = 'P')
    DROP PROCEDURE LLU_UpdateRecIdCnt
GO

CREATE PROCEDURE LLU_UpdateRecIdCnt 
	@TableNum varchar(49) = N'Blank'
AS
	declare @TableName as nvarchar(60)
	declare @dyn_cmd	as varchar(127)


	select @TableName = SQLNAME from SQLDICTIONARY where tableid=@Tablenum and fieldid=0

	select @TableName
	select @dyn_cmd = 'select max(recid) from dbo.'+@TableName
    select @dyn_cmd
    EXECUTE(@dyn_cmd)
	--Update bmssa.InventTrans set DEL_ConfigID=@NewVal
		--where ItemId = 'P5'
GO

-- =============================================
-- example to execute the store procedure
-- =============================================
Use AxTest
execute LLU_UpdateRecIdCnt 77
GO

