select top 100 	SQLDICTIONARY.NAME, iif(logtype=0,'Insert',
	  iif(logtype=1,'Delete',
	    iif(logtype=2,'Update',
	       cast(Logtype as nvarchar(2)
		)))) logtype,count(*) records from SYSDATABASELOG
join SQLDICTIONARY on SQLDICTIONARY.TABLEID = SYSDATABASELOG.TABLE_
where SQLDICTIONARY.FIELDID = 0
group by SYSDATABASELOG.TABLE_, SQLDICTIONARY.NAME, SYSDATABASELOG.LOGTYPE