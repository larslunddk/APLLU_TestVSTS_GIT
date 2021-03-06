USE [AX40SP2_KNI_UDV2]
GO
/****** Object:  StoredProcedure [dbo].[RCMSUPFODCGetConnectionIds]    Script Date: 12/01/2008 12:16:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE     [dbo].[RCMSUPFODCGetConnectionIds] 
	(
	@StoreDataAreaId	NVARCHAR(3),
	@StoreCompanyId		NVARCHAR(3),
	@StoreId			NVARCHAR(20),
	@StoreBarcode		NVARCHAR(80),
	@IsFromStoreToStore INT
	)
AS

	SET NOCOUNT ON
	
	DECLARE @DCItem AS BINARY
	DECLARE @ItemId AS NVARCHAR(30)
	DECLARE @InventLocationId AS NVARCHAR(30)
	DECLARE @ShipmentTypeLimitation AS INT
	DECLARE @LastOrderDateOffset AS INT	
	DECLARE @LastOrderDate AS DATETIME
	DECLARE @Today as DATETIME
	
	
	SELECT @InventLocationId = InventLocationId
	FROM RCMSTORETABLE ST
	WHERE LTRIM(RTRIM(ST.STOREID)) = LTRIM(RTRIM(@StoreId))
	AND ST.DATAAREAID = @StoreDataAreaId
	
	--DC-MSJ USE STOREID IN THE SELECT STATEMENT	
	SELECT @DCItem = DCITEM, @ItemId = ItemId 
	FROM RCMSUPSTOREBARCODETABLE SBT 
	WHERE   SBT.STOREBARCODE = @StoreBarcode
		AND LTRIM(RTRIM(SBT.STOREID)) = LTRIM(RTRIM(@StoreId))
		AND SBT.DATAAREAID = @StoreDataAreaId
	
	SELECT     @ShipmentTypeLimitation = INVENTTABLE.DC_SHIPMENTTYPELIMITATION, 
			   @LastOrderDateOffset    = DC_INVENTPACKINGCODETABLE.DC_LASTORDERDATE_OFFSET
	FROM       INVENTTABLE				 INNER JOIN
               DC_INVENTPACKINGCODETABLE ON 
					INVENTTABLE.DATAAREAID			 = DC_INVENTPACKINGCODETABLE.DATAAREAID AND 
					INVENTTABLE.DC_INVENTPACKINGCODE = DC_INVENTPACKINGCODETABLE.INVENTPACKINGCODE
	WHERE     (INVENTTABLE.ITEMID	  = @ItemId) AND 
			  (INVENTTABLE.DATAAREAID = @StoreDataAreaId)

	SET @LastOrderDateOffset = -1 * @LastOrderDateOffset
	--DC-LLU do not use GETDATE() directly as it also holds the time of day that will be compared to lastOrderDate without time of day.
	SET @Today = cast(cast(YEAR(GETDATE())as nvarchar)+RIGHT('00'+cast(MONTH(GETDATE()) as nvarchar),2)+RIGHT('00'+cast(DAY(GETDATE()) as nvarchar),2) as datetime)
	
	SELECT	PCT.DC_ConnectionId,
			PCL.DlvDate,
			PCT.LastOrderDate,
			PCT.Description
	FROM DC_PurchConnectionLine PCL
	INNER JOIN DC_PurchConnectionTable PCT 
		ON PCT.DC_ConnectionId = PCL.DC_ConnectionId
		AND ((@IsFromStoreToStore = 0 AND PCT.DC_ConnectionExternalInternal = @DCItem) OR (@IsFromStoreToStore = 1 AND PCT.DC_ConnectionExternalInternal = 1))
		AND PCT.DATAAREAID = PCL.DATAAREAID
	WHERE PCL.InventLocationId = @InventLocationId
	AND PCT.LastOrderDate  >= (SELECT DATEADD(day,@LastOrderDateOffset,@Today))
	--DC-LLU
	AND ((@ShipmentTypeLimitation = 0) OR								                       -- All connectiontypes
		 (@ShipmentTypeLimitation = 2 AND PCT.DC_ShipmentType = 2) OR						   -- Only Air
		 (@ShipmentTypeLimitation = 1 AND (PCT.DC_ShipmentType = 1 OR PCT.DC_ShipmentType = 3))-- Ship or Ship/Air
        )
	ORDER BY PCT.DC_ConnectionId
	RETURN 0
 