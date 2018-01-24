SELECT     PURCHID, INVOICEACCOUNT, InventLocationId, DC_CONNECTIONID, DC_SGSHIPPED,
	(select top 1 DC_InventPackingCode from InventTable 
		where itemid = (select top 1 itemid from purchline where purchid = PurchTable.PurchId)) as PackingCode
FROM         PURCHTABLE
where purchid >= right(replicate(' ',20)+'70005000',20)
and not exists (select 'x' from DC_SGAccountConvTable 
				where InventLocationId = PurchTable.InventLocationId and 
				InventPackingCode = (select top 1 DC_InventPackingCode from InventTable 
					where itemid = (select top 1 itemid from purchline where purchid = PurchTable.PurchId)))
and exists (select 'x' from vendtable where accountnum = PurchTable.invoiceaccount and DC_IntegrationType = 1)
