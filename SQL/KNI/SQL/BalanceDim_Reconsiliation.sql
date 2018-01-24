drop table #TmpLedgerBalReconsiliation
GO
SELECT ltrim(lbd.accountnum) as accountnum, lbd.transdate, lbd.Dimension, lbd.Dimension2_ ,lbd.Dimension3_,lbd.Dimension4_,
DebitMST as DebitMST, CreditMST as CreditMST,DebitMST+CreditMST as sumLBD,
--SUM(DebitMST), SUM(CreditMST), 
--SUM(DebitMST)+ SUM(CreditMST) as sumLBD,
(SELECT  sum(AmountMst) FROM LEDGERTRANS lt
	WHERE lt.dataareaid = lbd.dataareaid and lt.accountnum = lbd.accountnum and 
		  lt.dimension = lbd.dimension and lt.dimension2_ = lbd.dimension2_ and lt.dimension3_ = lbd.dimension3_ and lt.dimension4_ = lbd.dimension4_ and
		  lt.transdate = lbd.transdate
) as SumLedgerTrans
INTO #TmpLedgerBalReconsiliation
FROM LedgerBalancesDim lbd 
WHERE 
--ACCOUNTNUM = right(replicate(' ',20)+'94100',20) and
--TransDate<='20090331' AND 
--lbd.transdate >= '20030301' and lbd.transdate <= '20030331' and
PeriodCode=1
and SystemGeneratedUltimo = 0 
and lbd.Dimension='190'
and lbd.Dimension2_ ='211'
--group by lbd.Dimension, lbd.Dimension2_ 

select * from #TmpLedgerBalReconsiliation where abs(sumledgertrans-sumlbd)>1

-------------------------------------------------------------------------------------------------------------------------------------------------
-- Kontrol af enkeltdage
-------------------------------------------------------------------------------------------------------------------------------------------------
declare @account	nvarchar(20)
declare @calcdate	datetime 
declare @dimension  nvarchar(3)
declare @dimension2	nvarchar(3)
select @account = right(replicate(' ',20)+'94100',20), @calcdate = '20030530', @dimension='190',@dimension2='211'
-- Kontrol af LedgerBalanceDimTrans
select accountnum, transdate, dimension, dimension2_,debitmst, creditmst, debitmst+creditmst as amountmst 
from ledgerbalancesdimtrans where 
ACCOUNTNUM = @account and --right(replicate(' ',20)+'94100',20) and
transdate = @calcdate and --'20030530'and
Dimension=@dimension and --'190' and
Dimension2_ =@dimension2 --'211'

--Kontrol af ledgertrans - summation
------------------------------------
select accountnum, transdate, dimension, dimension2_,
--amountmst 
sum(amountmst) as amountmst 
from ledgertrans 
where 
ACCOUNTNUM = @account and --right(replicate(' ',20)+'94100',20) and
transdate = @calcdate and --'20030530'and
Dimension=@dimension and --'190' and
Dimension2_ =@dimension2 --'211'
group by accountnum, transdate, dimension, dimension2_


--Kontrol af ledgertrans - enkeltposter
---------------------------------------
/*
select accountnum, transdate, dimension, dimension2_,
amountmst 
--sum(amountmst) as amountmst 
from ledgertrans 
where 
ACCOUNTNUM = @account and --right(replicate(' ',20)+'94100',20) and
transdate = @calcdate and --'20030530'and
Dimension=@dimension and --'190' and
Dimension2_ =@dimension2 --'211'
--group by accountnum, transdate, dimension, dimension2_
*/