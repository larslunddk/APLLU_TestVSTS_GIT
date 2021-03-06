use widsql3_cit_udv
SET NOCOUNT ON
Exec dbo.LogProgressInfo ' Step 1002 - Nye varenumre p� InventSettlement startet','SQL1002',1
begin tran
UPDATE [InventSettlement] SET [InventSettlement].[ItemId]= [InventTrans].[ItemId]
 from [InventSettlement] inner join [InventTrans]
 on [InventSettlement].[DATAAREAID] = 'wid'
 AND [InventTrans].[RecId] = [InventSettlement].[TransRecId]
 AND [InventTrans].[DATAAREAID] = 'wid'
commit tran
Exec dbo.LogProgressInfo ' Step 1002 - Nye varenumre p� InventSettlement afsluttet','SQL1002',
Exec dbo.LogProgressInfo ' Step 1002 - Nye varenumre p� InventTransPosting startet','SQL1002'
UPDATE  INVENTTRANSPOSTING
SET     ITEMID = INVENTTRANS.ITEMID
FROM    INVENTTRANSPOSTING INNER JOIN INVENTTRANS 
	ON  INVENTTRANSPOSTING.INVENTTRANSID = INVENTTRANS.INVENTTRANSID 
	AND INVENTTRANSPOSTING.TRANSDATE = INVENTTRANS.DATEPHYSICAL 
	AND	INVENTTRANSPOSTING.VOUCHER = INVENTTRANS.VOUCHERPHYSICAL 
	AND INVENTTRANSPOSTING.DATAAREAID = INVENTTRANS.DATAAREAID
WHERE     (INVENTTRANSPOSTING.INVENTTRANSPOSTINGTYPE = 0)
UPDATE  INVENTTRANSPOSTING
SET     ITEMID = INVENTTRANS.ITEMID
FROM    INVENTTRANSPOSTING INNER JOIN INVENTTRANS 
	ON  INVENTTRANSPOSTING.INVENTTRANSID = INVENTTRANS.INVENTTRANSID 
	AND INVENTTRANSPOSTING.TRANSDATE = INVENTTRANS.DATEFINANCIAL
	AND	INVENTTRANSPOSTING.VOUCHER = INVENTTRANS.VOUCHER
	AND INVENTTRANSPOSTING.DATAAREAID = INVENTTRANS.DATAAREAID
WHERE     (INVENTTRANSPOSTING.INVENTTRANSPOSTINGTYPE = 1)

Exec dbo.LogProgressInfo ' Step 1002 - Nye varenumre p� InventTransPosting afsluttet','SQL1002',2