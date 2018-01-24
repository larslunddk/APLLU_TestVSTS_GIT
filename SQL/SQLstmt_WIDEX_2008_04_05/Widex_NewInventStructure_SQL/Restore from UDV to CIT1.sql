select count(*) from inventablemodule
	where dataareaid = 'wid'
select count(*) from inventtable
	where dataareaid = 'wid'

select count(*) from inventtable
	where dataareaid = 'wid'
	and   itemidmaster <>''
select count(*) from inventtablemodule 
	where (select count(*) from inventtable 
				where inventtable.itemid = inventtablemodule.itemid 
				and inventtable.dataareaid = Inventtablemodule.dataareaid 
				and inventtable.dataareaid = 'wid'
				and inventtable.itemidmaster <>'') <> 0
	and inventtablemodule.dataareaid = 'wid'
delete from inventtablemodule 
	where (select count(*) from inventtable 
				where inventtable.itemid = inventtablemodule.itemid 
				and inventtable.dataareaid = Inventtablemodule.dataareaid 
				and inventtable.dataareaid = 'wid'
				and inventtable.itemidmaster <>'') <> 0
	and inventtablemodule.dataareaid = 'wid'

