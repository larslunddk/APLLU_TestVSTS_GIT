-- Eliminate dublicated Recs
--  INVENTTABLE ***** opdatere RecId endnu en gang for alle dem der allerede eksisterer
use widsql3_cit_udv
Exec dbo.LogProgressInfo ' Step 4 - Eliminate dublicated records startet','Step4',1
SET NOCOUNT ON
exec dropview 'InventTableShadow_Tmp1'
go
create view InventTableShadow_Tmp1 as 
	select InventTableShadow.recid FROM         dbo.INVENTTABLE INNER JOIN InventTableShadow 
		ON  dbo.INVENTTABLE.RECID = InventTableShadow.RECID 
		AND dbo.INVENTTABLE.DATAAREAID = InventTableShadow.DATAAREAID
		and dbo.inventtable.dataareaid = 'wid'
GO
--select * from InventTableShadow_Tmp1 
Declare @Count int
Declare @NewRecId   as int
select @Count = (SELECT     count(*)			
	FROM         dbo.INVENTTABLE INNER JOIN InventTableShadow 
	ON  dbo.INVENTTABLE.RECID = InventTableShadow.RECID 
	AND dbo.INVENTTABLE.DATAAREAID = InventTableShadow.DATAAREAID);

UPDATE dbo.SystemSequences SET @NewRecid  = NextVal, NextVal    = NextVal + @Count
			WHERE ID = -1 AND TABID = 0 AND Dataareaid = 'wid';

update dbo.InventTableShadow_Tmp1 set @NewRecid = @NewRecid + 1,
				 recid = @NewRecid
GO	
		
--  INVENTTABLEMODULE ***** opdatere RecId endnu en gang for alle dem der allerede eksisterer
exec dropview 'InventTableModuleShadow_Tmp1'
go
create view InventTableModuleShadow_Tmp1 as 
	select InventTableModuleShadow.recid FROM         dbo.INVENTTABLEMODULE INNER JOIN InventTableModuleShadow 
		ON  dbo.INVENTTABLEMODULE.RECID = InventTableModuleShadow.RECID 
		AND dbo.INVENTTABLEMODULE.DATAAREAID = InventTableModuleShadow.DATAAREAID
		and dbo.inventtableMODULE.dataareaid = 'wid'
GO
--select * from InventTableShadow_Tmp1 
Declare @Count int
Declare @NewRecId   as int
select @Count = (SELECT     count(*)			
	FROM         dbo.INVENTTABLEMODULE INNER JOIN InventTableModuleShadow
	ON  dbo.INVENTTABLEMODULE.RECID = InventTableModuleShadow.RECID 
	AND dbo.INVENTTABLEMODULE.DATAAREAID = InventTableModuleShadow.DATAAREAID);

UPDATE dbo.SystemSequences SET @NewRecid  = NextVal, NextVal    = NextVal + @Count
			WHERE ID = -1 AND TABID = 0 AND Dataareaid = 'wid';

update dbo.InventTableModuleShadow_Tmp1 set @NewRecid = @NewRecid + 1,
				 recid = @NewRecid
GO	
	
--  INVENTITEMLOCATION ***** opdatere RecId endnu en gang for alle dem der allerede eksisterer
exec dropview 'InventItemLocationShadow_Tmp1'
go
create view InventItemLocationShadow_Tmp1 as 
	select InventItemLocationShadow.recid FROM         dbo.InventItemLocation INNER JOIN InventItemLocationShadow 
		ON  dbo.InventItemLocation.RECID = InventItemLocationShadow.RECID 
		AND dbo.InventItemLocation.DATAAREAID = InventItemLocationShadow.DATAAREAID
		and dbo.InventItemLocation.dataareaid = 'wid'
GO
--select * from InventTableShadow_Tmp1 
Declare @Count int
Declare @NewRecId   as int
select @Count = (SELECT     count(*)			
	FROM         dbo.InventItemLocation INNER JOIN InventItemLocationShadow
	ON  dbo.InventItemLocation.RECID = InventItemLocationShadow.RECID 
	AND dbo.InventItemLocation.DATAAREAID = InventItemLocationShadow.DATAAREAID);

UPDATE dbo.SystemSequences SET @NewRecid  = NextVal, NextVal    = NextVal + @Count
			WHERE ID = -1 AND TABID = 0 AND Dataareaid = 'wid';

update dbo.InventItemLocationShadow_Tmp1 set @NewRecid = @NewRecid + 1,
				 recid = @NewRecid
GO	
Exec dbo.LogProgressInfo ' Step 4 - Eliminate dublicated records afsluttet','Step4',2

/*
--  INVENTBATCH ***** opdatere RecId endnu en gang for alle dem der allerede eksisterer
exec dropview 'INVENTBATCHShadow_Tmp1'
go
create view INVENTBATCHShadow_Tmp1 as 
	select InventBatchShadow.recid FROM         dbo.InventBatch INNER JOIN InventBatchShadow 
		ON  dbo.InventBatch.RECID = InventBatchShadow.RECID 
		AND dbo.InventBatch.DATAAREAID = InventBatchShadow.DATAAREAID
		and dbo.InventBatch.dataareaid = 'wid'
GO
--select * from InventTableShadow_Tmp1 
Declare @Count int
Declare @NewRecId   as int
select @Count = (SELECT     count(*)			
	FROM         dbo.InventBatch INNER JOIN InventBatchShadow
	ON  dbo.InventBatch.RECID = InventBatchShadow.RECID 
	AND dbo.InventBatch.DATAAREAID = InventBatchShadow.DATAAREAID);

UPDATE dbo.SystemSequences SET @NewRecid  = NextVal, NextVal    = NextVal + @Count
			WHERE ID = -1 AND TABID = 0 AND Dataareaid = 'wid';

update dbo.InventBatchShadow_Tmp1 set @NewRecid = @NewRecid + 1,
				 recid = @NewRecid
GO			
*/