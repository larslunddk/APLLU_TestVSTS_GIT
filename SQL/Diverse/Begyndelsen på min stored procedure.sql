
use ax30_develop
IF EXISTS (SELECT name 
	   FROM   sysobjects 
	   WHERE  name = N'PCS_UpdTRSReport' 
	   AND 	  type = 'P')
    DROP PROCEDURE PCS_UpdTRSReport
GO

CREATE PROCEDURE PCS_UpdTRSReport 
	@FromDate smalldatetime = CAST('2007-01-01' AS smalldatetime)
AS
	Declare @PCS_TRSID as varchar(20),
		@LATESTDATECUST as smalldatetime, 
		@LATESTDATEPCS as smalldatetime,  
		@PCS_USER_DESC as varchar(127)
	Declare PCS_TRSReport CURSOR FOR
		select PCS_TRSID, LATESTDATECUST, LATESTDATEPCS,  PCS_USER_DESC 
			from dbo.PCS_TRSReport 
			where LastUpdateDate >= @FromDate
			and   PCS_CustomerNo <> '9901'
			order by PCS_TRSID
	OPEN PCS_TRSReport
	FETCH NEXT FROM PCS_TRSReport into @PCS_TRSID,@LATESTDATECUST,@LATESTDATEPCS,@PCS_USER_DESC

	WHILE @@FETCH_STATUS = 0
	BEGIN
		print @PCS_TRSID+' '+@LATESTDATECUST+' '+@LATESTDATEPCS+' '+@PCS_USER_DESC
		FETCH NEXT FROM PCS_TRSReport into @PCS_TRSID,@LATESTDATECUST,@LATESTDATEPCS,@PCS_USER_DESC
	END
	CLOSE PCS_TRSReport
	DEALLOCATE PCS_TRSReport
GO

-- =============================================
-- example to execute the store procedure
-- =============================================
Use ax30_develop
EXECUTE PCS_UpdTRSReport CAST('2007-01-01' AS smalldatetime)
GO

