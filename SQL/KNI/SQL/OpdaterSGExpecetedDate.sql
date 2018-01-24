
--update purchtable set DC_InventPackingCode = 
--isnull((select top 1 DC_InventPackingCode from inventtable 
--	where exists(select 1 from purchline where itemid = inventtable.itemid and purchid = purchtable.purchid)),'')
--where DC_InventPackingCode = '' --and purchid > right(replicate(' ',20)+'70011000',20) --and len(ltrim(purchid)) =8
	
update purchtable 
	set DC_ExpectedSGOrderDate = DC_PurchConnectionTable.LastOrderDate + DC_InventPackingCodeTable.DC_LastOrderDate_Offset + 1
	from purchtable
--select purchid /*count(*)*/	from purchtable 
	inner join DC_InventPackingCodeTable on DC_InventPackingCodeTable.InventPackingCode = PurchTable.DC_InventPackingCode
	inner join DC_PurchConnectionTable on DC_PurchConnectionTable.DC_ConnectionId = PurchTable.DC_ConnectionId
where exists (select 1 from vendtable where vendtable.accountnum = purchtable.orderaccount and vendtable.DC_IntegrationType = 1)
and purchtable.DC_ExpectedSGOrderDate = '19000101'
--and purchtable.purchid = right(replicate(' ',20)+'70011342',20)

update purchtable
	set DC_ExpectedSGOrderDate = '19000101'
--select orderaccount, count(*) from purchtable
where not exists (select 1 from vendtable where vendtable.accountnum = purchtable.orderaccount and vendtable.DC_IntegrationType = 1)
and DC_ExpectedSGOrderDate > '19000101'
group by orderaccount