select PCS_Responsible, count(*) as cnt 
	from PCS_TRSReport 
	group by PCS_Responsible 
	order by cnt DESC
	where ORDEREDDATE > 