begin tran
update dbo.inventtable set DC_CalculationProfitGroupId = itemgroupid
	where dataareaid = 'kni'

commit tran