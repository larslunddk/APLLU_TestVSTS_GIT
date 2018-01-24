use AP_XRef_Backup
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
drop procedure APCopyTable
go
create procedure APCopyTable 
	@FromDB nvarchar(100) = 'axdb_HCT', 
	@ToDB nvarchar(100) = 'AP_xRef_Backup',
	@TableName nvarchar(100) = 'xRefNames'	
as
begin
	declare @ExecStr nvarchar(1000)
	set @ToDB = @ToDB+'.dbo.'
	set @FromDB = @FromDB+'.dbo.'	
	set @ExecStr = 'drop table '+@ToDB+@TableName;
  	EXECUTE(@ExecStr)
	--print @ExecStr

	
	set @ExecStr = 'select * into '+@ToDB+@TableName+' from '+@FromDB+@TableName
	EXECUTE(@ExecStr)
	--print @ExecStr

end
go
if (1=0)
begin
	exec APCopyTable 'axdb_TEST','AP_XRef_Backup','XREFNAMES'
	exec APCopyTable 'axdb_TEST','AP_XRef_Backup','XREFPATHS'
	exec APCopyTable 'axdb_TEST','AP_XRef_Backup','XREFREFERENCES'
	exec APCopyTable 'axdb_TEST','AP_XRef_Backup','XREFTABLERELATION'
	exec APCopyTable 'axdb_TEST','AP_XRef_Backup','XREFTYPEHIERARCHY'
end
GO

if (1=1)
begin
	exec APCopyTable 'AP_XRef_Backup','axdb_TEST','XREFNAMES'
	exec APCopyTable 'AP_XRef_Backup','axdb_TEST','XREFPATHS'
	exec APCopyTable 'AP_XRef_Backup','axdb_TEST','XREFREFERENCES'
	exec APCopyTable 'AP_XRef_Backup','axdb_TEST','XREFTABLERELATION'
	exec APCopyTable 'AP_XRef_Backup','axdb_TEST','XREFTYPEHIERARCHY'
end
GO


