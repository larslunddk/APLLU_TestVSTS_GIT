Set transaction isolation level read uncommitted
select 'Origin',inventtrans.itemid, INVENTCOLORID, INVENTSIZEID, INVENTSTYLEID, INVENTLOCATIONID, INVENTSITEID, INVENTTRANSORIGIN, RETURNINVENTTRANSORIGIN, INVENTTRANSORIGIN.REFERENCECATEGORY, INVENTTRANSORIGIN.REFERENCEID, INVENTTRANSID from inventtrans 
join INVENTDIM on
Inventdim.inventdimid = INVENTTRANS.INVENTDIMID
join INVENTTRANSORIGIN on 
INVENTTRANSORIGIN.recid = INVENTTRANS.INVENTTRANSORIGIN
--where INVENTTRANSORIGIN=5639346571
where inventtrans.itemid='100025589' and INVENTCOLORID='10 WEI�' and INVENTSIZEID='80' and INVENTSTYLEID='D'

--select 'Return',inventtrans.itemid, INVENTCOLORID, INVENTSIZEID, INVENTSTYLEID, INVENTLOCATIONID, INVENTSITEID, INVENTTRANSORIGIN, RETURNINVENTTRANSORIGIN, INVENTTRANSORIGIN.REFERENCECATEGORY, INVENTTRANSORIGIN.REFERENCEID, INVENTTRANSID from inventtrans 
--join INVENTDIM on
--Inventdim.inventdimid = INVENTTRANS.INVENTDIMID
--join INVENTTRANSORIGIN on 
--INVENTTRANSORIGIN.recid = INVENTTRANS.INVENTTRANSORIGIN
--where INVENTTRANSORIGIN=5637789434

select 'All with return',IT1.itemid, INVENTCOLORID, INVENTSIZEID, INVENTSTYLEID, INVENTLOCATIONID, INVENTSITEID, 
IT1.INVENTTRANSORIGIN, IT1.RETURNINVENTTRANSORIGIN, 
IT2.INVENTTRANSORIGIN IT2_InventTransOrigin, IT2.RETURNINVENTTRANSORIGIN IT2_ReturnInventTransOrigin, 
ITO1.INVENTTRANSID ITO1_InventTransId, ITO2.inventtransid ITO2_InventTransId, 
ITO1.REFERENCECATEGORY, ITO1.REFERENCEID, ITO1.INVENTTRANSID from INVENTTRANS IT1 
join INVENTTRANS IT2 on
IT1.INVENTTRANSORIGIN = IT2.RETURNINVENTTRANSORIGIN 
--IT1.RETURNINVENTTRANSORIGIN <> IT2.INVENTTRANSORIGIN

join INVENTDIM on
Inventdim.inventdimid = IT1.INVENTDIMID
join INVENTTRANSORIGIN ITO1 on 
ITO1.recid = IT1.INVENTTRANSORIGIN
join INVENTTRANSORIGIN ITO2 on 
ITO2.recid = IT2.INVENTTRANSORIGIN

where (IT1.RETURNINVENTTRANSORIGIN<>0 OR IT2.RETURNINVENTTRANSORIGIN<>0) and 
(IT1.INVENTTRANSORIGIN=5637789434 or IT1.INVENTTRANSORIGIN = 5639346571)

select * from inventtrans where ReturnINVENTTRANSORIGIN = 5639346571



--update inventTrans set RETURNINVENTTRANSORIGIN = 5639346571 where INVENTTRANSORIGIN=5637789434

set transaction isolation level read uncommitted
--select itemid, * from INVENTTRANS IT1 
--join INVENTTRANS IT2 on
--IT1.INVENTTRANSORIGIN = IT2.RETURNINVENTTRANSORIGIN and
--IT1.RETURNINVENTTRANSORIGIN <> IT2.INVENTTRANSORIGIN

Set transaction isolation level read uncommitted
select inventtrans.RECID, inventtrans.itemid, INVENTCOLORID, INVENTSIZEID, INVENTSTYLEID, INVENTLOCATIONID, INVENTSITEID, INVENTTRANSORIGIN, RETURNINVENTTRANSORIGIN, INVENTTRANSORIGIN.REFERENCECATEGORY, INVENTTRANSORIGIN.REFERENCEID, INVENTTRANSID from inventtrans 
join INVENTDIM on
Inventdim.inventdimid = INVENTTRANS.INVENTDIMID
join INVENTTRANSORIGIN on 
INVENTTRANSORIGIN.recid = INVENTTRANS.INVENTTRANSORIGIN
--where INVENTTRANSORIGIN=5639346571
where inventtrans.itemid='100025589' and INVENTCOLORID='10 WEI�' and INVENTSIZEID='80' and INVENTSTYLEID='D'

select itemid, inventtransorigin, returninventtransorigin,
(select INVENTTRANSORIGIN from inventtrans it3 where it3.RETURNINVENTTRANSORIGIN = it1.INVENTTRANSORIGIN) as 'SET_Return'
from inventtrans it1 where 
not exists (select 'x' from inventtrans it2 where it2.INVENTTRANSORIGIN = it1.RETURNINVENTTRANSORIGIN) and 
exists (select 'x' from inventtrans it3 where it3.RETURNINVENTTRANSORIGIN = it1.INVENTTRANSORIGIN) and IT1.RETURNINVENTTRANSORIGIN<>0
 --and recid = 5638198559

--select itemid, inventtransorigin, returninventtransorigin,
update inventtrans set RETURNINVENTTRANSORIGIN = (select INVENTTRANSORIGIN from inventtrans it3 where it3.RETURNINVENTTRANSORIGIN = it1.INVENTTRANSORIGIN) 
from inventtrans it1 where 
not exists (select 'x' from inventtrans it2 where it2.INVENTTRANSORIGIN = it1.RETURNINVENTTRANSORIGIN) and 
exists (select 'x' from inventtrans it3 where it3.RETURNINVENTTRANSORIGIN = it1.INVENTTRANSORIGIN) and IT1.RETURNINVENTTRANSORIGIN<>0 
-- and recid = 5637773972



