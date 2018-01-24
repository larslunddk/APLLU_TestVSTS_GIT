select 
	DATEPART(YEAR, transdate) _Yr, DATEPART(MONTH, transdate) _Mth, DATEPART(DAY, transdate) _Date, TransTime/(60*60) _Hour, 
	count(*) as cnt 
	--sum(netamount) as NetAmount
	from  retailtransactionsalestrans 
	group by  DATEPART(YEAR, transdate), DATEPART(MONTH, transdate), DATEPART(DAY, transdate), TransTime/(60*60)
	order by DATEPART(YEAR, transdate), DATEPART(MONTH, transdate), DATEPART(DAY, transdate), TransTime/(60*60)

select count(*) from retailtransactionsalestrans --where netamount < -100000 or netamount > 100000 order by NETAMOUNTINCLTAX
select store, TERMINALID, convert(nvarchar,transdate,105) as _date,TransTime/(60*60) as _Time, count(*) transCount, convert(nvarchar,cast(sum(NETAMOUNT) as money),1) transNetAmount from retailtransactionsalestrans group by store, TERMINALID, convert(nvarchar,transdate,105),TransTime/(60*60)


select distinct(inventitemgroup) from 
Eigenkauf, konsign

--select ReqTrans.itemid, ReqTrans.reqDate, REQPOSTATUS from REQTRANS 
select ReqPo.VENDID, count(*) from REQTRANS 
join ReqPO on ReqPo.refid = ReqTrans.REFID and ReqPo.reftype = ReqTrans.REFTYPE and ReqPo.PLANVERSION = ReqTrans.PLANVERSION
join VENDTABLE on ACCOUNTNUM = ReqPo.vendid
join DIRPARTYVIEW on  DIRPARTYVIEW.PARTY = VENDTABLE.PARTY
group by ReqPO.VENDID, DIRPARTYVIEW.

select count(*), ReqPoStatus from ReqPo group by REQPOSTATUS