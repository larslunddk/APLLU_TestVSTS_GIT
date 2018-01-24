USE AX40_KNI_drift
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP FUNCTION DC_BarcodeType
GO
CREATE FUNCTION DC_BarcodeType 
(	
	-- Add the parameters for the function here
	@ItemId			nvarchar(20),
	@Barcode		nvarchar(80),
	@Dataareaid		nvarchar(3)
)
RETURNS INT
AS
BEGIN
	declare @BarcodeType as int	 
	SELECT     @BarcodeType = BARCODESETUP.BARCODETYPE
		FROM         INVENTITEMBARCODE INNER JOIN
                      BARCODESETUP ON INVENTITEMBARCODE.BARCODESETUPID = BARCODESETUP.BARCODESETUPID AND 
                      INVENTITEMBARCODE.DATAAREAID = BARCODESETUP.DATAAREAID AND 
					 (INVENTITEMBARCODE.DATAAREAID = @Dataareaid) AND
					 (INVENTITEMBARCODE.ITEMID = @ItemId) AND
				     (INVENTITEMBARCODE.ITEMBARCODE = @Barcode)
	RETURN ISNULL(@BarcodeType,0)
END
GO
DROP PROCEDURE DC_ModuleInventPcsPrice
GO
CREATE FUNCTION DC_ModuleInventPcsPrice 
(	
	-- Add the parameters for the function here
	@ItemId			nvarchar(20),
	@Dataareaid		nvarchar(3)
)
RETURNS Numeric(28,12)
AS
BEGIN
	declare @PRICE Numeric(28,12)
	declare @PRICEUNIT Numeric(28,12)
	declare @MARKUP Numeric(28,12)
	declare @PRICEQTY Numeric(28,12)
	declare @ALLOCATEMARKUP int
	declare @PRICEPCS Numeric(28,12)
	
	 SELECT     @PRICE = PRICE, @PRICEUNIT = PRICEUNIT, @MARKUP = MARKUP, @PRICEQTY = PRICEQTY, @ALLOCATEMARKUP = ALLOCATEMARKUP
		FROM         INVENTTABLEMODULE
		WHERE     (ITEMID = @ItemId) AND (MODULETYPE = 0) AND (DATAAREAID = @Dataareaid)

	SET @PRICEPCS = @PRICE / CASE WHEN @PRICEUNIT>1 THEN @PRICEUNIT ELSE 1 END
	if (@ALLOCATEMARKUP = 1)
	begin
		SET @PRICEPCS = @PRICEPCS + (@MARKUP / CASE WHEN @PRICEQTY>1 THEN @PRICEQTY ELSE 1 END)
	end


	RETURN @PRICEPCS
END
GO
-- =============================================
-- Author:		Lars Lund
-- Create date: 25-11-2008
-- Description:	Opslag på fysisk lager på lagersted
-- =============================================
DROP FUNCTION DC_PhysicalInventQty
GO
CREATE FUNCTION DC_PhysicalInventQty 
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
DROP FUNCTION DC_StoreIdFromInventLocation
GO
CREATE FUNCTION DC_StoreIdFromInventLocation 
(	
	-- Add the parameters for the function here
	@InventLocation nvarchar(20),
	@Dataareaid		nvarchar(3)
)
RETURNS nvarchar(20)
AS
BEGIN
	declare @StoreId as nvarchar(20)
	
	
	
	SELECT @StoreId = STOREID 
	FROM RCMSTORETABLE WHERE (RCMSTORETABLE.INVENTLOCATIONID = @InventLocation) AND (RCMSTORETABLE.DATAAREAID = @Dataareaid)
	
	
	Return @StoreId

END
GO
DROP FUNCTION DC_InventLocationFromStoreId
GO
CREATE FUNCTION DC_InventLocationFromStoreId
(	
	-- Add the parameters for the function here
	@Storeid	    nvarchar(20),
	@Dataareaid		nvarchar(3)
)
RETURNS nvarchar(20)
AS
BEGIN
	declare @InventLocationid as nvarchar(20)
	
	
	
	SELECT @InventLocationid = INVENTLOCATIONID 
	FROM RCMSTORETABLE WHERE (RCMSTORETABLE.STOREID = @Storeid) AND (RCMSTORETABLE.DATAAREAID = @Dataareaid)
	
	
	Return @InventLocationid

END
GO
IF object_id(N'DC_UpdateRecIdInTmp', 'P') IS NOT NULL
	DROP PROCEDURE DC_UpdateRecIdInTmp
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
GO