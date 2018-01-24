select count(*) as cnt, reftableid from docuref group by reftableid order by cnt desc

declare cursor Tablename for
	select name from sqldictionary
		where fieldid = 0
		and   array = 0
		and exist(
select count(*) as cnt from docuref
	where 