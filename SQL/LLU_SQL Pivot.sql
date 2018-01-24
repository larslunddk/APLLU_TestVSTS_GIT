-- ###### TaxTrans pivot on taxPeriod
select * from (
select TAXPERIOD, count(*) cnt, datepart(MONTH, transdate) themonth from taxtrans 
	where dataareaid = 'NO01' 
	and   transdate>='20160101' 
	and   transdate<='20161231' 
	group by taxperiod, datepart(MONTH, transdate)
	) as s

	pivot (     sum(cnt)
            for themonth in ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])
)  Month

-------------------------------------------------------------------------------------------------------------------------------------------
-- ###### batchjobhistory pivot on Caption
select * from 
(
select Caption, 1 as cnt, 
	datepart(hour, dateadd(hour,2,STARTDATETIME)) thehour,
	ENDDATETIME-STARTDATETIME as execTime
	
 from batchjobhistory
 where [CREATEDDATETIME] > '20160122'
) as s

pivot (     sum(cnt)
            for thehour in ([0],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20],[21],[22],[23])
)  TimeOfDay

-------------------------------------------------------------------------------------------------------------------------------------------
-- ###### RETAILTRANSACTIONSALESTRANS pivot on Store
select * from (
	select STORE, count(*)/*sum(NETAMOUNT*-1)*/ as cnt, datepart(MONTH, TRANSDATE) themonth from RETAILTRANSACTIONSALESTRANS
	where DATAAREAID = 'DE01'
	group by STORE, datepart(MONTH, TRANSDATE)
	) as s
	pivot (     sum(cnt)
            for themonth in ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])
)  Month


-- ###### SYSDATABASELOG pivot on SQLName
select * from (
select TABLE_, SQLName, count(*) cnt, datepart(MONTH, CREATEDDATETIME) themonth from SYSDATABASELOG 
join SQLDICTIONARY on
SQLDICTIONARY.TableId = SYSDATABASELOG.TABLE_
and SQLDICTIONARY.fieldid = 0
--select top 10 * from sqldictionary
	where CREATEDDATETIME>='20170101' 
	and   CREATEDDATETIME<='20171231' 


	group by TABLE_, SQLName, datepart(MONTH, CREATEDDATETIME)
	) as s

	pivot (     sum(cnt)
            for themonth in ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])
)  Month