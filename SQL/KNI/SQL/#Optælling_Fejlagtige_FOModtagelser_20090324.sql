select count(*) from purchline where InventReceivedNow <> PurchReceivedNow and RemainPurchPhysical<>0
--select purchid, itemid, InventReceivedNow, PurchReceivedNow from purchline where InventReceivedNow <> PurchReceivedNow and RemainPurchPhysical<>0
select purchline.purchid, purchtable.inventlocationid 
	from purchline inner join 
	PurchTable on purchtable.purchid = Purchline.purchid
	where InventReceivedNow <> PurchReceivedNow and RemainPurchPhysical<>0
	group by purchline.purchid,purchtable.inventlocationid
order by purchtable.inventlocationid,purchline.purchid


--select top 100 * from INFORMATION_SCHEMA.COLUMNS where table_name = 'purchline' --and column_name like '%location%'
--order by column_name
--
--select * from sys.all_sql_modules
--select top 100 * from sys.columns where object_id = '2140235075'
--select top 100 * from sys.tables where name like '%custtable%'
--select * from sys.events
--select * from sys.sysperfinfo
--select * from sys.dm_tran_locks