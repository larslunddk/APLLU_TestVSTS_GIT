select * from 
(
select Caption, 1 as cnt, 
	datepart(hour, dateadd(hour,2,STARTDATETIME)) thehour,
	ENDDATETIME-STARTDATETIME as execTime
	
 from batchjobhistory
) as s

pivot (     sum(cnt)
            for thehour in ([0],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20],[21],[22],[23])
)  TimeOfDay


--select count(*) from BATCHJOBHISTORY