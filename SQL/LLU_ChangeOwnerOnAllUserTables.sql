use Ax30_DevelopLLU
declare @TableName		varchar(127)
	,@CurOwner		INT
	,@dyn_cmd               varchar(127)

declare SysObj CURSOR FOR
		select name, uid from dbo.sysobjects where OBJECTPROPERTY(id, N'IsUserTable') = 1
							or OBJECTPROPERTY(id, N'IsView') = 1


OPEN SysObj
FETCH NEXT FROM SysObj into @TableName,@CurOwner

WHILE @@FETCH_STATUS = 0
BEGIN
   select @dyn_cmd = 'exec sp_changeObjectOwner '''+USER_NAME(@CurOwner)+'.'+@TableName+''', ''bmssa'''
   print   @dyn_cmd
   EXECUTE(@dyn_cmd)
   -- This is executed as long as the previous fetch succeeds.
   FETCH NEXT FROM SysObj into @TableName,@CurOwner
END

CLOSE SysObj
DEALLOCATE SysObj
GO
