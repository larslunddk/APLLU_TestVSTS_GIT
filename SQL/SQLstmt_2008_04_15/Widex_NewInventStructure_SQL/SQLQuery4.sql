USE [widsql3_cit_udv]
GO
/****** Object:  StoredProcedure [dbo].[LogProgressInfo]    Script Date: 04/07/2008 10:11:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

ALTER PROCEDURE [dbo].[LogProgressInfo] @InfoLine Varchar(100), @Jobcode varchar(50) = 'Empty', @StartEnd int = 0 AS
	select CONVERT(char(30), getdate())+' '+@InfoLine  
	IF  EXISTS (SELECT * FROM sys.objects 
					WHERE object_id = OBJECT_ID(N'[dbo].[CIT_UPGLOGTABLE]') AND type in (N'U')) 
	BEGIN
		Declare @NewRecId   as int
		UPDATE dbo.SystemSequences SET @NewRecid  = NextVal, NextVal    = NextVal + 1
			WHERE ID = -1 AND TABID = 0 AND Dataareaid = 'wid';
		INSERT INTO CIT_UPGLOGTABLE
                      (TXT, DATEUPD, TIMESTRFROM, SESSIONID, DATAAREAID, RECID, STARTEND, JOBCODE)
			VALUES    (@InfoLine,getdate(),convert(char(8),getdate(),108), 999,'WID',@NewRecID, @StartEnd, @Jobcode)

	END
	/*IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES 
					WHERE SPECIFIC_SCHEMA = N'dbo' AND SPECIFIC_NAME = N'LogProgressInfo')
		CREATE TABLE CIT_LogProgressInfoTable	
*/
