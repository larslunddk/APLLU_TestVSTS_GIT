-- =============================================
-- Create basic stored procedure template
-- =============================================

-- Drop stored procedure if it already exists
IF EXISTS (
  SELECT * 
    FROM INFORMATION_SCHEMA.ROUTINES 
   WHERE SPECIFIC_SCHEMA = N'dbo.'
     AND SPECIFIC_NAME = N'AxProd_UpdPurchBarcodes' 
)
   DROP PROCEDURE dbo.AxProd_UpdPurchBarcodes
GO

CREATE PROCEDURE dbo.AxProd_UpdPurchBarcodes
AS
	
	begin tran
	declare @FromPurchId as nvarchar(60) = '4600001308'
	declare @ToPurchId as nvarchar(60) = '5600001308'
	--select 	purchid, LINENUMBER, purchline.itemid, purchline.barcode, purchline.inventdimid, InventDim1.INVENTCOLORID, InventDim1.INVENTSIZEID, InventDim1.INVENTSTYLEID, inventitembarcode.ITEMBARCODE, inventitembarcode.AP_EDIVENDITEMBARCODE from purchline 

	update purchline set purchline.BARCODE = (case when INVENTITEMBARCODE.AP_EDIVENDITEMBARCODE<>'' THEN INVENTITEMBARCODE.AP_EDIVENDITEMBARCODE 
																									ELSE INVENTITEMBARCODE.ITEMBARCODE END)
		from PURCHLINE
		join InventDim inventDim1 on
		inventDim1.inventdimid = PURCHLINE.INVENTDIMID
		join InventDim inventDim2 on
		inventDim2.INVENTCOLORID = inventDim1.INVENTCOLORID and
		inventDim2.INVENTSIZEID = inventDim1.INVENTSIZEID and
		inventDim2.INVENTSTYLEID = inventDim1.INVENTSTYLEID and
		inventDim2.WMSLOCATIONID = '' and
		inventDim2.INVENTSITEID = ''	 and
		inventDim2.CONFIGID = ''
		join INVENTITEMBARCODE on 
		INVENTITEMBARCODE.ITEMID = PURCHLINE.ITEMID
		and INVENTITEMBARCODE.INVENTDIMID =inventDim2.INVENTDIMID
		where useforprinting = 1
		and purchline.PURCHID >= @FromPurchId
		and purchline.purchid <= @ToPurchId
		and purchLine.barcode <> (case when INVENTITEMBARCODE.AP_EDIVENDITEMBARCODE<>'' THEN INVENTITEMBARCODE.AP_EDIVENDITEMBARCODE 
																									ELSE INVENTITEMBARCODE.ITEMBARCODE END)
	
	-------> Testing purpose only
	--select purchid, itemid, purchline.inventdimid, INVENTCOLORID, INVENTSIZEID, INVENTSTYLEID, barcode from purchline
	--	join inventdim on
	--	inventdim.inventdimid = PurchLine.inventdimid
	-- where purchid = '4600001263'
	 --update purchline set barcode = '123456' where purchid ='4600001263' and inventdimid = '000592886L'
	-------< Testing purpose only
	commit tran

	
GO

EXECUTE dbo.AxProd_UpdPurchBarcodes
