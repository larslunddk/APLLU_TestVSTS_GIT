update RCMSupFOOrders
	set PurchaseOrderId = (	SELECT	top 1 VENDPURCHORDERJOUR.PURCHASEORDERID
							FROM		RCMSUPFOORDERREFERENCE INNER JOIN
										VENDPURCHORDERJOUR ON RCMSUPFOORDERREFERENCE.DATAAREAID = VENDPURCHORDERJOUR.DATAAREAID AND 
										RCMSUPFOORDERREFERENCE.REFPURCHID = VENDPURCHORDERJOUR.PURCHID
							WHERE		(RCMSUPFOORDERREFERENCE.REFTYPE = 2) 
									AND (RCMSUPFOORDERREFERENCE.ORDERID = RCMSupFOOrders.Orderid)
							ORDER BY PURCHASEORDERID DESC
							)

where	RCMSupFOOrders.PurchaseOrderId = ''
and		RCMSupFOOrders.VendAccount <> ''
--and     RCMSupFOOrders.StoreId = right(replicate(' ',20)+'106272',20)
--and     RCMSupFOOrders.StoreId = right(replicate(' ',20)+'185272',20)
--and     RCMSupFOOrders.orderid = right(replicate(' ',20)+'182605',20)
and exists (select * from RCMSupFOOrderReference where RefType = 2 and OrderId = RCMSupFOOrders.OrderId)
and exists (SELECT     *
			FROM         RCMSUPFOORDERREFERENCE INNER JOIN
                      VENDPURCHORDERJOUR ON RCMSUPFOORDERREFERENCE.DATAAREAID = VENDPURCHORDERJOUR.DATAAREAID AND 
                      RCMSUPFOORDERREFERENCE.REFPURCHID = VENDPURCHORDERJOUR.PURCHID
			WHERE     (RCMSUPFOORDERREFERENCE.REFTYPE = 2) AND (RCMSUPFOORDERREFERENCE.ORDERID = RCMSupFOOrders.Orderid)
			)

--select top 10 orderid, storeid, vendaccount, PurchaseOrderId from RCMSupFOOrders
--where	RCMSupFOOrders.PurchaseOrderId = ''
--and		RCMSupFOOrders.VendAccount <> ''
----and     RCMSupFOOrders.StoreId = right(replicate(' ',20)+'106272',20)
--and     RCMSupFOOrders.orderid = right(replicate(' ',20)+'182605',20)
