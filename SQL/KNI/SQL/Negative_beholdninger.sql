select isum.itemid, id.inventlocationid, (isum.postedqty - isum.deducted + isum.received) as PhysQty 
--select count(*)
from inventsum isum
inner join inventdim id on 
id.inventdimid = isum.inventdimid and
(isum.postedqty - isum.deducted + isum.received)  < 0
order by id.inventlocationid, isum.itemid