CREATE DATABASE Archive 
ON
PRIMARY ( NAME = Archive,
    FILENAME = 'c:\sqldata\Archive.mdf'),
FILEGROUP FileStreamGroup1 CONTAINS FILESTREAM( NAME = Archive_fs,
    FILENAME = 'c:\sqldata\Archive_fs.Filestream')
LOG ON  ( NAME = Archlog1,
    FILENAME = 'c:\sqldata\Archive_log.ldf')
GO
use archive
--drop table Archive.dbo.Records
CREATE TABLE Archive.dbo.Records
(
	--[Id] [uniqueidentifier] ROWGUIDCOL DEFAULT (NEWID()) NOT NULL UNIQUE,
	[Id] int IDENTITY,
	[DIRECTORY] NVARCHAR(200) NOT NULL,
	[FILENAME] NVARCHAR(200) NOT NULL,
	[EXTENSION] NVARCHAR(20) NOT NULL,
	[doc] VARBINARY(MAX) FILESTREAM NULL
)
GO
ALTER TABLE Archive.dbo.Records WITH NOCHECK ADD   
constraint 
   
GO
delete from Archive.dbo.Records 
--insert into Archive.dbo.Records (DIRECTORY,[FILENAME],[doc])
--	select DIRECTORY,[FILENAME],
--	(select * FROM OPENROWSET(BULK 'c:\text.txt', SINGLE_BLOB)) AS Document
--	From axdb_develop.dbo.LP_DOCUMENTS --where DIRECTORY <> null and [FILENAME]<>NULL
GO	
------------------------------------------------------------------------------------------------------------	
      
declare @Dir	nvarchar(1000)
declare @File	nvarchar(1000)
declare @SQLStr	nvarchar(1000)
declare FileList cursor for
		select DIRECTORY,[FILENAME]	From axdb_develop.dbo.LP_DOCUMENTS
		
	OPEN FileList
	FETCH NEXT FROM FileList INTO @dir,@file
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @SQLStr = 'insert into Archive.dbo.Records (DIRECTORY,[FILENAME],[EXTENSION],[doc])
						select DIRECTORY,[FILENAME],[EXTENSION],
						(select * FROM OPENROWSET(BULK N'''+@dir+'\'+@file+''', SINGLE_BLOB) AS Document)
						From axdb_develop.dbo.LP_DOCUMENTS where DIRECTORY = '''+@Dir +'''and [FILENAME] = '''+@File+''''

		--SET @SQLStr = 'update Archive.dbo.Records set [doc] = '+
		--		'(select * FROM OPENROWSET(BULK N'''+@dir+'\'+@file+''', SINGLE_BLOB)'
		--select @SQLStr				
		EXEC ( @SQLStr )				
	  FETCH NEXT FROM FileList INTO @dir,@file
	END
	CLOSE FileList
	DEALLOCATE FileList	
	
--update Archive.dbo.Records set doc = (select * from OPENROWSET(BULK 'C:\t1.docx', SINGLE_BLOB)) as WordDocument
select COUNT(*) from axdb_develop.dbo.LP_DOCUMENTS
select COUNT(*) from Archive.dbo.Records
