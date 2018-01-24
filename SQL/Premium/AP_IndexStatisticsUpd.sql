use AxProd
waitfor time '20:00'
declare @TableName	nvarchar(127)
		,@dyn_cmd       nvarchar(127)

declare SysObj CURSOR FOR
		select name from dbo.sysobjects 
			where --name = 'ledgerjournaltable' and
			(OBJECTPROPERTY(id, N'IsUserTable') = 1) --	or OBJECTPROPERTY(id, N'IsView') = 1)


OPEN SysObj
FETCH NEXT FROM SysObj into @TableName

WHILE @@FETCH_STATUS = 0
BEGIN
	SET @dyn_cmd = 'Update statistics [dbo].['+@TableName+']	with fullscan'

	print   @dyn_cmd
    EXECUTE(@dyn_cmd)
   	FETCH NEXT FROM SysObj into @TableName
END

CLOSE SysObj
DEALLOCATE SysObj
GO
