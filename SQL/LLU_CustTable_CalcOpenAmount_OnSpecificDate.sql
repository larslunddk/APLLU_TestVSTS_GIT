use axdb_Appliance
--select top 10 invoiceaccount, SUM(INVOICEAMOUNT) as invamount from CUSTINVOICEJOUR group by INVOICEACCOUNT order by invamount
declare @calcdate datetime
set @calcdate = '20061031'
drop table #tmp
declare @settleamountcurPerDate numeric(28,12)
select ACCOUNTNUM, CURRENCYCODE, 

AMOUNTCUR-(CUSTTRANS.settleAmountCur - isnull((select sum(settleAmountCur) from custSettlement
								where custSettlement.transRecId = CUSTTRANS.recId and
								      custSettlement.transDate  > @calcdate),0)) as OpenAmountPerDate
into #Tmp
from CUSTTRANS
where CUSTTRANS.ACCOUNTNUM = RIGHT(replicate(' ',10)+'462852900',10)
and   CUSTTRANS.CURRENCYCODE = 'SEK'
and   CUSTTRANS.TRANSDATE <= @calcdate

select accountnum, currencycode, SUM(OpenAmountPerDate) from #Tmp
group by accountnum, currencycode
 