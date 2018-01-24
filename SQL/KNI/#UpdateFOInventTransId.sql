update RCMSupFOOrders set InventTransId = PurchLine.InventTransId
from purchline
inner join DC_PurchProposalLine IOFKons on IOFKons.RefPurchRecId = PurchLine.recid
inner join DC_PurchProposalLine IOF on IOF.RefConsolidatedPurchProposalId = IOFKons.PurchProposalId
inner join RCMSupFOOrders FO on FO.OrderId = IOF.RCMSupFOOrderId
where IOFKons.PurchProposalStatus = 20
and   IOF.PurchProposalStatus = 5
------------------------------------------------------------------------------------------------------------
select count(*) from 
DC_PurchProposalLine IOFKons
Inner join DC_PurchProposalLine IOF on IOF.RefProposalRecId = IOFKons.recid
where IOF.RefConsolidatedPurchProposalId <> IOFKons.PurchProposalId

UPDATE IOF set IOF.RefConsolidatedPurchProposalId = IOFKons.PurchProposalId
from DC_PurchProposalLine IOFKons
Inner join DC_PurchProposalLine IOF on IOF.RefProposalRecId = IOFKons.recid
where IOF.RefConsolidatedPurchProposalId <> IOFKons.PurchProposalId
------------------------------------------------------------------------------------------------------------
select count(*) from 
DC_PurchProposalLine IOF
inner join RCMSupFOOrders FO on FO.recid = IOF.RefRCMSupFOOrdersRecId
where FO.OrderId <> IOF.RCMSupFOOrderId

UPDATE IOF set IOF.RCMSupFOOrderId = FO.OrderId
from DC_PurchProposalLine IOF
inner join RCMSupFOOrders FO on FO.recid = IOF.RefRCMSupFOOrdersRecId
where FO.OrderId <> IOF.RCMSupFOOrderId
