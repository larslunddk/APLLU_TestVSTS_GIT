select emplid,axdb30_develop.dbo.LP_YEAR_MTH(Transdate),sum(PROJTRANSKM) from dbo.PROJJOURNALTRANS 
	group by EMPLID,axdb30_develop.dbo.LP_YEAR_MTH(Transdate)
	order by EMPLID,axdb30_develop.dbo.LP_YEAR_MTH(Transdate)
