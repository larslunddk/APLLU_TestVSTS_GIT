
update purchtable set DC_InventPackingCode = 
isnull((select top 1 DC_InventPackingCode from inventtable 
	where exists(select 1 from purchline where itemid = inventtable.itemid and purchid = purchtable.purchid)),'')
where DC_InventPackingCode = '' --and purchid > right(replicate(' ',20)+'70011000',20) --and len(ltrim(purchid)) =8
	
