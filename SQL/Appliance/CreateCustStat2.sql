drop view LP_CustStat1
GO
create VIEW [dbo].[LP_CustStat1]
AS
SELECT     TOP 100 PERCENT dbo.INVENTTRANS.ITEMID + ' ' + dbo.INVENTTABLE.ITEMNAME AS ITEM, 
					  dbo.INVENTTABLE.ITEMNAME, 
                      dbo.INVENTTABLE.ITEMGROUPID + ' ' +
                          (SELECT     NAME
                            FROM          dbo.INVENTITEMGROUP
                            WHERE      (ITEMGROUPID = dbo.INVENTTABLE.ITEMGROUPID) AND (DATAAREAID = dbo.INVENTTRANS.DATAAREAID)) AS ItemGRP, 
                      LTRIM(dbo.INVENTTRANS.CUSTVENDAC) + ' ' + CUSTTABLE_1.NAME AS CustAccount, 
				      CUSTTABLE_1.NAME AS CustName, 
                      CUSTTABLE_1.CUSTGROUP + ' ' + dbo.CUSTGROUP.NAME AS CustGrp, 
					  -1 * SUM(dbo.INVENTTRANS.QTY) AS Qty, 
                      CASE WHEN sum(dbo.CUSTINVOICETRANS.QTY) <> 0 THEN
											((SUM(dbo.CUSTINVOICETRANS.LINEAMOUNTMST)+sum(dbo.CUSTINVOICETRANS.sumlinediscmst)) 
												*(-1*SUM(dbo.INVENTTRANS.QTY)/sum(dbo.CUSTINVOICETRANS.QTY)))
										   ELSE
											0
										   END
									AS SalesAmountMST, 
                      CASE WHEN sum(dbo.CUSTINVOICETRANS.QTY) <> 0 THEN
										sum(dbo.CUSTINVOICETRANS.sumlinediscmst) * (-1*SUM(dbo.INVENTTRANS.QTY)/sum(dbo.CUSTINVOICETRANS.QTY))
									 ELSE
										0
									 END
									AS LinediscMST, 
					  (SUM(dbo.INVENTTRANS.COSTAMOUNTPOSTED) + SUM(dbo.INVENTTRANS.COSTAMOUNTADJUSTMENT)) * - 1 AS CostAmountPosted, 
					  CUSTTABLE_1.SALESGROUP as SalesGroup, 
                      dbo.CUSTINVOICETRANS.DIMENSION as Department, 
					  LTRIM(dbo.INVENTTRANS.INVOICEID) AS InvoiceId, 
					  LEFT(CONVERT(varchar, dbo.INVENTTRANS.DATEFINANCIAL, 120), 10) AS InvDate, 
					  DATEPART(yyyy, dbo.INVENTTRANS.DATEFINANCIAL) AS Yr, 
                      dbo.LP_YEAR_MTH(dbo.INVENTTRANS.DATEFINANCIAL) AS YrMth, dbo.LP_YEAR_WEEK(dbo.INVENTTRANS.DATEFINANCIAL) AS YrWk, 
                      CASE WHEN sum(dbo.CUSTINVOICETRANS.QTY) <> 0 THEN
										((SUM(dbo.CUSTINVOICETRANS.LINEAMOUNTMST)+sum(dbo.CUSTINVOICETRANS.sumlinediscmst)) *
										(SUM(dbo.INVENTTRANS.QTY)/sum(dbo.CUSTINVOICETRANS.QTY))) 
									  ELSE
										0
									  END
									/ 7.4591 AS SalesAmountEUR, 
                      SUM(dbo.INVENTTRANS.COSTAMOUNTPOSTED) / 7.4591 AS CostAmountEUR, 
					  dbo.INVENTTRANS.DATAAREAID as dataareaid, 
					  dbo.LP_MTHNAME(dbo.INVENTTRANS.DATEFINANCIAL) AS Mth, 
					  dbo.CUSTINVOICETRANS.LEDGERACCOUNT as Ledgeraccount, 
                      LTRIM(dbo.CUSTINVOICEJOUR.INVOICEACCOUNT) + ' ' +
                          (SELECT     NAME
                            FROM          dbo.CUSTTABLE
                            WHERE      (ACCOUNTNUM = dbo.CUSTINVOICEJOUR.INVOICEACCOUNT) AND (DATAAREAID = dbo.INVENTTRANS.DATAAREAID)) AS InvoiceAccount,
					  dbo.CUSTINVOICEJOUR.DLVCOUNTRY as DlvCountry,
					  dbo.CUSTINVOICEJOUR.INVCOUNTRY as InvCountry,
					  dbo.LP_App_ICAccount(CUSTTABLE_1.NAME) as ICAccount,
					  dbo.LP_App_FiscalYrMth(dbo.INVENTTRANS.DATEFINANCIAL) as FiscalYrMth,
					  dbo.LP_App_FiscalMth(dbo.INVENTTRANS.DATEFINANCIAL) as FiscalMth,
					  CUSTTABLE_1.STATISTICSGROUP as StatisticsGroup,
					  CUSTTABLE_1.zipcode as ZipCode,
					  CUSTTABLE_1.MARKUPGROUP as MARKUPGROUPID,
					  (select INVENTITEMMAINGRP from dbo.INVENTITEMGROUP where ITEMGROUPID = dbo.inventtable.itemgroupid and dataareaid = INVENTTRANS.DATAAREAID) as ITEMMainGroup,
					  (select INVENTITEMFAMILY from dbo.INVENTITEMGROUP where ITEMGROUPID = dbo.inventtable.itemgroupid and dataareaid = INVENTTRANS.DATAAREAID) as ITEMFAMLIY,
					  dbo.CUSTINVOICEJOUR.LEDGERVOUCHER,
					  INVENTTRANS.recid,
					  -1*(sum(INVENTTRANS.COSTAMOUNTPOSTED) + (case (isnull( (select top 1 recid from inventsettlement 
																	 where transrecid = inventtrans.recid and DATAAREAID = dbo.INVENTTRANS.DATAAREAID 
																		and operationsaccount = replicate(' ',5)+'20005'),0))
														when 0 then sum(COSTAMOUNTADJUSTMENT )
														else 0 end)) as CostAmount,
					  (SELECT NAME FROM COMMISSIONSALESGROUP
						WHERE (GROUPID = CUSTTABLE_1.SALESGROUP) AND (DATAAREAID = dbo.INVENTTRANS.DATAAREAID)) as Country, 
					  CUSTINVOICETRANS.inventtransid,
					  1 AS CNT, 'EOR' AS EOR
FROM         dbo.CUSTINVOICETRANS INNER JOIN
                      dbo.INVENTTRANS ON dbo.CUSTINVOICETRANS.DATAAREAID = dbo.INVENTTRANS.DATAAREAID AND 
                      dbo.CUSTINVOICETRANS.INVENTTRANSID = dbo.INVENTTRANS.INVENTTRANSID AND
					  dbo.CUSTINVOICETRANS.INVOICEID = dbo.INVENTTRANS.INVOICEID AND
					  dbo.CUSTINVOICETRANS.INVOICEDATE = dbo.INVENTTRANS.DATEFINANCIAL
					  INNER JOIN
                      dbo.INVENTTABLE ON dbo.INVENTTRANS.ITEMID = dbo.INVENTTABLE.ITEMID AND 
                      dbo.INVENTTRANS.DATAAREAID = dbo.INVENTTABLE.DATAAREAID 
					  INNER JOIN
                      dbo.CUSTTABLE AS CUSTTABLE_1 ON dbo.INVENTTRANS.DATAAREAID = CUSTTABLE_1.DATAAREAID AND 
                      dbo.INVENTTRANS.CUSTVENDAC = CUSTTABLE_1.ACCOUNTNUM 
					  INNER JOIN
                      dbo.CUSTGROUP ON CUSTTABLE_1.DATAAREAID = dbo.CUSTGROUP.DATAAREAID AND 
                      CUSTTABLE_1.CUSTGROUP = dbo.CUSTGROUP.CUSTGROUP 
					  INNER JOIN
                      dbo.CUSTINVOICEJOUR ON dbo.CUSTINVOICETRANS.INVOICEDATE = dbo.CUSTINVOICEJOUR.INVOICEDATE AND 
                      dbo.INVENTTRANS.INVOICEID = dbo.CUSTINVOICEJOUR.INVOICEID AND 
                      dbo.CUSTINVOICETRANS.DATAAREAID = dbo.CUSTINVOICEJOUR.DATAAREAID AND dbo.CUSTINVOICETRANS.DATAAREAID <> 'å2' AND 
                      dbo.CUSTINVOICETRANS.DATAAREAID <> 'åp1' AND
					  dbo.CUSTINVOICETRANS.LEDGERACCOUNT < right(replicate(' ',20)+'20000',20)

GROUP BY dbo.INVENTTRANS.ITEMID, dbo.CUSTINVOICETRANS.DIMENSION, dbo.INVENTTRANS.INVOICEID, 
                      dbo.INVENTTRANS.DATEFINANCIAL, dbo.CUSTINVOICETRANS.SALESGROUP, dbo.INVENTTABLE.ITEMNAME, dbo.INVENTTABLE.ITEMGROUPID, 
                      dbo.INVENTTRANS.CUSTVENDAC, CUSTTABLE_1.NAME, LTRIM(dbo.INVENTTRANS.INVOICEID), CUSTTABLE_1.CUSTGROUP, 
                      dbo.CUSTGROUP.NAME, dbo.INVENTTRANS.DATAAREAID, dbo.CUSTINVOICETRANS.LEDGERACCOUNT, 
                      dbo.CUSTINVOICEJOUR.INVOICEACCOUNT,dbo.CUSTINVOICEJOUR.DLVCOUNTRY,CUSTTABLE_1.STATISTICSGROUP,dbo.CUSTINVOICEJOUR.INVCOUNTRY,
					  CUSTTABLE_1.zipcode , INVENTTRANS.INVENTTRANSID, dbo.CUSTINVOICEJOUR.LEDGERVOUCHER,CUSTTABLE_1.MARKUPGROUP,
					  CUSTTABLE_1.SALESGROUP, INVENTTRANS.recid,CUSTINVOICETRANS.inventtransid
                      
GO
drop view LP_CustStat2
GO
create view LP_CustStat2
as
SELECT		LP_CustStat1.ITEM, LP_CustStat1.ITEMNAME, LP_CustStat1.ItemGRP, LP_CustStat1.CustAccount, LP_CustStat1.CustName, 
			LP_CustStat1.CustGrp, sum(LP_CustStat1.Qty) as Qty, sum(LP_CustStat1.SalesAmountMST) as SalesAmountMST, 
			sum(LP_CustStat1.LinediscMST) as LinediscMST , 
					(case LP_CustStat1.dataareaid 
						when 'se' then sum(LP_CustStat1.CostAmountPosted)
						when 'no' then sum(LP_CustStat1.CostAmountPosted)
						else sum(LP_CustStat1.CostAmountPosted) end)
					   as CostAmountPosted, 
			LP_CustStat1.SalesGroup, LP_CustStat1.Department, 
            LP_CustStat1.InvoiceId, LP_CustStat1.InvDate, LP_CustStat1.Yr, LP_CustStat1.YrMth, LP_CustStat1.YrWk, 
			sum(LP_CustStat1.SalesAmountEUR) as SalesAmountEUR, sum(LP_CustStat1.CostAmountEUR) as CostAmountEUR, 
			LP_CustStat1.dataareaid, LP_CustStat1.Mth, LP_CustStat1.Ledgeraccount, LP_CustStat1.InvoiceAccount, 
			LP_CustStat1.DlvCountry, LP_CustStat1.InvCountry, 
            LP_CustStat1.ICAccount, LP_CustStat1.FiscalYrMth, LP_CustStat1.FiscalMth, LP_CustStat1.StatisticsGroup, 
			LP_CustStat1.ZipCode, LP_CustStat1.MARKUPGROUPID, LP_CustStat1.ITEMMainGroup, LP_CustStat1.ITEMFAMLIY, 
			LP_CustStat1.LEDGERVOUCHER, 
					(case LP_CustStat1.dataareaid 
						when 'se' then sum(LP_CustStat1.CostAmount)
						when 'no' then sum(LP_CustStat1.CostAmount)
						else sum(LP_CustStat1.CostAmount) end)
					   as CostAmount, 
					isnull(LP_CustStat1.Country,LP_CustStat1.SalesGroup) as Country,
			(select top 1 ReturnActionId from salesline where salesline.dataareaid = LP_CustStat1.dataareaid and salesline.inventtransid = LP_CustStat1.Inventtransid) as Return_reason,
			(select top 1 scrap from salesline where salesline.dataareaid = LP_CustStat1.dataareaid and salesline.inventtransid = LP_CustStat1.Inventtransid) as Warrenty,
            LP_CustStat1.CNT, LP_CustStat1.EOR
FROM         dbo.LP_CustStat1 --inner join Salesline on salesline.inventtransid = LP_CustStat1.Inventtransid
GROUP BY 
LP_CustStat1.ITEM, LP_CustStat1.ITEMNAME, LP_CustStat1.ItemGRP, LP_CustStat1.CustAccount, LP_CustStat1.CustName, 
			LP_CustStat1.CustGrp, 
			LP_CustStat1.SalesGroup, LP_CustStat1.Department, 
            LP_CustStat1.InvoiceId, LP_CustStat1.InvDate, LP_CustStat1.Yr, LP_CustStat1.YrMth, LP_CustStat1.YrWk, 
			LP_CustStat1.dataareaid, LP_CustStat1.Mth, LP_CustStat1.Ledgeraccount, LP_CustStat1.InvoiceAccount, 
			LP_CustStat1.DlvCountry, LP_CustStat1.InvCountry, 
            LP_CustStat1.ICAccount, LP_CustStat1.FiscalYrMth, LP_CustStat1.FiscalMth, LP_CustStat1.StatisticsGroup, 
			LP_CustStat1.ZipCode, LP_CustStat1.MARKUPGROUPID, LP_CustStat1.ITEMMainGroup, LP_CustStat1.ITEMFAMLIY, 
			LP_CustStat1.LEDGERVOUCHER, 
			LP_CustStat1.Country,LP_CustStat1.SalesGroup,
			LP_CustStat1.Inventtransid,
			--salesline.ReturnActionId ,
			--salesline.scrap ,
            LP_CustStat1.CNT, LP_CustStat1.EOR

-- ITEM, ITEMNAME, ItemGRP, CustAccount, CustName, CustGrp,  SalesGroup, Department, 
--                      InvoiceId, InvDate, Yr, YrMth, YrWk, dataareaid, Mth, Ledgeraccount, InvoiceAccount, DlvCountry, InvCountry, 
--                      ICAccount, FiscalYrMth, FiscalMth, StatisticsGroup, ZipCode, MARKUPGROUPID, ITEMMainGroup, ITEMFAMLIY, LEDGERVOUCHER, 
--					  Country,CNT, EOR

--drop table tmpCustStat4 
--select *
--into tmpCustStat4
--from tmpCustStat3
--
--select * invoiceid, costamountposted, costamount from tmpCustStat4 where InvoiceId = '01291'
--select count(*) from tmpCustStat4