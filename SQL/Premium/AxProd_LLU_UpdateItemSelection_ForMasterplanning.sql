update InventTable 	set ProdPoolId = '' where ProdPoolId <> ''

update InventTable 	set ProdPoolId = 'x'
	from InventTable 
	join VendTable on
	VendTable.AccountNum = InventTable.PRIMARYVENDORID and 
	(VendTable.PURCHCALENDARID = 'Mi' OR
	VendTable.PURCHCALENDARID = 'MiFr' OR
	VendTable.PURCHCALENDARID = 'MoDiMiDoFr' OR
	VendTable.PURCHCALENDARID = 'MoMi' OR
	VendTable.PURCHCALENDARID = 'MoMiFr')


update InventTable 	set ProdPoolId = 'x'
	from InventTable 
	join VendTable on
	VendTable.AccountNum = InventTable.PRIMARYVENDORID and 
	(VendTable.PURCHCALENDARID = 'Di' OR
	VendTable.PURCHCALENDARID = 'DiDo' OR
	VendTable.PURCHCALENDARID = 'DiFr' OR
	VendTable.PURCHCALENDARID = 'MoDiMiDoFr')

select top 100 * from RETAILCONNPREACTIONTABLE order by refkey
select count(*), RefTableId from RETAILCONNPREACTIONTABLE join name from SQLDictionary group by REFTABLEID 
select name from SQLDICTIONARY where TABLEID = 101092
