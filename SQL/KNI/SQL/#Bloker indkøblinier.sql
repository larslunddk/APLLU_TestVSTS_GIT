
select pl.itemid, pl.blocked, pt.purchid, pt.inventlocationid, pt.dc_connectionid, pt.dc_inventpackingcode,
dbo.lp_year_mth_date(ct.LastOrderDate),dbo.lp_year_mth_date(pt.createddate), pt.documentstatus
--update pl set blocked = 1, customerref = 'Blocked by llu 2009.05.28'
--------------------------------------------------------------------
from purchline pl
inner join purchtable pt on pt.purchid = pl.purchid
inner join dc_purchconnectiontable ct on ct.dc_connectionid = pt.dc_connectionid
where 
ct.LastOrderDate < pt.createddate
--pt.createddate >= '20090522'
--and ct.LastOrderDate < '20090518'
and pt.purchstatus = 1
and pt.dc_blocked = 0
and pt.documentstatus = 0
order by pt.dc_connectionid, pt.purchid, pt.documentstatus

/*  RESET blocking 
*/
update pl set blocked = 0, customerref = ''
from purchline pl
inner join purchtable pt on pt.purchid = pl.purchid
inner join dc_purchconnectiontable ct on ct.dc_connectionid = pt.dc_connectionid
where 
ct.LastOrderDate < pt.createddate
--and pt.purchstatus = 1
--and pt.dc_blocked = 0
--and pt.documentstatus <> 0
and pt.purchid = right(replicate(' ',20)+'70020130',20)
and customerref = 'Blocked by llu 2009.05.28'



select dbo.lp_year_mth_date(pt.createddate), count(*)
from  purchtable pt
inner join dc_purchconnectiontable ct on ct.dc_connectionid = pt.dc_connectionid
where pt.createddate >= '20090521'
and ct.LastOrderDate < '20090518'
and pt.purchstatus = 1
and exists (select 1 from purchline pl where pt.purchid = pl.purchid and pl.blocked = 1)
group by pt.createddate


