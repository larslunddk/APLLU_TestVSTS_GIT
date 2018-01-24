select PurchId, OrigPurchId, count(*) as Antlinier, 
	(select inventlocationid from purchtable where purchid = VendPurchOrderTrans.purchid) as InvLoc_Purch,
	(select inventlocationid from purchtable where purchid = VendPurchOrderTrans.Origpurchid) as InvLoc_OrigPurch,
	(select dc_connectionid from purchtable where purchid = VendPurchOrderTrans.purchid) as Connection_Purch,
	(select dc_connectionid from purchtable where purchid = VendPurchOrderTrans.Origpurchid) as Connection_OrigPurch
 from VendPurchOrderTrans
	where PurchId <> OrigPurchId 
	--and exists(select top 1 1 from purchline where purchid = VendPurchOrderTrans.PurchId and purchstatus >= 2)
group by PurchId, OrigPurchId
order by purchid

