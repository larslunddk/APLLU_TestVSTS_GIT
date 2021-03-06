IF EXISTS (
  SELECT * 
    FROM INFORMATION_SCHEMA.ROUTINES 
   WHERE SPECIFIC_SCHEMA = N'dbo'
     AND SPECIFIC_NAME = N'AP_UpdNextRecID_AX2009' 
)
   DROP PROCEDURE dbo.AP_UpdNextRecID_AX2009
GO

CREATE PROCEDURE dbo.AP_UpdNextRecID_AX2009
	@TableName nvarchar(100) = '' 
AS
	declare @tableNum as bigint
	declare @maxRecId as bigint
	declare @dyn_cmd as nvarchar(127)

	select @tableNum = TableId from SQLDICTIONARY where fieldid=0 and name = @TableName
	SET @dyn_cmd = 'select @maxRecId = max(recid) from [dbo].['+@TableName+']'
	--set @maxRecId = EXECUTE(@dyn_cmd)
	exec sp_executesql @dyn_cmd, N'@maxRecId bigint out', @maxRecId out

	--print 'TabId '+cast(@TableNum as nvarchar(20))+'  TableName '+@Tablename
	if (exists(select 1 from dbo.SYSTEMSEQUENCES WHERE ID = -1 AND TABID = @tableNum AND Dataareaid = 'dat'))
		update dbo.SYSTEMSEQUENCES 
				SET    NextVal    = @maxRecId + 1
				WHERE ID = -1 AND TABID = @tableNum AND Dataareaid = 'dat';
	else
		-- AX2012: insert into [dbo].SYSTEMSEQUENCES VALUES(-1,@maxRecId + 1, 1,9223372036854775807,0,'SEQNO',@Tablenum,'dat',1,-1);
		-- AX2009:
		insert into [dbo].SYSTEMSEQUENCES VALUES(-1,1, 1,9223372036854775807,0,'SEQNO',@Tablenum,'dat',-1,1);	
GO


use axdb_HOLDING
declare @TableName		varchar(127)
	,@CurOwner		INT
	,@dyn_cmd               varchar(127)

declare SysObj CURSOR FOR
		select name, uid from dbo.sysobjects 
			where --name = 'ledgerjournaltable' and
			(OBJECTPROPERTY(id, N'IsUserTable') = 1	or OBJECTPROPERTY(id, N'IsView') = 1)


OPEN SysObj
FETCH NEXT FROM SysObj into @TableName,@CurOwner

WHILE @@FETCH_STATUS = 0
BEGIN
	select @dyn_cmd = 'EXECUTE dbo.AP_UpdNextRecID_AX2009 '''+@Tablename+''''

	--print   @dyn_cmd
    EXECUTE(@dyn_cmd)
   	FETCH NEXT FROM SysObj into @TableName,@CurOwner
END

CLOSE SysObj
DEALLOCATE SysObj
GO


--- BELOW FOR TESTING PURPOSES ONLY
--declare @tableNum as bigint
--select @tableNum=TABLEID from SQLDICTIONARY where fieldid=0 and name = 'Ledgerjournaltable'
--select @tableNum
--select * from dbo.SYSTEMSEQUENCES 
--	WHERE ID = -1 AND TABID = @tableNum AND Dataareaid = 'dat';