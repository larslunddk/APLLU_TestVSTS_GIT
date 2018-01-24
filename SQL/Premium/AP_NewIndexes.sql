USE [AxProd]
GO
CREATE NONCLUSTERED INDEX MSINDEX1
ON [dbo].[PRICEDISCTABLE] ([INVENTDIMID],[DATAAREAID],[PARTITION])
GO
USE [AxProd]
GO
CREATE NONCLUSTERED INDEX MSINDEX2
ON [dbo].[INVENTDIMCOMBINATION] ([INVENTDIMID],[DATAAREAID],[PARTITION])
GO
USE [AxProd]
GO
CREATE NONCLUSTERED INDEX MSINDEX3
ON [dbo].[RETAILINVENTAVAILABILITY] ([INVENTDIMRECID],[PARTITION])
GO

USE [AxProd]
GO
CREATE NONCLUSTERED INDEX MSINDEX4
ON [dbo].[WMSJOURNALTRANS] ([ITEMID],[DATAAREAID],[PARTITION])
GO
USE [AxProd]
GO
CREATE NONCLUSTERED INDEX MSINDEX5
ON [dbo].[INVENTTABLE] ([PRODUCT],[PARTITION])
GO
USE [AxProd]
GO
CREATE NONCLUSTERED INDEX MSINDEX6
ON [dbo].[AP_EDIPRICAT] ([ISCONCESSION],[VENDACCOUNT],[DATAAREAID],[PARTITION])
GO
USE [AxProd]
GO
CREATE NONCLUSTERED INDEX MSINDEX7
ON [dbo].[INVENTTRANS] ([DATAAREAID],[PARTITION],[DATEPHYSICAL])
INCLUDE ([ITEMID],[QTY],[INVENTDIMID],[INVENTTRANSORIGIN])
GO
USE [AxProd]
GO
CREATE NONCLUSTERED INDEX MSINDEX8
ON [dbo].[INVENTTABLE] ([ITEMBUYERGROUPID],[DATAAREAID],[PARTITION],[BRANDNAME],[ITEMID])
GO
USE [AxProd]
GO
CREATE NONCLUSTERED INDEX MSINDEX9
ON [dbo].[INVENTTABLE] ([PRIMARYVENDORID],[DATAAREAID],[PARTITION],[ITEMTYPE],[ITEMBUYERGROUPID])
INCLUDE ([ITEMID])
GO

