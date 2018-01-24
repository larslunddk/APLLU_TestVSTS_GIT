DROP PROCEDURE UL_CreateProjCustUsageTable 
GO
CREATE PROCEDURE UL_CreateProjCustUsageTable AS
BEGIN
	BEGIN TRAN
	delete from bmssa.projcustusage
	drop table bmssa.projcustusageshadow
	
	SELECT     1 as ProjCustUsageType,CUSTACCOUNT, PROJID, DATAAREAID, RECID
		INTO         bmssa.projcustusageshadow
		FROM         bmssa.PROJTABLE
		WHERE		custaccount <> ''

	INSERT INTO bmssa.projcustusageshadow
		SELECT     1 , MANUFACTURER, PROJID, DATAAREAID, RECID
		FROM         bmssa.PROJTABLE
		WHERE     (MANUFACTURER <> '')

	INSERT INTO bmssa.projcustusageshadow
		SELECT 1 , DEMKOFIPRODUKTIONSITE, PROJID, DATAAREAID, RECID
		FROM         bmssa.PROJTABLE
		WHERE     (DEMKOFIPRODUKTIONSITE <> '')

	INSERT INTO bmssa.projcustusageshadow
		SELECT     1 AS ProjCustUsageType, PRODUCTIONSITE, PROJID, DATAAREAID, RECID
		FROM         bmssa.PROJPRODUCTIONSITE

	Declare @NewRecId   as int
	declare @count		as int

	select @Count = count(*) from bmssa.projcustusageshadow

		
	UPDATE bmssa.SystemSequences
			SET    @NewRecid  = NextVal,
					NextVal    = NextVal + @Count
			WHERE ID = -1 AND TABID = 0 AND Dataareaid = 'dat'	
	
	update bmssa.projcustusageshadow set @NewRecid = @NewRecid + 1,
				 recid = @NewRecid; 

	insert into bmssa.ProjCustUsage select * From bmssa.projcustusageshadow
	COMMIT TRAN
END
GO

use axdb_demko
exec UL_CreateProjCustUsageTable
