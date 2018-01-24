-- Drop stored procedure if it already exists
use widsql3_cit_1
---- MOG ------------------------------------------------------------------
IF  EXISTS (SELECT * FROM sys.objects 
                 WHERE object_id = OBJECT_ID(N'[dbo].[TimeSec]')
                      AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))        
           DROP FUNCTION [dbo].[TimeSec];
GO

-- =============================================
-- Author:		MOG, 04/07/2008
-- Function:	Return seconds since midnigth
-- =============================================
CREATE FUNCTION TimeSec()
	returns int AS
BEGIN
	DECLARE @Res as int
	DECLARE @Now as DateTime
	select @Now = GETDATE()
	select @Res = DATEPART(HOUR, @Now) * 3600 +	
			      DATEPART(MINUTE, @Now) * 60 +
				  DATEPART(SECOND, @Now)
	return @res
END
GO

IF  EXISTS (SELECT * FROM sys.objects 
                 WHERE object_id = OBJECT_ID(N'[dbo].[RLen]')
                      AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))        
           DROP FUNCTION [dbo].[RLen];
GO

-- =============================================
-- Author:		MOG, 04/09/2008
-- Function:	Return the VarChar right alignet
-- =============================================
CREATE FUNCTION dbo.RLen(@inputText nvarchar(255), @length int)
RETURNS NVARCHAR(255)
WITH SCHEMABINDING -- Performance
BEGIN
	set @inputText = LTRIM(@inputText);
	return right(space(@length) + @inputText, @length)
END
GO
---- MOG ------------------------------------------------------------------

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES 
					WHERE SPECIFIC_SCHEMA = N'dbo' AND SPECIFIC_NAME = N'LogProgressInfo')
   DROP PROCEDURE dbo.LogProgressInfo
GO

CREATE PROCEDURE dbo.LogProgressInfo @InfoLine Varchar(100), @Jobcode varchar(50) = 'Empty', @StartEnd int = 0 AS
	select CONVERT(char(30), getdate())+' '+@InfoLine  
	IF  EXISTS (SELECT * FROM sys.objects 
					WHERE object_id = OBJECT_ID(N'[dbo].[CIT_UPGLOGTABLE]') AND type in (N'U')) 
	BEGIN
		Declare @NewRecId   as int
		UPDATE dbo.SystemSequences SET @NewRecid  = NextVal, NextVal    = NextVal + 1
			WHERE ID = -1 AND TABID = 0 AND Dataareaid = 'wid';
		INSERT INTO CIT_UPGLOGTABLE
                      (TXT, DATEUPD, TIMESTRFROM, TIMEINT, SESSIONID, DATAAREAID, RECID, STARTEND, JOBCODE)
			VALUES    (@InfoLine,getdate(),convert(char(8),getdate(),108),dbo.TimeSec(),999,'WID',@NewRecID, @StartEnd, @Jobcode)

	END
	/*IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES 
					WHERE SPECIFIC_SCHEMA = N'dbo' AND SPECIFIC_NAME = N'LogProgressInfo')
		CREATE TABLE CIT_LogProgressInfoTable	
*/
GO

Exec dbo.LogProgressInfo 'Step 1 - SQL Datakonvertering startet','Step1',1

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES 
					WHERE SPECIFIC_SCHEMA = N'dbo' AND SPECIFIC_NAME = N'DropView')
   DROP PROCEDURE dbo.DropView
GO

CREATE PROCEDURE dbo.DropView @ViewName Varchar(50) AS
	Declare @SQLString varchar(4000)
	IF object_id(N'dbo.'+@ViewName, 'V') IS NOT NULL
	BEGIN
		select @SQLString = 'DROP VIEW dbo.'+@ViewName
		EXECUTE(@SQLString)
	END
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES 
					WHERE SPECIFIC_SCHEMA = N'dbo' AND SPECIFIC_NAME = N'DropTable')
   DROP PROCEDURE dbo.DropTable
GO

CREATE PROCEDURE dbo.DropTable @TableName Varchar(50) AS
	Declare @SQLString varchar(4000)
	IF object_id(N'dbo.'+@TableName, 'U') IS NOT NULL
	BEGIN
		select @SQLString = 'DROP Table dbo.'+@TableName
		EXECUTE(@SQLString)
	END
GO



IF  EXISTS (SELECT * FROM sys.objects 
					WHERE object_id = OBJECT_ID(N'[dbo].[SetCombination]')
                      AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))        
	DROP FUNCTION [dbo].[SetCombination];
GO

CREATE FUNCTION SetCombination (@ItemId varchar(100), @Config varchar(100))
				Returns varchar(100) AS
BEGIN
    DECLARE @OutputItemId varchar(100)
    SELECT @OutputItemId = CASE WHEN @ItemId <> '' THEN @ItemId + ' ' + @Config ELSE @ItemId END;
    Return @OutputItemId;
END
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES 
					WHERE SPECIFIC_SCHEMA = N'dbo' AND SPECIFIC_NAME = N'DeleteDubletter')
   DROP PROCEDURE dbo.DeleteDubletter
GO
------------------------------------------------------------------------
CREATE PROCEDURE dbo.DeleteDubletter AS
BEGIN
	SET NOCOUNT ON
	Exec dbo.LogProgressInfo ' Step 1001 - InventItemLocation - Delete dubletter startet','Step1001',1
	exec droptable 'inventitemlocationTmp'
	select inventitemlocation.itemid, inventitemlocation.inventdimid,
		[ItemId]+' '+[InventDim].[ConfigId]	itemid2, 
		[InventDim].[InventDimIdNew]			inventdimid2
		into inventitemlocationTmp
		from [InventItemLocation] inner join [InventDim]
		on [InventItemLocation].[DATAAREAID] = 'wid'
		AND [InventItemLocation].[ItemId] <> ''
		AND [InventDim].[InventDimId] = [InventItemLocation].[InventDimId]
		AND [InventDim].[DATAAREAID] = 'wid'
		AND [InventDim].[configId] <> ''
	delete from inventitemlocation
		where exists (select itemid from inventitemlocationtmp iil
						where iil.itemid2		= inventitemlocation.itemid
						and   iil.inventdimid2	= inventitemlocation.inventdimid)
	exec droptable 'inventitemlocationTmp'
	--------------------------------------					

	exec droptable 'InventProductGroupItemTmp'
	select InventProductGroupItem.ProductGroupId, InventProductGroupItem.itemid, InventProductGroupItem.inventdimid_WDX,
			[ItemId]+' '+[InventDim].[ConfigId]	itemid2, 
			[InventDim].[InventDimIdNew]			inventdimid2
		into InventProductGroupItemTmp
		from InventProductGroupItem inner join [InventDim]
		on InventProductGroupItem.[DATAAREAID] = 'wid'
		AND InventProductGroupItem.[ItemId] <> ''	 
		AND [InventDim].[InventDimId] = InventProductGroupItem.[InventDimId_WDX]
		AND [InventDim].[DATAAREAID] = 'wid'
		AND [InventDim].[configId] <> ''
	
	delete from InventProductGroupItem
		where exists (select itemid from InventProductGroupItemTmp iil
						where iil.itemid2		= InventProductGroupItem.itemid
						and   iil.inventdimid2	= InventProductGroupItem.inventdimid_wdx
						and   iil.ProductGroupId= InventProductGroupItem.ProductGroupId)
	exec droptable 'InventProductGroupItemTmp'
	Exec dbo.LogProgressInfo ' Step 1001 - InventItemLocation - Delete dubletter afsluttet','Step1001',2
------------------------------------------------------------------------
END	
Exec dbo.LogProgressInfo 'Step 1 - Stored procedurer dannet - afsluttet','Step1',2

    /*RAISERROR ('.', -- Message text.
               16, -- Severity.
               1 -- State.
               );
*/
