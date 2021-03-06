USE [axdb_demko]
GO
/****** Object:  View [dbo].[ULCertificateView2]    Script Date: 05/22/2008 08:17:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
DROP VIEW [dbo].[ULCertificateView2]
GO
CREATE view [dbo].[ULCertificateView2] as
SELECT				  bmssa.PROJCERTIFICATE.CERTIFICATEID, 
					  bmssa.PROJTABLE.ENDDATE AS Cert_DateOfIssue, 
                      bmssa.PROJINVOICETABLE.COUNTRYID AS Customer_location_Country, 
					  'n/a' AS Customer_Region, 
					  'DK' AS CO_Location, 
                      bmssa.PROJCERTIFICATE.CERTTYPE AS Certificate_Type, 
					  bmssa.PROJDECISIONLINK.DECISIONID AS Standard_Series, 
                      bmssa.INVENTTABLE.ITEMGROUPID AS Category, 
					  'UL Demko' AS PoW_Office, 
					  bmssa.CUSTTABLE.NAME AS Customer_name, 
                      bmssa.PROJTABLE.ORA_INDUSTRICODE AS Industry,
                          (SELECT     TXT
                            FROM          bmssa.PROJTABLE AS PT
                            WHERE      (PROJID = bmssa.ProjTable.projid)) AS Comments
FROM         bmssa.PROJDECISIONLINK INNER JOIN
                      bmssa.INVENTTABLE ON bmssa.PROJDECISIONLINK.ITEMIDREADONLY = bmssa.INVENTTABLE.ITEMID AND 
                      bmssa.PROJDECISIONLINK.DATAAREAID = bmssa.INVENTTABLE.DATAAREAID INNER JOIN
                      bmssa.PROJTABLE INNER JOIN
                      bmssa.CUSTTABLE ON bmssa.PROJTABLE.CUSTACCOUNT = bmssa.CUSTTABLE.ACCOUNTNUM AND 
                      bmssa.PROJTABLE.DATAAREAID = bmssa.CUSTTABLE.DATAAREAID INNER JOIN
                      bmssa.PROJCERTIFICATE ON bmssa.PROJTABLE.PROJID = bmssa.PROJCERTIFICATE.PROJID AND 
                      bmssa.PROJTABLE.DATAAREAID = bmssa.PROJCERTIFICATE.DATAAREAID INNER JOIN
                      bmssa.PROJINVOICETABLE ON bmssa.PROJTABLE.DATAAREAID = bmssa.PROJINVOICETABLE.DATAAREAID AND 
                      bmssa.PROJTABLE.PROJINVOICEPROJID = bmssa.PROJINVOICETABLE.PROJINVOICEPROJID ON 
                      bmssa.PROJDECISIONLINK.PROJID = bmssa.PROJTABLE.PROJID AND bmssa.PROJDECISIONLINK.DATAAREAID = bmssa.PROJTABLE.DATAAREAID
WHERE     (bmssa.PROJTABLE.DATAAREAID = 'dat')
AND       (bmssa.PROJDECISIONLINK.LINENUM = 1)
GROUP BY bmssa.PROJCERTIFICATE.CERTIFICATEID, bmssa.PROJTABLE.PROJID, bmssa.PROJTABLE.NAME, bmssa.PROJTABLE.CUSTACCOUNT, 
                      bmssa.PROJDECISIONLINK.DECISIONID, bmssa.PROJCERTIFICATE.CERTTYPE, bmssa.PROJCERTIFICATE.PROJCERT_ENECGRCODE, bmssa.PROJTABLE.ENDDATE,
                       bmssa.PROJINVOICETABLE.COUNTRYID, bmssa.CUSTTABLE.NAME, bmssa.PROJTABLE.ORA_INDUSTRICODE, bmssa.INVENTTABLE.ITEMGROUPID
