declare @fromdate datetime
declare @todate	 datetime

set @fromdate = '19000101' set @Todate  = '20081231'
select /*purchtable.purchid, purchtable.orderaccount, purchtable.invoiceaccount*/ count(*) as Antal2008 from purchtable
	inner join VendPackingSlipJour on
	VendPackingSlipJour.purchid = Purchtable.purchid and
	VendPackingSlipJour.DELIVERYDATE <= @Todate
where purchtable.purchstatus = 2
--and   (select count(*) from VendPackingSlipJour SPSJ where SPSJ.purchid = Purchtable.purchid and
--												 SPSJ.DELIVERYDATE > @Fromdate and SPSJ.DELIVERYDATE <= @Todate) > 1

set @fromdate = '20081231' set @Todate  = '20090131'
select /*purchtable.purchid, purchtable.orderaccount, purchtable.invoiceaccount*/ count(*) as Antal2009_01 from purchtable
	inner join VendPackingSlipJour on
	VendPackingSlipJour.purchid = Purchtable.purchid and
	VendPackingSlipJour.DELIVERYDATE > @fromdate and VendPackingSlipJour.DELIVERYDATE <= @Todate
where purchtable.purchstatus = 2
--and   (select count(*) from VendPackingSlipJour SPSJ where SPSJ.purchid = Purchtable.purchid and
--												 SPSJ.DELIVERYDATE > @Fromdate and SPSJ.DELIVERYDATE <= @Todate) > 1

set @fromdate = '20090131' set @Todate  = '20090228'
select count(*) as Antal2009_02 from purchtable
	inner join VendPackingSlipJour on
	VendPackingSlipJour.purchid = Purchtable.purchid and
	VendPackingSlipJour.DELIVERYDATE > @fromdate and VendPackingSlipJour.DELIVERYDATE <= @Todate
where purchtable.purchstatus = 2
--and   (select count(*) from VendPackingSlipJour SPSJ where SPSJ.purchid = Purchtable.purchid and
--												 SPSJ.DELIVERYDATE > @Fromdate and SPSJ.DELIVERYDATE <= @Todate) > 1

------------------------------------------------------------------------------------------------------------------------------	
--set @fromdate = '19000101' set @Todate  = '20081231'
--select purchtable.purchid, purchtable.orderaccount, purchtable.invoiceaccount /*count(*)*/ from purchtable
--	inner join VendPackingSlipJour on
--	VendPackingSlipJour.purchid = Purchtable.purchid and
--	VendPackingSlipJour.DELIVERYDATE <= @Todate
--where purchtable.purchstatus = 2
----and   (select count(*) from VendPackingSlipJour SPSJ where SPSJ.purchid = Purchtable.purchid and
----												 SPSJ.DELIVERYDATE > @Fromdate and SPSJ.DELIVERYDATE <= @Todate) > 1


--set @fromdate = '20081231' set @Todate  = '20090131'
--select purchtable.purchid, purchtable.orderaccount, purchtable.invoiceaccount /*count(*)*/ from purchtable
--	inner join VendPackingSlipJour on
--	VendPackingSlipJour.purchid = Purchtable.purchid and
--	VendPackingSlipJour.DELIVERYDATE > @fromdate and VendPackingSlipJour.DELIVERYDATE <= @Todate
--where purchtable.purchstatus = 2
----and   (select count(*) from VendPackingSlipJour SPSJ where SPSJ.purchid = Purchtable.purchid and
----												 SPSJ.DELIVERYDATE > @Fromdate and SPSJ.DELIVERYDATE <= @Todate) > 1

set @fromdate = '20090131' set @Todate  = '20090228'
select purchtable.purchid, purchtable.orderaccount, purchtable.invoiceaccount from purchtable
	inner join VendPackingSlipJour on
	VendPackingSlipJour.purchid = Purchtable.purchid and
	VendPackingSlipJour.DELIVERYDATE > @fromdate and VendPackingSlipJour.DELIVERYDATE <= @Todate
where purchtable.purchstatus = 2
--and   (select count(*) from VendPackingSlipJour SPSJ where SPSJ.purchid = Purchtable.purchid and
--												 SPSJ.DELIVERYDATE > @Fromdate and SPSJ.DELIVERYDATE <= @Todate) > 1

	