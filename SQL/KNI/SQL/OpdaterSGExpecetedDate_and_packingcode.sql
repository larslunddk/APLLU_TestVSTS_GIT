
-- ################### Opdatering af DC_ExpectedSGOrderDate udfra connection og pakkekode
update purchtable 
	set DC_ExpectedSGOrderDate = DC_PurchConnectionTable.LastOrderDate + DC_InventPackingCodeTable.DC_LastOrderDate_Offset + 1
	from purchtable
--select purchid /*count(*)*/	from purchtable 
	inner join DC_InventPackingCodeTable on DC_InventPackingCodeTable.InventPackingCode = PurchTable.DC_InventPackingCode
	inner join DC_PurchConnectionTable on DC_PurchConnectionTable.DC_ConnectionId = PurchTable.DC_ConnectionId
where exists (select 1 from vendtable where vendtable.accountnum = purchtable.orderaccount and vendtable.DC_IntegrationType = 1)
and purchtable.DC_ExpectedSGOrderDate = '19000101'
--and purchtable.purchid = right(replicate(' ',20)+'70011342',20)

-- ################### Nulstilling af DC_ExpectedSGOrderDate hvis kreditor ikke har Supergros integration
update purchtable
	set DC_ExpectedSGOrderDate = '19000101'
--select orderaccount, count(*) from purchtable
where not exists (select 1 from vendtable where vendtable.accountnum = purchtable.orderaccount and vendtable.DC_IntegrationType = 1)
and DC_ExpectedSGOrderDate > '19000101'
--group by orderaccount

-- ################### sæt DC_InventPackingCode hvis varen har fået påført pakkekode i mellemtiden
update purchtable set DC_InventPackingCode = isnull((select top 1 DC_InventPackingCode 
from inventtable 
	where exists(select 1 from purchline where itemid = inventtable.itemid and purchid = purchtable.purchid)),'')
where DC_InventPackingCode = '' --and purchid > right(replicate(' ',20)+'70011000',20) --and len(ltrim(purchid)) =8
and isnull((select top 1 DC_InventPackingCode from inventtable 
	where exists(select 1 from purchline where itemid = inventtable.itemid and purchid = purchtable.purchid)),'')<>''

-- ################### Opdatering af UNcode
update PurchTable set PurchTable.DC_UNCode = 
	isnull((select top 1 DC_UNCode from inventtable it 
		inner join Purchline pl on 
			it.itemid = pl.itemid and
			it.dataareaid = pl.dataareaid
		where pl.purchid = PurchTable.purchid
		and pl.dataareaid = purchTable.dataareaid),'n/a')
where PurchTable.dataareaid = 'KNI' and (PurchTable.DC_UNCode = '' or PurchTable.DC_UNCode = 'n/a' )
------------------------------------------------------------------------------------------------------------
-- ################### Opdatering af Inventtransid på FO ordre udfra indkøbet
update FO set FO.InventTransId = PurchLine.InventTransId
from purchline
inner join DC_PurchProposalLine IOFKons on IOFKons.RefPurchRecId = PurchLine.recid
inner join DC_PurchProposalLine IOF on IOF.RefConsolidatedPurchProposalId = IOFKons.PurchProposalId
inner join RCMSupFOOrders FO on FO.OrderId = IOF.RCMSupFOOrderId
where IOFKons.PurchProposalStatus = 20
and   IOF.PurchProposalStatus = 5
and FO.InventTransId <> PurchLine.InventTransId
------------------------------------------------------------------------------------------------------------
-- ################### indkøbsforslagsnummer på IOF udfra IOFKons (har p.t. dobbelt binding i form af RefProposalRecId)
--select count(*) from 
--DC_PurchProposalLine IOFKons
--Inner join DC_PurchProposalLine IOF on IOF.RefProposalRecId = IOFKons.recid
--where IOF.RefConsolidatedPurchProposalId <> IOFKons.PurchProposalId

UPDATE IOF set IOF.RefConsolidatedPurchProposalId = IOFKons.PurchProposalId
from DC_PurchProposalLine IOFKons
Inner join DC_PurchProposalLine IOF on IOF.RefProposalRecId = IOFKons.recid
where IOF.RefConsolidatedPurchProposalId <> IOFKons.PurchProposalId
------------------------------------------------------------------------------------------------------------
-- ################### FO opdatering af FO ordrenummer på IOF (har p.t. dobbelt binding i form af RefRCMSupFOOrdersRecId)
--select count(*) from 
--DC_PurchProposalLine IOF
--inner join RCMSupFOOrders FO on FO.recid = IOF.RefRCMSupFOOrdersRecId
--where FO.OrderId <> IOF.RCMSupFOOrderId

UPDATE IOF set IOF.RCMSupFOOrderId = FO.OrderId
from DC_PurchProposalLine IOF
inner join RCMSupFOOrders FO on FO.recid = IOF.RefRCMSupFOOrdersRecId
where FO.OrderId <> IOF.RCMSupFOOrderId