use axdb_Appliance
--select top 10 invoiceaccount, SUM(INVOICEAMOUNT) as invamount from CUSTINVOICEJOUR group by INVOICEACCOUNT order by invamount
declare @calcdate datetime
set @calcdate = '20061031'

declare @settleamountcurPerDate numeric(28,12)
select ACCOUNTNUM, CURRENCYCODE, transdate, 
--CUSTTRANS.settleAmountCur as settleamountFromLine,

--(CUSTTRANS.settleAmountCur - isnull((select sum(settleAmountCur) from custSettlement
--								where custSettlement.transRecId = CUSTTRANS.recId and
--								      custSettlement.transDate  > @calcdate),0)) as settleamountcurPerDate,
								      
--AMOUNTCUR,
AMOUNTCUR-(CUSTTRANS.settleAmountCur - isnull((select sum(settleAmountCur) from custSettlement
								where custSettlement.transRecId = CUSTTRANS.recId and
								      custSettlement.transDate  > @calcdate),0)) as OpenAmountPerDate

from CUSTTRANS
where CUSTTRANS.ACCOUNTNUM = RIGHT(replicate(' ',10)+'462852900',10)
and   CUSTTRANS.CURRENCYCODE = 'SEK'
--and   CUSTTRANS.TRANSDATE <= @calcdate
and   CUSTTRANS.TRANSDATE = '20061018'
 