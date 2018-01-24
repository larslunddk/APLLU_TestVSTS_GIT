select count(*) from purchtable where dc_connectionid = '850'
	and exists (select * from vendtable where accountnum = Purchtable.invoiceaccount and dc_integrationtype = 1)
select count(*) from purchline 
where exists (select * from purchtable where purchid = purchline.purchid and dc_connectionid = '850'
			and exists (select * from vendtable where accountnum = Purchtable.invoiceaccount and dc_integrationtype = 1))