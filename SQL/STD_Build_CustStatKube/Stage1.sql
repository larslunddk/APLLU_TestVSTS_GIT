--if OBJECT_ID('LP_CustStat_a','V') is not null
--begin
--	drop view LP_CustStat_a
--end	
--GO
--create VIEW [dbo].[LP_CustStat_b]
--as
drop table #InvStat_Stage1                      
SELECT CIT.ITEMID,
	   'ITable.ITEMGROUPID' +replicate(' ',100)	AS ItemGroup,
	   CIJ.ORDERACCOUNT		+replicate(' ',100)	AS CustomerAccount,
	   CIJ.INVOICEACCOUNT	+replicate(' ',100)	AS InvoiceAccount,
	   sum(CIT.QTY)								AS Qty,
	   sum(CIT.LINEAMOUNTMST)					AS SalesAmountMst, 
       sum(CIT.sumlinediscmst)					AS LineDiscMst,
       (select sum(ITrans.COSTAMOUNTPOSTED)+ SUM(ITrans.COSTAMOUNTADJUSTMENT) from INVENTTRANS ITrans where ITrans.DATAAREAID = CIT.DATAAREAID and ITrans.INVENTTRANSID = CIT.INVENTTRANSID group by ITrans.INVENTTRANSID) * - 1 AS CostAmount,
		'CTable.SALESGROUP'	+replicate(' ',100)	AS SalesGroup,
		CIT.DIMENSION		+replicate(' ',100)	AS Department, 
		'IDim.INVENTLOCATIONID' AS InventLocationId,
		LTRIM(CIT.INVOICEID) AS InvoiceId,
		LEFT(CONVERT(varchar, CIT.INVOICEDATE, 120), 10) AS InvDate, 
		dbo.LP_YEAR_WEEK(CIT.INVOICEDATE) AS InvYrWk, 		
		CIT.DATAAREAID AS DataareaId,
		dbo.LP_App_FiscalYrMth(CIT.INVOICEDATE) as FiscalYrMth,
		dbo.LP_App_FiscalYr(CIT.INVOICEDATE) as FiscalYr,
		'CTable.STATISTICSGROUP' as StatisticsGroup,
		'CTable.zipcode' as ZipCode,
		-- CIJ.COUNTRYREGIONID as Country, -- 40
		CIJ.DLVCOUNTRY as Country, --30
		CIJ.LEDGERVOUCHER as LedgerVoucher,
		CIT.INVENTDIMID as InventDimId,
		--ITrans.recid,
		1 AS CNT
INTO #InvStat_Stage1                      
FROM CUSTINVOICETRANS CIT INNER JOIN
	CUSTINVOICEJOUR CIJ ON CIJ.DATAAREAID = CIT.DATAAREAID AND CIJ.INVOICEID = CIT.INVOICEID AND CIJ.INVOICEDATE = CIT.INVOICEDATE
	
GROUP BY CIT.ITEMID, CIJ.ORDERACCOUNT,CIT.DIMENSION, CIT.INVOICEID, CIT.INVOICEDATE, CIT.DATAAREAID, CIJ.LEDGERVOUCHER, CIT.INVENTTRANSID,
	CIT.INVENTDIMID,CIJ.INVOICEACCOUNT,
	--CTable.COUNTRYREGIONID --40
	CIJ.DLVCOUNTRY --30
GO	
select COUNT(*) from #Invstat_Stage1

UPDATE #InvStat_Stage1 set ItemGroup = ITable.itemgroupId+' '+IIGrp.NAME
from INVENTTABLE ITable inner join
	INVENTITEMGROUP IIGrp on IIGrp.DATAAREAID = ITable.DATAAREAID and IIGrp.ITEMGROUPID = ITable.ITEMGROUPID
	where ITable.DATAAREAID = #Invstat_Stage1.dataareaid and ITable.ITEMID = #Invstat_Stage1.itemid

UPDATE #InvStat_Stage1 set SalesGroup = CTable.SALESGROUP, CustomerAccount = CustomerAccount+' '+CTable.NAME
from CUSTTABLE CTable where CTable.DATAAREAID = #Invstat_Stage1.dataareaid and CTable.ACCOUNTNUM = #Invstat_Stage1.customerAccount

UPDATE #InvStat_Stage1 set #InvStat_Stage1.InvoiceAccount = #InvStat_Stage1.InvoiceAccount+' '+CTable.NAME
from CUSTTABLE CTable where CTable.DATAAREAID = #Invstat_Stage1.dataareaid and CTable.ACCOUNTNUM = #Invstat_Stage1.InvoiceAccount

UPDATE #InvStat_Stage1 set InventLocationId = IDim.INVENTLOCATIONID
from INVENTDIM IDim where IDim.DATAAREAID = #Invstat_Stage1.dataareaid and IDim.INVENTDIMID = #Invstat_Stage1.InventDimId

UPDATE #InvStat_Stage1 set department = department + ' ' + Dim.[DESCRIPTION]
from DIMENSIONS Dim where Dim.DATAAREAID = #Invstat_Stage1.dataareaid and dim.DIMENSIONCODE = 0 and dim.NUM = #Invstat_Stage1.Department

select * from 	#Invstat_Stage1