-- Find varer hvor kostpris < købspris
select ITMInvent.itemid,ITMInvent.price as kostpris, pdt.amount as Købspris
from inventtablemodule ITMInvent 
inner join pricedisctable pdt on
pdt.itemrelation = ITMInvent.Itemid
where ITMInvent.moduletype = 0
and pdt.itemcode = 0
and pdt.todate = '19000101'
and pdt.module = 2
and pdt.relation = 0
and ITMInvent.price <= pdt.amount

	
-- Find varer med en kalkulationsgruppe der ikke eksisterer
select itemid, DC_InventCalcGroupId from inventtable it
	where not exists (select 1 from DC_InventCalcGroupTable where DC_InventCalcGroupTable.InventCalcGroupId = it.DC_InventCalcGroupId)