set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DC_UpdateRecIdInTmp]
AS
	declare @Count int
	Declare @NewRecId   as bigint
	select @Count = count(*) from TMP_UpdStoreBarcodeItem where recid = 999
	UPDATE dbo.SystemSequences SET    @NewRecid  = NextVal,	NextVal    = NextVal + @Count
		WHERE ID = -1 AND TABID = 20267 AND Dataareaid = 'dat'	

	update dbo.TMP_UpdStoreBarcodeItem set @NewRecid = @NewRecid + 1,
				 recid = @NewRecid
		where recid = 999

	update TMP_UpdStoreBarcodeItem set recid = 999
		where exists (select * from RCMSUPSTOREBARCODETABLE where RCMSUPSTOREBARCODETABLE.recid = TMP_UpdStoreBarcodeItem.recid)

	select @Count = count(*) from RCMSUPSTOREBARCODETABLE where recid = 999
	if (@Count>0)
		exec [dbo].[DC_UpdateRecIdInTmp]

