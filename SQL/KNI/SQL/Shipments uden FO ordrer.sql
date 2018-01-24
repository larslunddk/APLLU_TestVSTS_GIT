select shipmentid, count(*) cnt from wmsordertrans
	where inventTransType = 6
	and not exists (select 1 from rcmSupFOOrderReference FORef
						where FORef.RefId = wmsordertrans.orderId and FORef.reftype = 5)
group by shipmentid order by cnt desc	