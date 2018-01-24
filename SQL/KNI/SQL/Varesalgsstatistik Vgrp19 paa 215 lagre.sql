--SQL script til KNI varesalgsstatistik (lagersted, vare, måned) afgrænset på Varehovedgrp. 19 på 215-lagre
select ID.InventLocationId, IT.ItemId, DatePart(mm,it.datefinancial) as Month, sum(qty)
from inventtrans IT
inner join inventdim ID on
ID.inventdimid = IT.InventDimId
where (ID.InventLocationId = '040261' or ID.InventLocationId = '090211' or ID.InventLocationId like '___215')
and IT.itemid like '19%'
and it.datefinancial < '20090109'
and it.datefinancial > '20000101'
and it.transtype = 0 -- Salgsordre
group by ID.InventLocationid, IT.ItemId, DatePart(mm,it.datefinancial)