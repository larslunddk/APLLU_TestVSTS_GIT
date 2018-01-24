
select count(*) as cnt, table_,
	(select name from sqldictionary where fieldid = 0 and tableid = sysdatabaselog.table_)
 from sysdatabaselog group by Table_ order by cnt desc


select COUNT(*), dbo.lp_year_mth_date(createddate) from systracetablesql 
	group by dbo.lp_year_mth_date(createddate) order by dbo.lp_year_mth_date(createddate)

--select top 20 dbo.lp_year_mth_date(createddate),* from systracetablesql where createddate = '20090314' and tracetime>5000