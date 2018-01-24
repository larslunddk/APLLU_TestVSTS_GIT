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

If Object_ID('DC_TmpLogOnHand_211InventLocations') is null
BEGIN
            CREATE TABLE DC_TmpLogOnHand_211InventLocations
				(dateCreated		datetime,
				inventlocationid	nvarchar(20),
				itemid				nvarchar(20),
				ISQty				numeric(28,12),
				ITQty				numeric(28,12)
				)
END


insert into DC_TmpLogOnHand_211InventLocations 
	select getdate(), inventlocationid, itemid, postedqty+received-deducted-picked+registered as IS_Qty, IT_Qty from #t

select * from #t