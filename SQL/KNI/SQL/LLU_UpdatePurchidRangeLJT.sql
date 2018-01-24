declare @sqlstring nvarchar(1000)

IF (exists (select 'x' from INFORMATION_SCHEMA.ROUTINES where ROUTINE_TYPE='PROCEDURE' and ROUTINE_NAME='DC_TmpUpdateLJT_PurchIdRange'))
	BEGIN
		select @SQLString = 'DROP PROCEDURE dbo.DC_TmpUpdateLJT_PurchIdRange'
		EXECUTE(@SQLString)
	END

GO
create procedure DC_TmpUpdateLJT_PurchIdRange as
begin
begin tran
drop table DC_TmpVouchersToComplete
declare @Voucher as nvarchar(20)
set @voucher = right(replicate(' ',20)+'',20)
--set @voucher = '              2'

select purchidrange, voucher, transdate, invoice 
into DC_TmpVouchersToComplete
from LedgerJournalTrans LJT
where journalnum = right(replicate(' ',10)+'2251',10)  --and transdate >= '20090110'
--and voucher = @voucher
and purchidrange <>''
and accounttype = 2
and exists (select 'x' from LedgerJournalTrans 
where purchidrange <>LJT.PurchIdRange and 
voucher = LJT.Voucher and 
transdate = LJT.transdate)
group by purchidrange, voucher, transdate, invoice

--select * from DC_TmpVouchersToComplete order by voucher

update LedgerJournalTrans set purchidrange = VTC.purchidrange
from LedgerJournalTrans AS  LJT
join  DC_TmpVouchersToComplete AS VTC 
ON LJT.voucher = VTC.voucher
and LJT.transdate = VTC.transdate
and LJT.invoice = VTC.invoice
and LJT.voucher = @voucher

--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X
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
commit tran
--rollback tran
end

exec DC_TmpUpdateLJT_PurchIdRange