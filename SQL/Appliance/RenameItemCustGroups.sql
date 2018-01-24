begin tran
update InventTable 
	set ItemGroupId = (select ToTxt from LP_ConvertTable 
						where ConvertType = 'ItemGrp' and FromTxt = InventTable.ItemId and Dataareaid = 'app')
		
	where exists (select ToTxt from LP_ConvertTable 
						where ConvertType = 'ItemGrp' and FromTxt = InventTable.ItemId and Dataareaid = 'app')
	and   Dataareaid = 'app'



select ItemId,ItemGroupId from InventTable
	where exists (select ToTxt from LP_ConvertTable 
						where ConvertType = 'ItemGrp' and FromTxt = InventTable.ItemId and Dataareaid = 'app')
	and   Dataareaid = 'app'
rollback tran