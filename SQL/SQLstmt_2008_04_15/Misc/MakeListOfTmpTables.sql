select 'TruncateTables('''+name+''');' from sqldictionary
	where fieldid = 0
	and   flags = 0
	and   (name like 'proj%' or name like 'del%' or name like 'payroll%')
	order by name
