USE [AX40SP2_KNI_UDV2]
GO

/****** Object:  View [dbo].[LP_PurchLineStat]    Script Date: 06/01/2009 18:09:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[LP_PurchLineStat]
AS
SELECT		dbo.PURCHLINE.VENDACCOUNT+' '+dbo.VENDTABLE.NAME as VendName, 
			dbo.PURCHTABLE.PURCHID, 
			dbo.PURCHTABLE.INVENTLOCATIONID, 
			dbo.PURCHTABLE.DC_CONNECTIONID, 
                      dbo.PURCHTABLE.DC_INVENTPACKINGCODE, 
                      dbo.PURCHTABLE.DC_UNCODE, 
                      dbo.LP_YEAR_MTH_DATE((SELECT top 1 DC_PURCHCONNECTIONLINE.DLVDATE
											FROM         DC_PURCHCONNECTIONLINE 
											WHERE DC_PURCHCONNECTIONLINE.DATAAREAID = PURCHTABLE.DATAAREAID AND 
											DC_PURCHCONNECTIONLINE.DC_CONNECTIONID = PURCHTABLE.DC_CONNECTIONID AND 
											DC_PURCHCONNECTIONLINE.INVENTLOCATIONID = PURCHTABLE.INVENTLOCATIONID)) as DlvDate,
                      dbo.LP_YEAR_MTH     ((SELECT top 1    DC_PURCHCONNECTIONLINE.DLVDATE
											FROM         DC_PURCHCONNECTIONLINE 
											WHERE DC_PURCHCONNECTIONLINE.DATAAREAID = PURCHTABLE.DATAAREAID AND 
											DC_PURCHCONNECTIONLINE.DC_CONNECTIONID = PURCHTABLE.DC_CONNECTIONID AND 
											DC_PURCHCONNECTIONLINE.INVENTLOCATIONID = PURCHTABLE.INVENTLOCATIONID)) as DlvMth,
                      dbo.INVENTTABLE.ITEMID+' '+dbo.INVENTTABLE.ITEMNAME as Item, 
                      dbo.INVENTTABLE.ITEMGROUPID+' '+INVENTITEMGROUP.NAME AS ITEMGROUPID, 
                      left(dbo.INVENTTABLE.ITEMGROUPID,2) as ItemMainGrp, 
                      dbo.INVENTTABLE.DC_INVENTASSORTMENTID, 
                      dbo.INVENTTABLE.DC_INVENTCATEGORY, 
                      case dbo.PURCHLINE.PURCHSTATUS when 1 then 'Aaben ordre' 
													 when 2 then 'Modtaget' 
													 when 3 then 'Fakturaopdateret' 
													 else 'Ingen Status'
					  end as PurchStatus, 
                      dbo.PURCHLINE.VENDGROUP, 
                      dbo.LP_DECIMAL(dbo.PURCHLINE.PURCHQTY) as PurchQty, 
                      dbo.LP_DECIMAL(dbo.PURCHLINE.LINEAMOUNT) as LINEAMOUNT,
                      dbo.PURCHLINE.PURCHQTY as NumPurchQty,
                      dbo.PURCHLINE.LINEAMOUNT as NumLineAmount
                      
                      
FROM         dbo.PURCHLINE INNER JOIN
                      dbo.PURCHTABLE ON dbo.PURCHLINE.PURCHID = dbo.PURCHTABLE.PURCHID AND dbo.PURCHLINE.DATAAREAID = dbo.PURCHTABLE.DATAAREAID INNER JOIN
                      dbo.INVENTTABLE ON dbo.PURCHLINE.ITEMID = dbo.INVENTTABLE.ITEMID AND dbo.PURCHLINE.DATAAREAID = dbo.INVENTTABLE.DATAAREAID INNER JOIN
                      dbo.VENDTABLE ON dbo.PURCHLINE.DATAAREAID = dbo.VENDTABLE.DATAAREAID AND 
                      dbo.PURCHTABLE.ORDERACCOUNT = dbo.VENDTABLE.ACCOUNTNUM INNER JOIN
                      dbo.INVENTITEMGROUP ON dbo.PURCHLINE.DATAAREAID = dbo.INVENTITEMGROUP.DATAAREAID AND 
                      dbo.INVENTTABLE.ITEMGROUPID = dbo.INVENTITEMGROUP.ITEMGROUPID

GO

/*
EXEC master.dbo.sp_configure 'show advanced options', 1
RECONFIGURE
EXEC master.dbo.sp_configure 'xp_cmdshell', 1
RECONFIGURE 

drop table LP_PurchLine
select * into LP_PurchLine from devsql.[AX40SP2_KNI_UDV2].dbo.LP_PurchLineStat
EXEC xp_cmdshell 'bcp "SELECT * FROM [AX40SP2_KNI_UDV2].dbo.LP_PurchLine" queryout "C:\LP_PurchLineStat2.txt" -T -c -t§' 
*/