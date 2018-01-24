exec lp_dropProcedure 'UL_CreateProjCustUsageTable'
GO
CREATE PROCEDURE UL_CreateProjCustUsageTable AS
BEGIN
	Exec dbo.LP_LogProgressInfo 'UL_CreateProjCustUsageTable Started','UL_CreateProjCustUsageTable',1
	delete from bmssa.projcustusage
	drop table bmssa.projcustusageshadow
	Exec dbo.LP_LogProgressInfo 'UL_CreateProjCustUsageTable Delete_Drop completed','Step1',0
	SELECT     1 as ProjCustUsageType,CUSTACCOUNT, PROJID, DATAAREAID, RECID
		INTO         bmssa.projcustusageshadow
		FROM         bmssa.PROJTABLE
		WHERE		custaccount <> ''
	Exec dbo.LP_LogProgressInfo 'UL_CreateProjCustUsageTable CustAccount completed','Step1',0
	INSERT INTO bmssa.projcustusageshadow
		SELECT     1 , MANUFACTURER, PROJID, DATAAREAID, RECID
		FROM         bmssa.PROJTABLE
		WHERE     (MANUFACTURER <> '')
	Exec dbo.LP_LogProgressInfo 'UL_CreateProjCustUsageTable Manufacturer completed','Step1',0
	INSERT INTO bmssa.projcustusageshadow
		SELECT 1 , DEMKOFIPRODUKTIONSITE, PROJID, DATAAREAID, RECID
		FROM         bmssa.PROJTABLE
		WHERE     (DEMKOFIPRODUKTIONSITE <> '')
	Exec dbo.LP_LogProgressInfo 'UL_CreateProjCustUsageTable DemkoFIProductionSite completed','Step1',0
	INSERT INTO bmssa.projcustusageshadow
		SELECT     1 AS ProjCustUsageType, PRODUCTIONSITE, PROJID, DATAAREAID, RECID
		FROM         bmssa.PROJPRODUCTIONSITE
	Exec dbo.LP_LogProgressInfo 'UL_CreateProjCustUsageTable ProjProductionSite completed','Step1',0

	Declare @NewRecId   as int
	declare @count		as int

	select @Count = count(*) from bmssa.projcustusageshadow

		
	UPDATE bmssa.SystemSequences
			SET    @NewRecid  = NextVal,
					NextVal    = NextVal + @Count
			WHERE ID = -1 AND TABID = 0 AND Dataareaid = 'dat'	
	
	update bmssa.projcustusageshadow set @NewRecid = @NewRecid + 1,
				 recid = @NewRecid; 
	Exec dbo.LP_LogProgressInfo 'UL_CreateProjCustUsageTable New RecIds completed','Step1',0
	insert into bmssa.ProjCustUsage select * From bmssa.projcustusageshadow
	Exec dbo.LP_LogProgressInfo 'UL_CreateProjCustUsageTable completed','Step1',2
END
GO

use axdb_demko
exec UL_CreateProjCustUsageTable
