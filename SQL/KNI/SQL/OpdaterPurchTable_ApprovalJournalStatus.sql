declare @PooljournalNum nvarchar(20)
select @PoolJournalNum = journalnum from ledgerjournaltable 
	where	Posted = 0 /*No*/ 
	and		JournalType = 11 /*VendInvoicePool*/ 
	and     dataareaid = 'KNI'
	
update purchtable set DC_APPROVEJOURNALSTATUS = 10 /*InvoiceReceived*/
--select purchid, invoiceaccount, DC_APPROVEJOURNALSTATUS from purchtable
	where exists (select 1 from ledgerjournaltrans LJT where
							LJT.AccountType = 2 /*Vend*/ 
					and		LJT.purchidRange = ltrim(purchtable.purchid)
					and		LJT.journalnum = @Pooljournalnum
					and		LJT.dataareaid = PurchTable.dataareaid)
and purchtable.PurchStatus = 1 /*Åben ordre*/					
and   purchtable.DC_APPROVEJOURNALSTATUS = 0
and   purchtable.dataareaid = 'KNI'
	
--group by purchid, dc_approvejournalstatus, invoiceaccount