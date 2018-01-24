--select count(*)  from rcmsupfoorderreference
drop table #TmpLLU
go
-- insert into #TmpLLU
select 
rcmsupfoorders.orderid as RCMOrderId, 
(case rcmsupfoorders.status 
	when 0 then 'open' 
	when 1 then 'sent' 
	when 2 then 'confirmed' 
	when 3 then 'cancelled' 
	when 6 then 'Transported' 
	when 7 then 'Acknowledged (Modtaget)' 
	end) as FOStatus,
rcmsupfoorderreference.* 
into #TmpLLU
from rcmsupfoorderreference
inner join rcmsupfoorders on rcmsupfoorders.orderid = rcmsupfoorderreference.orderid
where not exists (select 1 from purchtable where purchid = rcmsupfoorderreference.refpurchid)
--and not exists (select 1 from RCMSupFOOrders where orderid = rcmsupfoorderreference.orderid)
--and rcmsupfoorderreference.refpurchid like '%7000%'-- <> ''
--and len(ltrim(refpurchid)) <>8
and rcmsupfoorders.status <> 3 and rcmsupfoorders.status <> 7
order by rcmsupfoorderreference.refpurchid desc

select ltrim(refpurchid) as purchid, FOStatus, count(*) as antLinier from #TmpLLU group by refpurchid,FOStatus order by FOStatus,refpurchid

select count(*) from #TmpLLU 
select #TmpLLU.refpurchid, RCMorderid, #TmpLLU.FOStatus,count(*) as cnt /*delete*/ 
	from rcmsupfoorderreference inner join 
     #TmpLLU on #TmpLLU.RCMOrderId = rcmsupfoorderreference.orderid
where #TmpLLU.refpurchid <> '' 
group by #TmpLLU.refpurchid, #TmpLLU.RCMOrderId, #TmpLLU.FOStatus
order by cnt desc
select * from rcmsupfoorders where orderid = right(replicate(' ',20)+'257494',20)
select * from rcmsupfoorderreference where orderid = right(replicate(' ',20)+'257494',20)


drop table #TmpLLU_PurchId
select refpurchid into #TmpLLU_PurchId from #TmpLLU group by refpurchid
--select orderid into #TmpLLU_orderid from #TmpLLU group by orderid
select * from #TmpLLU_PurchId
select count(*) from rcmsupfoorders fo
	where exists (select 1 from rcmsupfoorderreference r where r.orderid = fo.orderid
						and not exists (select 1 from purchtable p where p.purchid = r.refpurchid))


select count(*) from purchtabledelete
select * from #TmpLLU_PurchId
	where not exists (select 1 from purchtabledelete where purchid = #TmpLLU_PurchId.refPurchid)
	  and not exists (select 1 from purchtable where purchid = #TmpLLU_PurchId.refPurchid)
order by refpurchid

select * from #TmpLLU_PurchId
	where exists (select 1 from purchtabledelete where purchid = #TmpLLU_PurchId.refPurchid)
	  and not exists (select 1 from purchtable where purchid = #TmpLLU_PurchId.refPurchid)
order by refpurchid

select * 
into rcmsupfoorders_beforedelete_20090319
from rcmsupfoorders
where exists (select 1 from #TmpLLU_PurchId where exist (select 1 from rcmsupfoorderreferences where recpurchid = #TmpLLU_PurchId.recpurchid
																								and orderid = rcmsupfoorders.orderid))
select * 
into rcmsupfoorderreference_beforedelete_20090319
from rcmsupfoorderreference
where exists (select 1 from #TmpLLU_PurchId where refpurchid = rcmsupfoorderreference.refpurchid)
																								
select orderid from rcmsupfoorderreference_beforedelete_20090319 
--	where ltrim(orderid) = '191929'
group by orderid order by orderid
	

select top 100 rcmsupfoorderreference.orderid, rcmsupfoorderreference.refpurchid, rcmsupfoorders.purchaseorderid  /*count(*)*/ from rcmsupfoorderreference
	inner join rcmsupfoorders on
	rcmsupfoorders.orderid = rcmsupfoorderreference.orderid
where rcmsupfoorders.purchaseorderid <> rcmsupfoorderreference.refpurchid

select count(*) from purchline

select orderid, refpurchid from rcmsupfoorderreference where refpurchid = right(replicate(' ',20)+'70010844',20)
select purchid from purchtable where purchId = right(replicate(' ',20)+'70010844',20)
