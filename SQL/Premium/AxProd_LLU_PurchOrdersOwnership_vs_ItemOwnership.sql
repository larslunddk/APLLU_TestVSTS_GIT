--select distinct(ITEMGROUPID) from INVENTTABLE
--	JOIN INVENTITEMGROUPITEM ON
--	INVENTITEMGROUPITEM.ITEMDATAAREAID = INVENTTABLE.DATAAREAID
--	and INVENTITEMGROUPITEM.itemid = INVENTTABLE.itemid	

select PURCHTABLE.PURCHID, AP_ITEMOWNERSHIPMODEL, PURCHLINE.ITEMID, INVENTITEMGROUPITEM.ITEMGROUPID from PurchTable
	join PURCHLINE on
	PurchLine.PURCHID = PURCHTABLE.PURCHID
	JOIN INVENTITEMGROUPITEM ON
	INVENTITEMGROUPITEM.ITEMDATAAREAID = PURCHLINE.DATAAREAID
	and INVENTITEMGROUPITEM.itemid = PURCHLINE.itemid
	where ((INVENTITEMGROUPITEM.ITEMGROUPID='Eigenkauf' and PURCHTABLE.AP_ITEMOWNERSHIPMODEL<>0) or
		(INVENTITEMGROUPITEM.ITEMGROUPID='Konsign' and PURCHTABLE.AP_ITEMOWNERSHIPMODEL<>3))
