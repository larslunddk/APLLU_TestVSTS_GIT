declare @voucher nvarchar(20)
--set @voucher = right(replicate(' ',20)+'259838',20)
--set @voucher = right(replicate(' ',20)+'259839',20)
set @voucher = '              230851'--right(replicate(' ',20)+'259843',20)
--select journalnum, accounttype, purchidrange, accountnum,voucher, transdate, invoice from LedgerJournalTrans
--	where invoice = right(replicate(' ',20)+'984312647841',20)
select journalnum, accounttype, purchidrange, accountnum,voucher, transdate, invoice,recid from LedgerJournalTrans
	where voucher = @Voucher --and transdate > '20090210'

select Accountnum, voucher, transdate, invoice, arrival, journalnum,recid from vendtrans 
where voucher = @voucher

--select Accountnum, voucher, transdate, invoice, arrival, journalnum,recid from vendtrans 
--where invoice = right(replicate(' ',20)+'2222',20)


--where PurchIdRange = '2036076'
------------------------------------------------------------------------------------------------------------
--select Accountnum, voucher, transdate, invoice, arrival, journalnum from vendtrans 
--where voucher = @voucher
--	--transdate = '20081112' or transdate = '20081110') and
--	(LTRIM(invoice) = 'OFK1823122' or ltrim(invoice) = 'OFK1821934') 
------------------------------------------------------------------------------------------------------------
--declare @voucher nvarchar(20)
--set @voucher = right(replicate(' ',20)+'259841',20)
--set @voucher = right(replicate(' ',20)+'259839',20)
select journalnum, accounttype, purchidrange, accountnum,voucher, transdate, invoice from LedgerJournalTrans
	where voucher = @voucher --and transdate > '20090210'
	and   exists(select 'x' from vendtrans 
where accountnum =  LedgerJournalTrans.accountnum and
voucher = LedgerJournalTrans.voucher and 
transdate = LedgerJournalTrans.transdate and 
invoice = LedgerJournalTrans.invoice and
arrival = 1 
and ltrim(journalnum) = '2251'
) 



--declare @voucher nvarchar(20)
--set @voucher = right(replicate(' ',20)+'259841',20)
--select Accountnum, voucher, transdate, invoice, arrival, journalnum from vendtrans 
--where voucher = @voucher
--
