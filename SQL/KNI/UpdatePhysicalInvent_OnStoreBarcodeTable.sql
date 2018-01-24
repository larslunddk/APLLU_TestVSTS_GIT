SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Lars Lund
-- Create date: 25-11-2008
-- Description:	Opslag på fysisk lager på lagersted
-- =============================================
CREATE FUNCTION PhysicalInventQty 
(	
	-- Add the parameters for the function here
	@InventLocation nvarchar(20),
	@ItemId			nvarchar(20),
	@Dataareaid		nvarchar(3)
)
RETURNS Numeric(28,12) 
AS
BEGIN
	declare @PhysInvent as numeric(28,12)
	
	
	SELECT    @PhysInvent = INVENTSUM.POSTEDQTY + INVENTSUM.RECEIVED - INVENTSUM.DEDUCTED + INVENTSUM.REGISTERED - INVENTSUM.PICKED
	FROM         INVENTSUM INNER JOIN
                     INVENTDIM ON INVENTSUM.INVENTDIMID = INVENTDIM.INVENTDIMID AND INVENTSUM.DATAAREAID = INVENTDIM.DATAAREAID
	WHERE     (INVENTDIM.INVENTLOCATIONID = @InventLocation) AND (INVENTSUM.ITEMID = @ItemId) and (inventsum.dataareaid = @Dataareaid)
	
	
	Return ISNULL(@PhysInvent, 0)

END
GO
update rcmSupStoreBarcodeTable
	set PhysicalOnHand = dbo.PhysicalInventQty(LTRIM(rcmSupStoreBarcodeTable.StoreId), rcmSupStoreBarcodeTable.ItemId, rcmSupStoreBarcodeTable.dataareaid)	
from rcmSupStoreBarcodeTable