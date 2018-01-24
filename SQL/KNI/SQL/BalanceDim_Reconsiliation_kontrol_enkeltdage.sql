select accountnum, transdate, dimension, dimension2_,debitmst, creditmst, debitmst+creditmst as amountmst 
from ledgerbalancesdimtrans where 
ACCOUNTNUM = right(replicate(' ',20)+'94100',20) and
transdate = '20030530'and
Dimension='190' and
Dimension2_ ='211'

select accountnum, transdate, dimension, dimension2_,
amountmst 
--sum(amountmst) as amountmst 
from ledgertrans 
where ACCOUNTNUM = right(replicate(' ',20)+'94100',20) and
transdate = '20030530'and
Dimension='190' and
Dimension2_ ='211'
--group by accountnum, transdate, dimension, dimension2_


