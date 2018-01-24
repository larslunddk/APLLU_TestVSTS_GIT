--=========================================
-- Create scalar-valued function template
--=========================================

USE LLUTmpWid
GO
--*** CREATE NEEDED VIEW
if ((select name from sys.sysobjects where sys.sysobjects.xtype = 'V' and sys.sysobjects.name = 'sysTableColumns')<>'')
BEGIN
	drop view sysTableColumns
END 
GO
Create view sysTableColumns as
SELECT  sys.sysobjects.name as TableName, sys.syscolumns.name AS FieldName,
		sys.sysobjects.id, sys.sysobjects.xtype, sys.sysobjects.uid
FROM         sys.sysobjects INNER JOIN
             sys.syscolumns ON sys.sysobjects.id = sys.syscolumns.id
WHERE     (sys.sysobjects.xtype = 'U');
GO

IF OBJECT_ID (N'dbo.ColumnList') IS NOT NULL
   DROP FUNCTION dbo.ColumnList
GO

CREATE FUNCTION ColumnList (@Tblname Varchar(50))
RETURNS Varchar(4000)
--WITH EXECUTE AS CALLER
AS
-- place the body of the function here
BEGIN
	Declare @SQLCmd as varchar(4000)
	Declare @SQLCmd_ColName as varchar(4000)
	select @SQLCmd = '';
	Declare STC_Cursor cursor for 
		select Tablename+'.'+Fieldname+',' from sysTableColumns
			where sysTableColumns.Tablename = @Tblname;
	OPEN STC_Cursor
	FETCH NEXT FROM STC_Cursor INTO @SQLCmd_ColName
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SELECT @SQLCmd = @SQLCmd + @SQLCmd_ColName
		--print @SQLCmd_ColName+' >'+@SQLCmd
		FETCH NEXT FROM STC_Cursor INTO @SQLCmd_ColName
	END
	CLOSE STC_Cursor
	DEALLOCATE STC_Cursor 
	select @SQLCmd = substring(@SQLCmd,1,len(@SQLCmd)-1)
	RETURN @SQLCmd
END
GO
--select dbo.columnlist('custgroup')