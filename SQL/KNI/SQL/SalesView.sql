--drop view LP_CustStat1
--GO
--create VIEW [dbo].[LP_CustStat1]
--AS
SELECT top 100     INVENTTRANS.ITEMID, INVENTTABLE.ITEMNAME, 
	INVENTTRANS.INVOICEID, dbo.INVENTTRANS.DATEFINANCIAL as INVOICEDATE, 
    CUSTINVOICEJOUR.ORDERACCOUNT, CUSTINVOICEJOUR.INVOICEACCOUNT,
	-1 * SUM(dbo.INVENTTRANS.QTY) AS Qty, 
    CASE WHEN sum(dbo.CUSTINVOICETRANS.QTY) <> 0 THEN
											((SUM(dbo.CUSTINVOICETRANS.LINEAMOUNTMST)) 
												*(-1*SUM(dbo.INVENTTRANS.QTY)/sum(dbo.CUSTINVOICETRANS.QTY)))
										   ELSE
											0
										   END
									AS SalesAmountMST, 
	-1*(sum(INVENTTRANS.COSTAMOUNTPOSTED)+sum(INVENTTRANS.COSTAMOUNTPOSTED)) as CostAmount,
	DATEPART(yyyy, dbo.INVENTTRANS.DATEFINANCIAL) AS Yr, 
    dbo.LP_YEAR_MTH(dbo.INVENTTRANS.DATEFINANCIAL) AS YrMth--, dbo.LP_YEAR_WEEK(dbo.INVENTTRANS.DATEFINANCIAL) AS YrWk, 
	--dbo.LP_MTHNAME(dbo.INVENTTRANS.DATEFINANCIAL) AS Mth 					  

FROM         CUSTINVOICETRANS INNER JOIN
                      INVENTTRANS ON CUSTINVOICETRANS.DATAAREAID = INVENTTRANS.DATAAREAID AND 
                      CUSTINVOICETRANS.INVENTTRANSID = INVENTTRANS.INVENTTRANSID AND CUSTINVOICETRANS.INVOICEID = INVENTTRANS.INVOICEID AND 
                      CUSTINVOICETRANS.INVOICEDATE = INVENTTRANS.DATEFINANCIAL INNER JOIN
                      INVENTTABLE ON INVENTTRANS.ITEMID = INVENTTABLE.ITEMID AND INVENTTRANS.DATAAREAID = INVENTTABLE.DATAAREAID INNER JOIN
                      CUSTTABLE AS CUSTTABLE_1 ON INVENTTRANS.DATAAREAID = CUSTTABLE_1.DATAAREAID AND 
                      INVENTTRANS.CUSTVENDAC = CUSTTABLE_1.ACCOUNTNUM INNER JOIN
                      CUSTINVOICEJOUR ON CUSTINVOICETRANS.INVOICEDATE = CUSTINVOICEJOUR.INVOICEDATE AND 
                      INVENTTRANS.INVOICEID = CUSTINVOICEJOUR.INVOICEID AND CUSTINVOICETRANS.DATAAREAID = CUSTINVOICEJOUR.DATAAREAID
GROUP BY dbo.INVENTTRANS.ITEMID,  dbo.INVENTTRANS.INVOICEID, 
                      dbo.INVENTTRANS.DATEFINANCIAL,  dbo.INVENTTABLE.ITEMNAME, dbo.INVENTTABLE.ITEMGROUPID, 
                      dbo.INVENTTRANS.CUSTVENDAC,  LTRIM(dbo.INVENTTRANS.INVOICEID),
                      dbo.INVENTTRANS.DATAAREAID,
                      dbo.CUSTINVOICEJOUR.INVOICEACCOUNT,INVENTTABLE.ITEMNAME,CUSTINVOICEJOUR.ORDERACCOUNT
