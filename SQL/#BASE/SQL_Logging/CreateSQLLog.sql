SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE [dbo].[LP_UPGLOGTABLE]
DROP PROCEDURE dbo.LogProgressInfo
GO
CREATE TABLE [dbo].[LP_UPGLOGTABLE](
	[TXT] [nvarchar](max) COLLATE Danish_Norwegian_CI_AS NULL,
	[DATEUPD] [datetime] NULL,
	/*[TIMEUPD] [nchar](10) COLLATE Danish_Norwegian_CI_AS NULL,*/
	[StartEnd] [int] NULL,
	[JobCode] [nchar](10) COLLATE Danish_Norwegian_CI_AS NULL
) ON [PRIMARY]
GO
CREATE PROCEDURE dbo.LogProgressInfo @InfoLine Varchar(100), @Jobcode varchar(50) = 'Empty', @StartEnd int = 0 AS
	select CONVERT(char(30), getdate())+' '+@InfoLine + ' -- ' + @Jobcode 
	IF  EXISTS (SELECT * FROM sys.objects 
					WHERE object_id = OBJECT_ID(N'[dbo].[LP_UPGLOGTABLE]') AND type in (N'U')) 
	BEGIN
		INSERT INTO LP_UPGLOGTABLE
                      (TXT, DATEUPD, /*[TIMEUPD],*/ STARTEND, JOBCODE)
			VALUES    (@InfoLine,getdate(),/*convert(char(8),getdate(),108),*/ @StartEnd, @Jobcode)
GO
-- TEST LOGNING
Exec AXKNI_MOVE.dbo.LogProgressInfo 'Step 1 - Dette er en test','Step0',1