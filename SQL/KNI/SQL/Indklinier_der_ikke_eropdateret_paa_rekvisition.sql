select purchid, count(*) as cnt from purchline
	where exists (SELECT * FROM VENDPURCHORDERJOUR WHERE (PURCHID = purchline.purchid))
	and not exists (SELECT * from VENDPURCHORDERTRANS where inventtransid = purchline.inventtransid)
group by purchid
order by purchid