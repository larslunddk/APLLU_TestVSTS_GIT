select   invoiceaccount, orderaccount, dc_connectionId,
(select top 1 LastOrderDate from dc_purchconnectiontable where dc_connectionid = purchtable.dc_connectionid) as _lastorderdate, 
DC_InventPackingCode,
purchid ,
isnull((select top 1 1 from purchline where purchid = PurchTable.purchid),0) as PurchLineCnt,
isnull((select top 1 1 from VendPurchOrderJour where purchid = PurchTable.purchid),0) as RekvCnt,
isnull((select top 1 1 from VendInvoiceJour where purchid = PurchTable.purchid),0) as InvCnt,
isnull((select top 1 1 from RCMSupFoOrderReference where refPurchId = PurchTable.purchid),0) as FO,
isnull((select top 1 1 from LedgerJournalTrans where JournalNum = right(replicate(' ',10)+'2251',10) and dataareaid = 'kni' 
	and accounttype = 2 and PurchIdRange = ltrim(PurchTable.purchid) /*
		and exists(select 1 from vendtrans where accountnum = ledgerjournaltrans.accountnum
						and voucher = ledgerjournaltrans.voucher
						and transdate = ledgerjournaltrans.transdate
						and invoice = ledgerjournaltrans.invoice
						and arrival = 1
					    and  journalnum = ledgerjournaltrans.journalnum)*/),0) as FaktPulje,
(select top 1 createddate from LedgerJournalTrans where JournalNum = right(replicate(' ',10)+'2251',10) and dataareaid = 'kni' 
	and accounttype = 2 and PurchIdRange = ltrim(PurchTable.purchid)) as FaktPuljeOpretDato
from purchtable
	where purchstatus = 2
and deliverydate >= '19000101' --
	and deliverydate <= '20090222'--'20081231' --
order by invoiceaccount, orderaccount, dc_connectionId, purchid 
