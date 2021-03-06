---- Workaround for Issue 869 Updating crossdocking 
--update REQTRANS set REQTRANS.AP_CROSSDOCKINGINVENTLOCATIONID = REQITEMTABLE.AP_CROSSDOCKINGINVENTLOCATIONID 
--from REQTRANS 
--inner join REQITEMTABLE on REQITEMTABLE.ITEMID = REQTRANS.ITEMID and REQITEMTABLE.COVINVENTDIMID = REQTRANS.COVINVENTDIMID 
--where REQTRANS.REFTYPE = 33 and REQTRANS.AP_CROSSDOCKINGINVENTLOCATIONID <> REQITEMTABLE.AP_CROSSDOCKINGINVENTLOCATIONID 

--update REQPO set REQPO.AP_CROSSDOCKINGINVENTLOCATIONID = REQITEMTABLE.AP_CROSSDOCKINGINVENTLOCATIONID 
--from REQPO 
--inner join REQITEMTABLE on REQITEMTABLE.ITEMID = REQPO.ITEMID and REQITEMTABLE.COVINVENTDIMID = REQPO.COVINVENTDIMID 
--where REQPO.REFTYPE = 33 and REQPO.AP_CROSSDOCKINGINVENTLOCATIONID <> REQITEMTABLE.AP_CROSSDOCKINGINVENTLOCATIONID 
------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------
--select REQTRANS.ITEMID, REQDATE,qty, REQTRANS.AP_CROSSDOCKINGINVENTLOCATIONID reqTransCrossdock, REQITEMTABLE.AP_CROSSDOCKINGINVENTLOCATIONID reqItemTableCrossdock from REQTRANS 
--inner join REQITEMTABLE on REQITEMTABLE.ITEMID = REQTRANS.ITEMID and REQITEMTABLE.COVINVENTDIMID = REQTRANS.COVINVENTDIMID 
--where REQTRANS.REFTYPE = 33 and
--REQTRANS.AP_CROSSDOCKINGINVENTLOCATIONID <> REQITEMTABLE.AP_CROSSDOCKINGINVENTLOCATIONID 


--select reqPo.itemid, reqDate, Qty, ReqPO.VENDID, ItemGroupId, REQPO.AP_CROSSDOCKINGINVENTLOCATIONID ReqPOCrossDock, REQITEMTABLE.AP_CROSSDOCKINGINVENTLOCATIONID ReqItemTableCrossDock from reqpo 
--inner join REQITEMTABLE on REQITEMTABLE.ITEMID = REQPO.ITEMID and REQITEMTABLE.COVINVENTDIMID = REQPO.COVINVENTDIMID 
--where REQPO.REFTYPE = 33 and 
--REQPO.AP_CROSSDOCKINGINVENTLOCATIONID <> REQITEMTABLE.AP_CROSSDOCKINGINVENTLOCATIONID 

--select count(*)  from REQTRANS 
--inner join REQITEMTABLE on REQITEMTABLE.ITEMID = REQTRANS.ITEMID and REQITEMTABLE.COVINVENTDIMID = REQTRANS.COVINVENTDIMID 
--where REQTRANS.REFTYPE = 33 and
--REQTRANS.AP_CROSSDOCKINGINVENTLOCATIONID <> REQITEMTABLE.AP_CROSSDOCKINGINVENTLOCATIONID 


--select count(*) from reqpo 
--inner join REQITEMTABLE on REQITEMTABLE.ITEMID = REQPO.ITEMID and REQITEMTABLE.COVINVENTDIMID = REQPO.COVINVENTDIMID 
--where REQPO.REFTYPE = 33 and 
--REQPO.AP_CROSSDOCKINGINVENTLOCATIONID <> REQITEMTABLE.AP_CROSSDOCKINGINVENTLOCATIONID 


------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------

----Find InventTrans and InventTransOrigin referenced to Statements that does not exist anymore 
--select top 100 inventtrans.itemid,inventtransorigin.REFERENCEID,Inventtrans.RECID from inventtrans join INVENTTRANSORIGIN on INVENTTRANSORIGIN.recid = InventTrans.INVENTTRANSORIGIN
--where not exists (select * from  RETAILSTATEMENTTABLE where RETAILSTATEMENTTABLE.STATEMENTID = inventtransorigin.REFERENCEID) 
--and REFERENCECATEGORY = 150 --statement
--and inventtransorigin.REFERENCEID<>''


--Find InventTrans having 2 returns pointing to it
select IT1.itemid, qty, INVENTTRANSORIGIN.REFERENCEID,IT1.RETURNINVENTTRANSORIGIN,(select count(*) from inventTrans IT2 where IT2.RETURNINVENTTRANSORIGIN = IT1.INVENTTRANSORIGIN) as cntReturns, * 
from InventTrans IT1 
join INVENTTRANSORIGIN on INVENTTRANSORIGIN.recid = IT1.INVENTTRANSORIGIN and REFERENCECATEGORY = 150 and REFERENCEID <>''
join inventdim on
--INVENTCOLORID = '10 WEI�' and
INVENTSIZEID = '80' and
INVENTSTYLEID = 'D' and
inventdim.INVENTDIMID = IT1.INVENTDIMID
--where (select count(*) from inventTrans IT2 where IT2.RETURNINVENTTRANSORIGIN = IT1.INVENTTRANSORIGIN and IT2.RETURNINVENTTRANSORIGIN <>0)>0






select inventtrans.itemid, INVENTCOLORID, INVENTSIZEID, INVENTSTYLEID, INVENTLOCATIONID, INVENTSITEID, RETURNINVENTTRANSORIGIN, INVENTTRANSORIGIN.REFERENCECATEGORY, INVENTTRANSORIGIN.REFERENCEID, count(*) from inventtrans 
join INVENTDIM on
Inventdim.inventdimid = INVENTTRANS.INVENTDIMID
join INVENTTRANSORIGIN on 
INVENTTRANSORIGIN.recid = INVENTTRANS.INVENTTRANSORIGIN
where RETURNINVENTTRANSORIGIN<>0 
group by inventtrans.itemid, INVENTCOLORID, INVENTSIZEID, INVENTSTYLEID, INVENTLOCATIONID, INVENTSITEID, RETURNINVENTTRANSORIGIN, INVENTTRANSORIGIN.REFERENCECATEGORY, INVENTTRANSORIGIN.REFERENCEID
having count(INVENTTRANS.RECID)>1

select inventtrans.itemid, INVENTCOLORID, INVENTSIZEID, INVENTSTYLEID, INVENTLOCATIONID, INVENTSITEID, RETURNINVENTTRANSORIGIN, INVENTTRANSORIGIN.REFERENCECATEGORY, INVENTTRANSORIGIN.REFERENCEID from inventtrans 
join INVENTDIM on
Inventdim.inventdimid = INVENTTRANS.INVENTDIMID
join INVENTTRANSORIGIN on 
INVENTTRANSORIGIN.recid = INVENTTRANS.INVENTTRANSORIGIN
where RETURNINVENTTRANSORIGIN=5637752716


--select * from INVENTTRANS where RETURNINVENTTRANSORIGIN = 5637752716
--select * from INVENTTRANSORIGIN where INVENTTRANSID = '000635744LTR'
--select * from purchline where InventTransid = '000635744LTR' 
--select * from INVENTTRANSORIGIN where recid = 5637752716

--select * from INVENTTRANS where ItemId = '100025589'

select * from InventItemBarcode where ITEMBARCODE = '2600000016856'


