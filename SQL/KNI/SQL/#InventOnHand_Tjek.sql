drop table #t
select inventdim.inventlocationid, 
	inventsum.itemid, 
	inventsum.postedqty, 
	inventsum.received, inventsum.deducted, inventsum.picked, inventsum.registered,
	(select sum(i.qty) from inventtrans i 
		where i.itemid = inventsum.itemid and i.inventdimid = inventsum.inventdimid
				and i.statusissue <= 3 and i.statusreceipt <= 3 ) as IT_Qty
into #t
from inventsum --where inventdimid = right(replicate(' ',20)+'136',20)
inner join inventdim on inventdim.inventdimid = inventsum.inventdimid
delete from #t where ((postedqty+received-deducted-picked+registered) = IT_Qty) or (postedqty+received-deducted-picked+registered) = 0
select * from #t