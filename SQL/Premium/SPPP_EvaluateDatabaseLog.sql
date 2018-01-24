select top 10 * from SQLDICTIONARY
select count(*) RecCount, logtable, SQLDICTIONARY.NAME from DatabaseLog 
	join SQLDICTIONARY on SQLDICTIONARY.TABLEID = DatabaseLog.LOGTABLE

group by DatabaseLog.LOGTABLE, SQLDICTIONARY.NAME

select top 10 
	iif(logtype=0,'Insert',
	  iif(logtype=1,'Delete',
	    iif(logtype=2,'Update',
	       cast(Logtype as nvarchar(2)
		)))),
		* from DatabaseLog order by logtable, LOGFIELD
 