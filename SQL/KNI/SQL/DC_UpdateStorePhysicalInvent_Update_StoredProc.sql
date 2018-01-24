drop procedure DC_UpdateFOInventOnHand_Step1
drop procedure DC_UpdateFOInventOnHand_Step2
go
create procedure DC_UpdateFOInventOnHand_Step1 as
----------------------------------------------------------------------------------
-- UPDATE fysisk lager af alle varer/butikker der ikke har en SupStoreBarcodeTable
----------------------------------------------------------------------------------
begin
declare @TmpRecId as bigint
set @TmpRecId = 999

IF OBJECT_ID('TMP_UpdStoreBarcodeItem', 'U') IS NOT NULL
	DROP TABLE TMP_UpdStoreBarcodeItem
SELECT INVENTTABLE.ITEMID, INVENTDIM.INVENTLOCATIONID, INVENTTABLE.DC_PRIMARYBARCODE, INVENTTABLE.ITEMNAME,INVENTTABLE.ITEMGROUPID
		,dbo.dc_barcodetype(INVENTTABLE.ITEMID, INVENTTABLE.DC_PRIMARYBARCODE,INVENTTABLE.DATAAREAID) as BARCODETYPE
		,dbo.DC_ModuleInventPcsPrice(INVENTTABLE.ITEMID, INVENTTABLE.DATAAREAID) as PCSPRICE
		,dbo.DC_StoreIdFromInventLocation(INVENTDIM.INVENTLOCATIONID,INVENTTABLE.DATAAREAID) AS STOREID
		,dbo.DC_PhysicalInventQty(INVENTDIM.INVENTLOCATIONID, INVENTTABLE.ITEMID, INVENTTABLE.DATAAREAID) as PhysicalInvent
		,(select UNITID from InventTableModule where InventTableModule.itemid = InventTable.itemid and InventTableModule.moduletype = 2 and InventTableModule.dataareaid = INVENTTABLE.DATAAREAID) AS UNIT
		,replicate(' ',20) AS STOREBARCODE
		,replicate(' ',20) AS ASSORTMENTID
		,replicate(' ',80) AS LOOKUPCODE
		,replicate(' ',20) AS STOREORDERITEMMAINGROUP
		,replicate(' ',20) AS STOREORDERITEMSUBGROUP
		,(select ISTRADEGOODS from dbo.RCMINVENTITEMGROUPVIRTUAL where ITEMGROUPID = INVENTTABLE.ITEMGROUPID) AS ISTRADEGOODS
		,INVENTTABLE.DATAAREAID AS DATAAREAID
		,@TmpRecId as recid
INTO TMP_UpdStoreBarcodeItem
FROM         INVENTSUM INNER JOIN
                      INVENTDIM ON INVENTSUM.INVENTDIMID = INVENTDIM.INVENTDIMID AND INVENTSUM.DATAAREAID = INVENTDIM.DATAAREAID INNER JOIN
                      INVENTTABLE ON INVENTSUM.ITEMID = INVENTTABLE.ITEMID AND INVENTSUM.DATAAREAID = INVENTTABLE.DATAAREAID
WHERE     
INVENTTABLE.DC_PRIMARYBARCODE <> '' AND
NOT EXISTS (select * from rcmSupStoreBarcodeTable where (rcmSupStoreBarcodeTable.dataareaid = INVENTTABLE.dataareaid and 
														 rcmSupStoreBarcodeTable.Storeid = RIGHT(Replicate(' ',20)+INVENTDIM.INVENTLOCATIONID,20)) and 
														(rcmSupStoreBarcodeTable.ItemId  = inventTable.ItemId))
GROUP BY INVENTTABLE.ITEMID, INVENTDIM.INVENTLOCATIONID, INVENTTABLE.DC_PRIMARYBARCODE, INVENTTABLE.ITEMNAME,INVENTTABLE.ItemGroupId, InventTable.dataareaid

delete from TMP_UpdStoreBarcodeItem where ISNULL(storeid,1) = 1
---- DELETE DUBLICATES --------------------
delete from TMP_UpdStoreBarcodeItem where exists (select * from rcmSupStoreBarcodeTable 
															where rcmSupStoreBarcodeTable.dataareaid = TMP_UpdStoreBarcodeItem.dataareaid 
															and rcmSupStoreBarcodeTable.Storeid = TMP_UpdStoreBarcodeItem.STOREID 
															and rcmSupStoreBarcodeTable.STOREBARCODE = TMP_UpdStoreBarcodeItem.DC_PRIMARYBARCODE)

---- UPDATE ASSORTMENTID --------------------
UPDATE    TMP_UpdStoreBarcodeItem
SET              ASSORTMENTID = RCMASSORTMENTITEMS.ASSORTMENTID
FROM         RCMASSORTMENTTABLE INNER JOIN
                      RCMASSORTMENTITEMS ON RCMASSORTMENTTABLE.ASSORTMENTID = RCMASSORTMENTITEMS.ASSORTMENTID AND 
                      RCMASSORTMENTTABLE.DATAAREAID = RCMASSORTMENTITEMS.DATAAREAID INNER JOIN
                      TMP_UpdStoreBarcodeItem ON RCMASSORTMENTTABLE.DATAAREAID = TMP_UpdStoreBarcodeItem.DATAAREAID AND 
                      RCMASSORTMENTITEMS.ITEMID = TMP_UpdStoreBarcodeItem.ITEMID INNER JOIN
                      RCMSTOREASSORTMENTS ON RCMASSORTMENTTABLE.ASSORTMENTID = RCMSTOREASSORTMENTS.ASSORTMENTID AND 
                      TMP_UpdStoreBarcodeItem.STOREID = RCMSTOREASSORTMENTS.STOREID
WHERE     (RCMASSORTMENTTABLE.ACTIVEDATE < GETDATE()) AND (RCMASSORTMENTTABLE.INACTIVEDATE > GETDATE() - 1 OR RCMASSORTMENTTABLE.INACTIVEDATE = '19000101') 
			AND   dbo.TMP_UpdStoreBarcodeItem.ASSORTMENTID = ''
--UPDATE    TMP_UpdStoreBarcodeItem
--SET              ASSORTMENTID = RCMSTOREASSORTMENTS.ASSORTMENTID
--FROM         TMP_UpdStoreBarcodeItem INNER JOIN
--                      RCMSTOREASSORTMENTS ON TMP_UpdStoreBarcodeItem.STOREID = RCMSTOREASSORTMENTS.STOREID AND 
--                      TMP_UpdStoreBarcodeItem.DATAAREAID = RCMSTOREASSORTMENTS.DATAAREAID INNER JOIN
--                      RCMASSORTMENTTABLE ON TMP_UpdStoreBarcodeItem.DATAAREAID = RCMASSORTMENTTABLE.DATAAREAID AND 
--                      RCMSTOREASSORTMENTS.ASSORTMENTID = RCMASSORTMENTTABLE.ASSORTMENTID
--WHERE     (RCMASSORTMENTTABLE.ACTIVEDATE < GETDATE()) AND (RCMASSORTMENTTABLE.INACTIVEDATE > GETDATE() - 1 OR RCMASSORTMENTTABLE.INACTIVEDATE = '19000101') 
--			AND   dbo.TMP_UpdStoreBarcodeItem.ASSORTMENTID = ''

---- UPDATE LOOKUPCODE --------------------
UPDATE    TMP_UpdStoreBarcodeItem
SET              LOOKUPCODE = RCMINVENTITEMBARCODE.ITEMBARCODE
FROM         TMP_UpdStoreBarcodeItem INNER JOIN
                      INVENTITEMBARCODE ON TMP_UpdStoreBarcodeItem.ITEMID = INVENTITEMBARCODE.ITEMID AND 
                      TMP_UpdStoreBarcodeItem.DATAAREAID = INVENTITEMBARCODE.DATAAREAID INNER JOIN
                      RCMINVENTITEMBARCODE ON INVENTITEMBARCODE.DATAAREAID = RCMINVENTITEMBARCODE.DATAAREAID AND 
                      INVENTITEMBARCODE.ITEMBARCODE = RCMINVENTITEMBARCODE.ITEMBARCODE

---- UPDATE ISTRADEGOODS --------------------
UPDATE    TMP_UpdStoreBarcodeItem
SET              ISTRADEGOODS = RCMINVENTITEMGROUPVIRTUAL.ISTRADEGOODS
FROM         TMP_UpdStoreBarcodeItem INNER JOIN
                      INVENTTABLE ON TMP_UpdStoreBarcodeItem.ITEMID = INVENTTABLE.ITEMID AND 
                      TMP_UpdStoreBarcodeItem.DATAAREAID = INVENTTABLE.DATAAREAID INNER JOIN
                      RCMINVENTITEMGROUPVIRTUAL ON TMP_UpdStoreBarcodeItem.DATAAREAID = RCMINVENTITEMGROUPVIRTUAL.DATAAREAID AND 
                      INVENTTABLE.ITEMGROUPID = RCMINVENTITEMGROUPVIRTUAL.ITEMGROUPID

---- UPDATE STOREORDERITEMMAINGROUP --------------------
UPDATE    TMP_UpdStoreBarcodeItem
SET              STOREORDERITEMMAINGROUP = RCMGROUPING.PARENTID
FROM         TMP_UpdStoreBarcodeItem INNER JOIN
                      RCMGROUPING ON TMP_UpdStoreBarcodeItem.DATAAREAID = RCMGROUPING.DATAAREAID INNER JOIN
                      RCMPARAMETERSVIRTUAL ON TMP_UpdStoreBarcodeItem.DATAAREAID = RCMPARAMETERSVIRTUAL.DATAAREAID AND 
                      RCMGROUPING.ROOTPARENT = RCMPARAMETERSVIRTUAL.GROUPSTOREORDERITEMMAIN INNER JOIN
                      INVENTTABLE ON TMP_UpdStoreBarcodeItem.ITEMID = INVENTTABLE.ITEMID AND RCMGROUPING.REFRECID = INVENTTABLE.RECID
WHERE     (RCMGROUPING.REFTABLEID = 175) AND TMP_UpdStoreBarcodeItem.STOREORDERITEMMAINGROUP = ''

EXEC dbo.DC_UpdateRecIdInTmp

delete from TMP_UpdStoreBarcodeItem where exists (select * from TMP_UpdStoreBarcodeItem T where T.DC_PRIMARYBARCODE = TMP_UpdStoreBarcodeItem.DC_PRIMARYBARCODE 
																							and T.storeid = TMP_UpdStoreBarcodeItem.storeid 
																							and T.recid <> TMP_UpdStoreBarcodeItem.recid)

end
go

create procedure DC_UpdateFOInventOnHand_Step2 as
begin
INSERT INTO dbo.RCMSUPSTOREBARCODETABLE 
	select * 
	From TMP_UpdStoreBarcodeItemView 
	where STOREBARCODE <>'' AND isnull(istradegoods,9) <> 9

drop view TMP_UpdStoreBarcodeItemView
DROP TABLE TMP_UpdStoreBarcodeItem


--------------------------------------------------------------------------------------
-- UPDATE fysisk lager af alle varer/butikker der allerede har en SupStoreBarcodeTable
--------------------------------------------------------------------------------------

update rcmSupStoreBarcodeTable
	set PhysicalOnHand = dbo.DC_PhysicalInventQty(LTRIM(dbo.DC_InventLocationFromStoreId(rcmSupStoreBarcodeTable.StoreId,rcmSupStoreBarcodeTable.dataareaid)), 
												  rcmSupStoreBarcodeTable.ItemId, 
												  rcmSupStoreBarcodeTable.dataareaid)	
from rcmSupStoreBarcodeTable

--commit tran

end