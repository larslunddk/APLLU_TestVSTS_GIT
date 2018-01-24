--select top 1000 purchid, purchname, dc_blocked from dbo.purchtable
----select count(*) from dbo.purchtable
--	where purchid >= right(replicate(' ',20)+'70000000',20)
--	and dc_blocked = 1
--	and not exists (select * from VENDPURCHORDERJOUR where purchid = PurchTable.purchid)
--
----update purchtable set dc_blocked = 1 where purchname like '(convert)%'
--select top 1000 purchid, purchname, dc_blocked from dbo.purchtable
--	where purchid >= right(replicate(' ',20)+'70000000',20) and dc_blocked = 1
--
--select top 1000 purchid, purchname, dc_blocked from dbo.purchtable
----select count(*) from dbo.purchtable
--	where purchid >= right(replicate(' ',20)+'70000000',20)
--	and dc_blocked = 1
--	and not exists (select * from VENDPURCHORDERJOUR where purchid = PurchTable.purchid)
--
--select count(*) from dbo.purchtable
--	where purchid >= right(replicate(' ',20)+'70000000',20)
--	and dc_blocked = 1
--
--select top 100 inventtable.itemid, pdt.itemrelation, pdt.accountrelation, inventtable.primaryVendorId ,
--	len(pdt.accountrelation) as len_PricediscT, len(inventtable.PrimaryVendorId) as len_InventT	

--
--select inventtable.itemgroupid, inventtable.itemid, pdt.itemrelation, pdt.accountrelation, LTRIM(RTRIM(inventtable.primaryVendorId ))
select count(*)
from inventtable, pricedisctable PDT
	where inventtable.itemid = PDT.ItemRelation
	and   PDT.itemcode = 0
	and   PDT.accountcode = 0
	and   RTRIM(LTRIM(PDT.AccountRelation)) <> RTRIM(LTRIM(InventTable.PRIMARYVENDORID))
	and   PDT.Relation = 0
order by inventtable.itemid
begin tran
update inventtable set primaryVendorId = (SELECT top 1    PRICEDISCTABLE.ACCOUNTRELATION
										FROM       PRICEDISCTABLE  
										where   PRICEDISCTABLE.DATAAREAID = INVENTTABLE.DATAAREAID 
										AND		PRICEDISCTABLE.ITEMRELATION = INVENTTABLE.ITEMID
										AND     (PRICEDISCTABLE.ITEMCODE = 0) AND (PRICEDISCTABLE.ACCOUNTCODE = 0) AND (PRICEDISCTABLE.RELATION = 0)
										AND PRICEDISCTABLE.FromDate <= getdate() 
										AND (PRICEDISCTABLE.ToDate >= getdate() OR PRICEDISCTABLE.ToDate = '19000101'))
where not exists (SELECT top 1    PRICEDISCTABLE.ACCOUNTRELATION
										FROM       PRICEDISCTABLE  
										where   PRICEDISCTABLE.DATAAREAID = INVENTTABLE.DATAAREAID 
										AND		PRICEDISCTABLE.ITEMRELATION = INVENTTABLE.ITEMID
										AND     PRICEDISCTABLE.ACCOUNTRELATION = INVENTTABLE.primaryVendorId
										AND     (PRICEDISCTABLE.ITEMCODE = 0) AND (PRICEDISCTABLE.ACCOUNTCODE = 0) AND (PRICEDISCTABLE.RELATION = 0)
										AND PRICEDISCTABLE.FromDate <= getdate() 
										AND (PRICEDISCTABLE.ToDate >= getdate() OR PRICEDISCTABLE.ToDate = '19000101'))
and cast(inventtable.itemgroupId as int) >= 1000 and cast(inventtable.itemgroupId as int) <= 1799
and exists (SELECT *
										FROM       PRICEDISCTABLE  
										where   PRICEDISCTABLE.DATAAREAID = INVENTTABLE.DATAAREAID 
										AND		PRICEDISCTABLE.ITEMRELATION = INVENTTABLE.ITEMID
										AND     (PRICEDISCTABLE.ITEMCODE = 0) AND (PRICEDISCTABLE.ACCOUNTCODE = 0) AND (PRICEDISCTABLE.RELATION = 0)
										and PRICEDISCTABLE.ACCOUNTRELATION <> '' 
										AND PRICEDISCTABLE.FromDate <= getdate() 
										AND (PRICEDISCTABLE.ToDate >= getdate() OR PRICEDISCTABLE.ToDate = '19000101'))

--select inventtable.itemgroupid, inventtable.itemid, pdt.itemrelation, pdt.accountrelation, LTRIM(RTRIM(inventtable.primaryVendorId ))
select count(*)
from inventtable, pricedisctable PDT
	where inventtable.itemid = PDT.ItemRelation
	and   PDT.itemcode = 0
	and   PDT.accountcode = 0
	and   RTRIM(LTRIM(PDT.AccountRelation)) <> RTRIM(LTRIM(InventTable.PRIMARYVENDORID))
	and   PDT.Relation = 0
--order by inventtable.itemid


rollback tran
