use widsql3_cit_udv

DROP PROCEDURE sp_AppendToFile
GO
CREATE PROCEDURE sp_AppendToFile(@FileName varchar(255), @Text1 varchar(4000)) AS
DECLARE @FS int, @OLEResult int, @FileID int


EXECUTE @OLEResult = sp_OACreate 'Scripting.FileSystemObject', @FS OUT
IF @OLEResult <> 0 PRINT 'Scripting.FileSystemObject'

--Open a file
execute @OLEResult = sp_OAMethod @FS, 'OpenTextFile', @FileID OUT, @FileName, 8, 1
IF @OLEResult <> 0 PRINT 'OpenTextFile'

--Write Text1
execute @OLEResult = sp_OAMethod @FileID, 'WriteLine', Null, @Text1
IF @OLEResult <> 0 PRINT 'WriteLine'

EXECUTE @OLEResult = sp_OADestroy @FileID
EXECUTE @OLEResult = sp_OADestroy @FS
GO

---------------------------------------------------------------------------------------------------------------------------
declare @SplitSize	int
declare @MinValue	int
declare @MaxValue	bigint
declare @FromValue	bigint
declare @SQLStr		varchar(4000)
declare @FullSQL	varchar(4000)
declare @FileNo		bigint
declare @Maxfileno	bigint
declare @FileName	Varchar(100)

select @MinValue = 0
select @MaxValue = 2000000000
select @SplitSize = 200000000
select @FromValue = @MinValue
select @fileno = 0
select @Maxfileno = 0


while ((@FromValue+@SplitSize) <= @MaxValue)
BEGIN
	select @fileno = @fileno + 1
	select @Maxfileno = @Fileno
	select @SQLStr = 'use widsql3_cit_1
 UPDATE [InventSettlement] SET [InventSettlement].[ItemId]= [InventTrans].[ItemId]
 from [InventSettlement] inner join [InventTrans]
 on [InventSettlement].[DATAAREAID] = ''wid''
 AND [InventTrans].[RecId] = [InventSettlement].[TransRecId]
 AND [InventSettlement].[TransRecId] > '+cast((@FromValue) as varchar)+'
 AND [InventSettlement].[TransRecId] <= '+cast((@FromValue+@SplitSize) as varchar)+'
 AND [InventTrans].[DATAAREAID] = ''wid''
 ';
/*	select @SQLStr = 'use widsql3_cit_1
select count(*) from [InventSettlement] inner join [InventTrans]
on [InventSettlement].[DATAAREAID] = ''wid''
AND [InventTrans].[RecId] = [InventSettlement].[TransRecId]
AND [InventSettlement].[TransRecId] > '+cast((@FromValue) as varchar)+'
AND [InventSettlement].[TransRecId] <= '+cast((@FromValue+@SplitSize) as varchar)+'
AND [InventTrans].[DATAAREAID] = ''wid''
';*/
	
	select @SQLStr = Replace(@SQLStr,'  ',' ')
	select @FileName = 'c:\sqlstmt\Upd_'+cast(@FileNo as varchar)+'.sql'
	exec sp_AppendToFile @FileName, @SQLStr;

	select @SQLStr = 'sqlcmd -Swidexsql12 -E -i Upd_'+cast(@FileNo as varchar)+'.sql -d widsql3_cit_udv'
	select @FileName = 'c:\sqlstmt\Upd_'+cast(@FileNo as varchar)+'.bat'
	exec sp_AppendToFile @FileName, @SQLStr;
	exec sp_AppendToFile @FileName, 'pause';

	--xp_cmdshell 'dir *.exe' --@FileName
	select @FromValue = @FromValue + @SplitSize
END

/*
select @fileno = 0
while (@fileno <= @Maxfileno)
BEGIN
	select @fileno = @fileno + 1
	select @FileName = 'c:\sqlstmt\Upd_'+cast(@FileNo as varchar)+'.sql';

	--xp_cmdshell 'dir *.exe' 
END
xp_cmdshell 'dir *.exe' */


