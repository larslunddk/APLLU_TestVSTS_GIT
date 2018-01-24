-- FUNCTION, der returnerer en sammensat v�rdi s�fremt 1.variable er <> '' - alle andre tilf�lde bibeholdes v�rdien.
-- Funktionen kan anvendes i alle opdateringsk�rsler hvor feltet kun skal opdateres hvis f�rste felt
-- er forskellig fra blank (eks. ItemId = ItemId + ' ' + RouteId skal kun gennemf�res hvis ItemId <> ''
use widsql3_cit_1
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetItemRouteId]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
 DROP FUNCTION [dbo].[SetItemRouteId];
GO
CREATE FUNCTION SetCombination (@RouteId varchar(100), @Config varchar(100)) Returns varchar(100) AS
BEGIN
 DECLARE @OutputRouteId varchar(100)
 SELECT @OutputRouteId = CASE WHEN @RouteId <> '' THEN @RouteId + ' ' + @Config ELSE @RouteId END;
 Return @OutputRouteId;
END


-- START P� TESTCASE
-- Visning af et par records og deres indhold
select a.itemid, a.startdate, a.active, a.itemrouteid, a.inventdimid, b.configid 
 from forecastsales a, inventdim b
 where a.inventdimid = b.inventdimid
 AND   a.recid >= 222258
 AND   a.recid <= 222260

-- Opdatering af record 1
update forecastsales set itemrouteid = dbo.SetItemRouteId('aaa','bbb')
 where recid = 222258
go
-- opdatering af record 2
update forecastsales set itemrouteid = dbo.SetItemRouteId('','ccc')
 where recid = 222259
GO

-- SLUT P� TESTCASE


-- INVENTTRANS TESTK�RSEL for at se om vi f�r de rigtige data ud af funktionen.
select top 20 inventtrans.recid, InventTrans.ItemId, InventTrans.InventDimId, InventDim.configid,
  dbo.SetCombination([ItemId],[InventDim].[ConfigId]) as [ItemId Config],
  dbo.SetCombination([ItemRouteId],[InventDim].[ConfigId]) as [RouteId ConfigId]
 from InventTrans inner join inventdim
 on Inventtrans.dataareaid = 'wid'
 and   Inventtrans.itemid <> ''
 and   Inventtrans.inventdimid = inventdim.inventdimid
 and   inventdim.dataareaid = 'wid'
 and   inventdim.configid <> ''


--INVENTTRANS Egentlig opdateringsk�rsel - er ikke aftestet.
UPDATE [InventTrans] 
 SET [ItemId]  = dbo.SetCombination([ItemId],[InventDim].[ConfigId]),
  [ItemRouteId] = dbo.SetCombination([ItemRouteId],[InventDim].[ConfigId]), 
 from [InventTrans] inner join [InventDim]  
 on [InventTrans].[DATAAREAID] = 'wid' 
 AND [InventTrans].[ItemId] <> '' 
 AND [InventDim].[InventDimId] = [InventTrans].[InventDimId] 
 AND [InventDim].[DATAAREAID] = 'wid' 
 AND [InventDim].[configId] <> ''




No virus found in this incoming message.
Checked by AVG Free Edition.
Version: 7.5.516 / Virus Database: 269.21.3/1306 - Release Date: 01-03-2008 17:41

