USE [AX40SP2_KNI_UDV2]
GO
/****** Object:  StoredProcedure [dbo].[RCMSUPFODCGetConnectionIdsPaged]    Script Date: 12/01/2008 16:12:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE     [dbo].[RCMSUPFODCGetConnectionIdsPaged] 
	(
	@StoreDataAreaId		NVARCHAR(3),
	@StoreCompanyId			NVARCHAR(3),
	@StoreId				NVARCHAR(20),
	@StoreBarcode			NVARCHAR(80),
	@SearchString			NVARCHAR(200),
	@PageSize				INT,
	@PageNumber				INT,
	@SortField				NVARCHAR(50),  
	@SortDirection			NVARCHAR(4),
	@IsFromStoreToStore		INT,
	@RowCount				BIGINT	OUTPUT
	)
AS

	DECLARE @strFilter NVARCHAR(4000)
	DECLARE @strSort NVARCHAR(255)
	DECLARE @strTable NVARCHAR(500)
	DECLARE @strFields NVARCHAR(1000)
	DECLARE @strUnique	NVARCHAR(200)
	DECLARE @NewSearchString NVARCHAR(202)
	
	DECLARE @DCItem AS INT
	DECLARE @ItemId AS NVARCHAR(30)
	DECLARE @InventLocationId AS NVARCHAR(30)
	DECLARE @ShipmentTypeLimitation AS INT
	DECLARE @LastOrderDateOffset AS INT	
	DECLARE @LastOrderDate AS DATETIME
	DECLARE @TodayStr as NVARCHAR(30)
	
	SET @NewSearchString = '''' + LTRIM(RTRIM(@SearchString)) + ''''
	
	SELECT @InventLocationId = InventLocationId
	FROM RCMSTORETABLE ST
	WHERE LTRIM(RTRIM(ST.STOREID)) = LTRIM(RTRIM(@StoreId))
	AND ST.DATAAREAID = @StoreDataAreaId
	
	--DC-MSJ USE STOREID IN THE SELECT STATEMENT
	SELECT @DCItem = DCITEM, @ItemId = ItemId 
	FROM RCMSUPSTOREBARCODETABLE SBT 
	WHERE SBT.STOREBARCODE = @StoreBarcode
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
	SET @TodayStr = cast(YEAR(GETDATE())as nvarchar)+RIGHT('00'+cast(MONTH(GETDATE()) as nvarchar),2)+RIGHT('00'+cast(DAY(GETDATE()) as nvarchar),2)
	select @TodayStr
	SET @TodayStr = ''''+@TodayStr+''''
							 
	--@LastOrderDate = DATEADD(day,@LastOrderDateOffset,GETDATE()) 
	
	SET @strFields = ' PCT.DC_ConnectionId,
					  PCL.DlvDate,
					  PCT.LastOrderDate,
					  PCT.Description'
					  
	SET @strTable = ' DC_PurchConnectionLine PCL
					 INNER JOIN DC_PurchConnectionTable PCT 
					 ON PCT.DC_ConnectionId = PCL.DC_ConnectionId
					 AND (('+ CAST(@IsFromStoreToStore AS NVARCHAR(1))+ ' = 0 AND PCT.DC_ConnectionExternalInternal = ' + CAST(@DCItem AS NVARCHAR(1)) + ') 
					       OR ( '+ CAST(@IsFromStoreToStore AS NVARCHAR(1))+ ' = 1 AND PCT.DC_ConnectionExternalInternal = 1))
					  AND PCT.DATAAREAID = PCL.DATAAREAID'
					 
	SET @strFilter = ' PCL.InventLocationId = ''' + @InventLocationId + ''''
						--DC-MSJ ONLY FILTER ON SHIPMENTTYPE WHEN LIMITAITION IS 1
						+ CASE 
						WHEN (@ShipmentTypeLimitation = 2)
						THEN
							' AND PCT.DC_ShipmentType = 2 '
						WHEN (@ShipmentTypeLimitation = 1)
						THEN
							' AND (PCT.DC_ShipmentType = 1 OR PCT.DC_ShipmentType = 3) '
						ELSE
							''	
							--NOTHING 
						END
						+'AND PCT.LastOrderDate  >= (SELECT DATEADD(day,' + CAST(@LastOrderDateOffset AS VARCHAR) + ',CAST('+@TodayStr+' AS DATETIME)))'
					   + CASE 
						WHEN (LTRIM(@SearchString) <> '' AND  (LEFT(@SearchString, 1) = '%' OR RIGHT(@SearchString, 1) = '%')) 
						THEN
							--Search with wildcards
							 ' AND ( PCT.DC_ConnectionId LIKE ' + @NewSearchString + ') '								

						WHEN (LTRIM(@SearchString) <> '' AND  LEFT(@SearchString, 1) <> '%' AND RIGHT(@SearchString, 1) <> '%')
						THEN
							--Search without wildcards
							 ' AND ( PCT.DC_ConnectionId = ' + @NewSearchString + ') '								 
						ELSE
							--No searchstring
							''
						END
					    
	
		
	SET @strSort = 'PCT.DC_ConnectionId' + ' ' + @SortDirection
	SET @strUnique = 'PCT.DC_ConnectionId'

	--DC-MSJ @UseShipmentLimitation MUST BE 1 OR 0
	IF(@ShipmentTypeLimitation = 0 OR @ShipmentTypeLimitation = 1 OR @ShipmentTypeLimitation = 2)
	BEGIN
		EXEC RCMSUPFOSelectWithPaging	DEFAULT, 
										DEFAULT,
										@strFields,
										@strTable,
										@strFilter,
										@strSort,
										'',
										@strUnique,
										@PageNumber,
										@PageSize,
										''
-------------------------------------------------------------------------------------------------------------
		DECLARE @RowCountSQL	NVARCHAR(4000)
		SET @RowCountSQL = 'SET @RowCount = (SELECT COUNT(*) FROM ' + @strTable 
							+ CASE @strFilter
						
	 			WHEN '' THEN ''
					 			ELSE    ' WHERE ' + @strFilter 
								END
							+ ')'
		EXEC SP_EXECUTESQL @RowCountSQL
							, N'@RowCount BIGINT OUTPUT'
							, @RowCount OUTPUT
END
-------------------------------------------------------------------------------------------------------------
	
	RETURN 0
 