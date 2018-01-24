--begin tran
drop table DC_TmpVouchersToComplete
declare @Voucher as nvarchar(20)
--set @voucher = right(replicate(' ',20)+'230860',20)
set @voucher = '              252179'

select purchidrange, voucher, transdate, invoice,journalnum 
into DC_TmpVouchersToComplete
from LedgerJournalTrans LJT
where journalnum = right(replicate(' ',10)+'2251',10)  --and transdate >= '20090110'
--and voucher = @voucher
and purchidrange >''
and accounttype = 2
group by purchidrange, voucher, transdate, invoice, journalnum

delete from DC_TmpVouchersToComplete
where not exists (select 'x' from LedgerJournalTrans 
where journalnum = DC_TmpVouchersToComplete.journalnum and
voucher = DC_TmpVouchersToComplete.Voucher and 
transdate = DC_TmpVouchersToComplete.transdate and
purchidrange =DC_TmpVouchersToComplete.PurchIdRange)


select * from DC_TmpVouchersToComplete order by voucher

update LedgerJournalTrans set purchidrange = VTC.purchidrange
from LedgerJournalTrans AS  LJT
inner join  DC_TmpVouchersToComplete AS VTC 
ON LJT.voucher = VTC.voucher
and LJT.transdate = VTC.transdate
and LJT.invoice = VTC.invoice
--and LJT.voucher = @voucher

--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X
declare @Voucher as nvarchar(20)
set @voucher = right(replicate(' ',20)+'228090',20)

select journalnum, accounttype, purchidrange, accountnum,voucher, transdate, invoice,recid from LedgerJournalTrans
	where voucher = @Voucher --and transdate > '20090210'

select Accountnum, voucher, transdate, invoice, arrival, journalnum,recid from vendtrans 
where voucher = @voucher

select journalnum, accounttype, purchidrange, accountnum,voucher, transdate, invoice from LedgerJournalTrans
	where voucher = @voucher
	and   exists(select 'x' from vendtrans 
where accountnum =  LedgerJournalTrans.accountnum and
voucher = LedgerJournalTrans.voucher and 
transdate = LedgerJournalTrans.transdate and 
invoice = LedgerJournalTrans.invoice and
arrival = 1 
and ltrim(journalnum) = '2251'
) 
--commit tran
--rollback tran