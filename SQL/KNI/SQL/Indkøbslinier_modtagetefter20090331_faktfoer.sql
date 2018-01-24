declare @statusdate as datetime
set @statusdate = '20090331'

select i.inventtransid, purchline.purchid from inventtrans i 
inner join inventdim on inventdim.inventdimid = i.inventdimid
inner join purchline on purchline.inventtransid = i.inventtransid
inner join LedgerJournalTrans LJT on LJT.purchidrange = purchline.purchid
where i.statusissue = 0 and
i.statusreceipt <= 2 and
i.datephysical > @statusdate and
inventdim.inventlocationid = '100261' and
LJT.journalnum = right(replicate(' ',10)+'2251',10) and
LJT.accounttype = 2 /*Vend*/ and
LJT.transdate <= @statusdate
					

select purchid,itemid from purchline
	where purchid in (select purchid from purchtable 
						where inventlocationid = '100261' and 
						purchstatus <= 1)/* and 
						dc_approvejournalstatus = 10 /*Invoice received*/ )
						*/
	and exists (select 1 from inventtrans i 
					where i.inventtransid = purchline.inventtransid and
					i.statusissue = 0 and
					i.statusreceipt <= 2 and
					i.datephysical < @statusdate)
	and exists (select 1 from LedgerJournalTrans LJT 
					where LJT.journalnum = right(replicate(' ',10)+'2251',10) and
					LJT.accounttype = 2 /*Vend*/ and
					LJT.purchidrange = purchline.purchid and
					LJT.transdate <= @statusdate and
					exists (select 1 from vendtrans vt
								where vt.accountnum = ljt.accountnum and
								vt.voucher = ljt.voucher and
								vt.transdate = ljt.transdate and
								vt.invoice = ljt.invoice and
								vt.journalnum = ljt.journalnum and
								vt.arrival = 1))

