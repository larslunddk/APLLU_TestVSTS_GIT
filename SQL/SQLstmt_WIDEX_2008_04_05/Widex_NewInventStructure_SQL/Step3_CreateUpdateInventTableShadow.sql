-- =============================================
-- Author:		Lars Lund
-- Create date: 2008.03.12
-- Description:	Widex - Create a flatstructure InventTable where a combination of ItemID and ConfigId generates a new Item
-- =============================================

-- **********************************************************************************************************
-- **************INVENTTABLE*********************************************************************************
-- **********************************************************************************************************
use widsql3_cit_udv
SET NOCOUNT ON
Exec dbo.LogProgressInfo ' Step3 Create shadow tabeller startet','Step3',1
exec droptable 'inventtableshadow'
SELECT     
					INVENTTABLE.ITEMGROUPID, INVENTTABLE.ITEMID+' '+INVENTDIMCOMBINATION.CONFIGID as ITEMID, INVENTTABLE.ITEMNAME, INVENTTABLE.ITEMTYPE, INVENTTABLE.PURCHMODEL, 
                      INVENTTABLE.HEIGHT, INVENTTABLE.WIDTH, INVENTTABLE.SALESMODEL, INVENTTABLE.COSTGROUPID, INVENTTABLE.REQGROUPID, 
                      INVENTTABLE.PRIMARYVENDORID, INVENTTABLE.NETWEIGHT, INVENTTABLE.DEPTH, INVENTTABLE.UNITVOLUME, INVENTTABLE.BOMUNITID, 
                      INVENTTABLE.DENSITY, INVENTTABLE.DEL_SCRAPTYPEID, INVENTTABLE.DIMENSION, INVENTTABLE.DIMENSION2_, INVENTTABLE.DIMENSION3_, 
                      INVENTTABLE.COSTMODEL, INVENTTABLE.USEALTITEMID, INVENTTABLE.ALTITEMID, INVENTTABLE.INTRACODE, 
                      INVENTTABLE.BOMMANUALCONSUMP, INVENTTABLE.BOMMANUALRECEIPT, INVENTTABLE.STOPEXPLODE, 
                      INVENTTABLE.DEL_COVPERINVENTLOCATION, INVENTTABLE.PHANTOM, INVENTTABLE.INTRAUNIT, INVENTTABLE.BOMLEVEL, 
                      INVENTTABLE.BATCHNUMGROUPID, INVENTTABLE.AUTOREPORTFINISHED, INVENTTABLE.ORIGCOUNTRYID, INVENTTABLE.STATISTICSFACTOR, 
                      INVENTTABLE.ALTCONFIGID, INVENTTABLE.STANDARDCONFIGID, INVENTTABLE.DEL_CONFIGACTIVE, INVENTTABLE.PRODPOOLID, 
                      INVENTTABLE.PROPERTYID, INVENTTABLE.ABCTIEUP, INVENTTABLE.ABCREVENUE, INVENTTABLE.ABCVALUE, 
                      INVENTTABLE.ABCCONTRIBUTIONMARGIN, INVENTTABLE.COMMISSIONGROUPID, INVENTTABLE.DEL_BARCODE, 
                      INVENTTABLE.DEL_BARCODETYPE, INVENTTABLE.CONFIGURABLE, INVENTTABLE.SALESPERCENTMARKUP, 
                      INVENTTABLE.SALESCONTRIBUTIONRATIO, INVENTTABLE.SALESPRICEMODELBASIC, INVENTTABLE.MINAVERAGESETTLE, 
                      INVENTTABLE.NAMEALIAS, INVENTTABLE.PRODGROUPID, INVENTTABLE.PROJCATEGORYID, INVENTTABLE.GROSSDEPTH, 
                      INVENTTABLE.GROSSWIDTH, INVENTTABLE.GROSSHEIGHT, INVENTTABLE.STANDARDPALLETQUANTITY, INVENTTABLE.QTYPERLAYER, 
                      INVENTTABLE.SORTCODE, INVENTTABLE.CONFIGSIMILAR, INVENTTABLE.SERIALNUMGROUPID, INVENTTABLE.DIMGROUPID, 
                      INVENTTABLE.MODELGROUPID, INVENTTABLE.ITEMBUYERGROUPID, INVENTTABLE.TAXPACKAGINGQTY, INVENTTABLE.DEL_TEMPLATE, 
                      INVENTTABLE.WMSPALLETTYPEID, INVENTTABLE.ORIGSTATEID, INVENTTABLE.STOPEXPLODEPRICE, INVENTTABLE.WMSPICKINGQTYTIME, 
                      INVENTTABLE.TARAWEIGHT, INVENTTABLE.PACKAGINGGROUPID, INVENTTABLE.SCRAPVAR, INVENTTABLE.SCRAPCONST, 
                      INVENTTABLE.STANDARDINVENTCOLORID, INVENTTABLE.STANDARDINVENTSIZEID, INVENTTABLE.ITEMDIMCOMBINATIONAUTOCREATE, 
                      INVENTTABLE.ITEMDIMCOSTPRICE, INVENTTABLE.ALTINVENTSIZEID, INVENTTABLE.ALTINVENTCOLORID, INVENTTABLE.ITEMIDMASKED_WDX, 
                      INVENTTABLE.HEADTYPE_WID, INVENTTABLE.STATISTIKID_WID, INVENTTABLE.STATISTIKID2_WID, INVENTTABLE.PRODLOCATIONID, 
                      INVENTTABLE.PRODUCTTYPEID_EMS, INVENTTABLE.MASTERITEMID_EMS, INVENTTABLE.MASTERITEM_EMS, 
                      INVENTTABLE.INVENTPROJECTID_WDX, INVENTTABLE.DEFAULTCONFIGID_EMS, INVENTTABLE.SERIALNUMCHECKGROUPID, 
                      INVENTTABLE.CEVERSION_WDX, INVENTTABLE.MODIFIEDDATE, INVENTTABLE.MODIFIEDTIME, INVENTTABLE.MODIFIEDBY, 
                      INVENTTABLE.CREATEDDATE, INVENTTABLE.CREATEDTIME, INVENTTABLE.DATAAREAID, 
                      INVENTTABLE.TECHNICALDESCRIPTION, 
						InventDimCombination.BlockedForBiz_WDX as BLOCKEDFORBIZ_WDX, 
						InventDimCombination.BlockedForEtona_WDX as BLOCKEDFORETONA_WDX, 
						InventDimCombination.InventStatus as INVENTSTATUS, 
						InventDimCombination.DateExpected as DATEEXPECTED, 
						InventTable.ItemId as ITEMIDMASTER, 
					  INVENTTABLE.CREATEDBY,
					  999999999 AS RECID
INTO		InventTableShadow
FROM         INVENTTABLE INNER JOIN
                      INVENTDIMCOMBINATION ON INVENTTABLE.ITEMID = INVENTDIMCOMBINATION.ITEMID 
			AND INVENTDIMCOMBINATION.DATAAREAID = INVENTTABLE.DATAAREAID
			AND INVENTDIMCOMBINATION.CONFIGID <> ''
			AND INVENTDIMCOMBINATION.DATAAREAID = 'wid'
GO

Declare @NewRecId   as int
declare @count		as int
select @Count = count(*) from inventTableShadow

		-- Update systemSeq - DO NOT UPDATE UNTIL REAL LIFE
		UPDATE dbo.SystemSequences
			SET    @NewRecid  = NextVal,
					NextVal    = NextVal + @Count
			WHERE ID = -1 AND TABID = 0 AND Dataareaid = 'wid'	
		

-- ONLY Simulation
--SELECT @NewRecid  = cast((select NextVal from dbo.SystemSequences WHERE ID = -1 AND TABID = 0 AND Dataareaid = 'wid') as int);
update dbo.inventTableShadow set @NewRecid = @NewRecid + 1,
				 recid = @NewRecid; --cast(@NewRecid as varchar(11));
Exec dbo.LogProgressInfo ' Temp inventTableShadow dannet - Slut: '
-- **********************************************************************************************************
-- **************INVENTTABLEMODULE***************************************************************************
-- **********************************************************************************************************

exec droptable 'InventTableModuleShadow'
SELECT     INVENTTABLEMODULE.ITEMID+' '+INVENTDIMCOMBINATION.CONFIGID as ITEMID, 
					  INVENTTABLEMODULE.MODULETYPE, INVENTTABLEMODULE.UNITID, 
						InventDimCombination.CostPrice AS PRICE, 
						InventDimCombination.PriceUnit AS PRICEUNIT, 
						InventDimCombination.Markup AS MARKUP, 
					  INVENTTABLEMODULE.LINEDISC, INVENTTABLEMODULE.MULTILINEDISC, INVENTTABLEMODULE.ENDDISC,INVENTTABLEMODULE.SUPPITEMGROUPID,  
					  INVENTTABLEMODULE.QUANTITY, INVENTTABLEMODULE.LOWESTQTY, INVENTTABLEMODULE.HIGHESTQTY, 
                      INVENTTABLEMODULE.TAXITEMGROUPID, INVENTTABLEMODULE.BLOCKED, INVENTTABLEMODULE.DELIVERYTIME, 
                      INVENTTABLEMODULE.INVENTLOCATIONID, INVENTTABLEMODULE.STANDARDQTY, INVENTTABLEMODULE.MARKUPGROUPID, 
						InventDimCombination.PriceDate AS PRICEDATE, 
						InventDimCombination.PriceQty AS PRICEQTY, 
						InventDimCombination.AllocateMarkup AS ALLOCATEMARKUP, 
                      INVENTTABLEMODULE.OVERDELIVERYPCT, INVENTTABLEMODULE.UNDERDELIVERYPCT, 
                      INVENTTABLEMODULE.CALENDARDAYS, replicate(' ',17)+'417' AS INVENTDIMID_WDX, INVENTTABLEMODULE.DATAAREAID, 
                      999999999 AS RECID, INVENTTABLEMODULE.MANDATORYINVENTLOCATION
INTO		InventTableModuleShadow
FROM         INVENTTABLEMODULE 
		INNER JOIN INVENTDIMCOMBINATION ON 
			    INVENTTABLEMODULE.ITEMID = INVENTDIMCOMBINATION.ITEMID
			AND INVENTTABLEMODULE.ModuleType = 0 -- ModuleInventPurchSales::Invent
			AND INVENTDIMCOMBINATION.CONFIGID <> ''
			AND INVENTDIMCOMBINATION.InventDimId_WDX = INVENTTABLEMODULE.InventDimId_WDX
			AND INVENTDIMCOMBINATION.DATAAREAID = INVENTTABLEMODULE.DATAAREAID
			AND INVENTDIMCOMBINATION.DATAAREAID = 'wid'
GO
exec dropview 'InventTableModule_MainItemView'
GO
create view InventTableModule_MainItemView as
	SELECT INVENTTABLEMODULE.ITEMID+' '+INVENTDIMCOMBINATION.CONFIGID as ITEMID,
		   INVENTTABLEMODULE.ModuleType,
			inventtablemodule.LINEDISC, inventtablemodule.MULTILINEDISC, inventtablemodule.ENDDISC, inventtablemodule.SUPPITEMGROUPID 
	from inventtablemodule
		INNER JOIN INVENTDIMCOMBINATION ON 
			    INVENTTABLEMODULE.ITEMID = INVENTDIMCOMBINATION.ITEMID
			--AND INVENTTABLEMODULE.ModuleType = 0 -- ModuleInventPurchSales::Invent
			AND INVENTDIMCOMBINATION.CONFIGID <> ''
			AND INVENTTABLEMODULE.InventDimId_WDX = replicate(' ',17)+'417'
			AND INVENTTABLEMODULE.DATAAREAID = 'wid'
GO


--  *****************************Insert InventTableModule med typen ::Invent afsluttet
--  *****************************Insert herefter InventTableModule med typen at andet end ::Invent
--  *****************************Her er vi n�dt til at danne et view og insert into, da tabellen allerede eksisterer
exec dropview 'InventTableModule_TmpView'
GO
Create View InventTableModule_TmpView as
	SELECT    INVENTTABLEMODULE.ITEMID+' '+INVENTDIMCOMBINATION.CONFIGID as ITEMID, 
					  INVENTTABLEMODULE.MODULETYPE, INVENTTABLEMODULE.UNITID, 
						INVENTTABLEMODULE.PRICE, 
						INVENTTABLEMODULE.PRICEUNIT, 
						INVENTTABLEMODULE.MARKUP, 
					  INVENTTABLEMODULE.LINEDISC, INVENTTABLEMODULE.MULTILINEDISC, 
                      INVENTTABLEMODULE.ENDDISC, INVENTTABLEMODULE.QUANTITY, INVENTTABLEMODULE.LOWESTQTY, INVENTTABLEMODULE.HIGHESTQTY, 
                      INVENTTABLEMODULE.TAXITEMGROUPID, INVENTTABLEMODULE.BLOCKED, INVENTTABLEMODULE.DELIVERYTIME, 
                      INVENTTABLEMODULE.INVENTLOCATIONID, INVENTTABLEMODULE.STANDARDQTY, INVENTTABLEMODULE.MARKUPGROUPID, 
						INVENTTABLEMODULE.PRICEDATE, 
						INVENTTABLEMODULE.PRICEQTY, 
						INVENTTABLEMODULE.ALLOCATEMARKUP, 
                      INVENTTABLEMODULE.OVERDELIVERYPCT, INVENTTABLEMODULE.UNDERDELIVERYPCT, INVENTTABLEMODULE.SUPPITEMGROUPID, 
                      INVENTTABLEMODULE.CALENDARDAYS, replicate(' ',17)+'417' AS INVENTDIMID_WDX, INVENTTABLEMODULE.DATAAREAID, 
                      999999999 AS RECID, INVENTTABLEMODULE.MANDATORYINVENTLOCATION
		FROM         INVENTTABLEMODULE INNER JOIN
                      INVENTDIMCOMBINATION ON 
			    INVENTTABLEMODULE.ITEMID = INVENTDIMCOMBINATION.ITEMID
			AND INVENTTABLEMODULE.ModuleType <> 0 -- ModuleInventPurchSales::Invent
			AND INVENTDIMCOMBINATION.CONFIGID <> ''
			AND INVENTDIMCOMBINATION.InventDimId_WDX = INVENTTABLEMODULE.InventDimId_WDX
			AND INVENTDIMCOMBINATION.DATAAREAID = INVENTTABLEMODULE.DATAAREAID
			AND INVENTDIMCOMBINATION.DATAAREAID = 'wid'

--  *****************************View er dannet - s� kan vi inds�tte
GO
INSERT INTO [dbo].[InventTableModuleShadow]
			(ITEMID, MODULETYPE, UNITID, PRICE, PRICEUNIT, MARKUP, LINEDISC, MULTILINEDISC, ENDDISC, QUANTITY, LOWESTQTY, HIGHESTQTY,
			TAXITEMGROUPID, BLOCKED, DELIVERYTIME, INVENTLOCATIONID, STANDARDQTY, MARKUPGROUPID, PRICEDATE, PRICEQTY,
			ALLOCATEMARKUP, OVERDELIVERYPCT, UNDERDELIVERYPCT, SUPPITEMGROUPID,
			CALENDARDAYS, INVENTDIMID_WDX, DATAAREAID, RECID, MANDATORYINVENTLOCATION)
	SELECT    ITEMID, MODULETYPE, UNITID, PRICE, PRICEUNIT, MARKUP, LINEDISC, MULTILINEDISC, ENDDISC, QUANTITY, LOWESTQTY, HIGHESTQTY,
			TAXITEMGROUPID, BLOCKED, DELIVERYTIME, INVENTLOCATIONID, STANDARDQTY, MARKUPGROUPID, PRICEDATE, PRICEQTY,
			ALLOCATEMARKUP, OVERDELIVERYPCT, UNDERDELIVERYPCT, SUPPITEMGROUPID,
			CALENDARDAYS, replicate(' ',17)+'417' /*INVENTDIMID_WDX*/, DATAAREAID, RECID, MANDATORYINVENTLOCATION
	FROM         InventTableModule_TmpView
	
--  *****************************Insert InventTableModule med typen alt andet end ::Invent afsluttet
--GO
--update InventTableModuleShadow set inventdimid_wdx = replicate(' ',17)+'417'
--	where inventdimid_wdx = '417'
GO
Declare @NewRecId   as int
declare @count		as int
select @Count = count(*) from InventTableModuleShadow
		-- Update systemSeq - DO NOT UPDATE UNTIL REAL LIFE
		UPDATE dbo.SystemSequences
			SET    @NewRecid  = NextVal,
					NextVal    = NextVal + @Count
			WHERE ID = -1 AND TABID = 0 AND Dataareaid = 'wid'	

-- ONLY Simulation
--SELECT @NewRecid  = cast((select NextVal from dbo.SystemSequences WHERE ID = -1 AND TABID = 0 AND Dataareaid = 'wid') as int);

update dbo.InventTableModuleShadow set @NewRecid = @NewRecid + 1,
				 recid = @NewRecid; --cast(@NewRecid as varchar(11));
GO
-- Opdater LINEDISC, MULTILINEDISC, ENDDISC, SUPPITEMGROUPID from MainInventTableModule (uden variant).
update InventTableModuleShadow 
	set 	LINEDISC		= ITMMain.LINEDISC,
			MULTILINEDISC	= ITMMain.MULTILINEDISC,
			ENDDISC			= ITMMain.ENDDISC,
			SUPPITEMGROUPID	= ITMMain.SUPPITEMGROUPID
	from InventTableModule_MainItemView ITMMain
		where	ITMMain.ItemId = InventTableModuleShadow.ItemId
		and		ITMMain.ModuleType = InventTableModuleShadow.ModuleType;
GO
Exec dbo.LogProgressInfo ' Temp InventTableModuleShadow dannet - Slut: '

-- **********************************************************************************************************
-- **************INVENTITEMLOCATION***************************************************************************
-- **********************************************************************************************************
exec droptable 'inventitemlocationShadow'
SELECT     INVENTITEMLOCATION.ITEMID+' '+INVENTDIMCOMBINATION.CONFIGID as ITEMID, 999999999 AS RECID, INVENTITEMLOCATION.DATAAREAID, 
                      INVENTITEMLOCATION.PICKINGLOCATIONREFILLMIN, INVENTITEMLOCATION.USEWMSORDER, INVENTITEMLOCATION.INVENTDIMID, 
                      INVENTITEMLOCATION.WMSLOCATIONIDDEFAULTRECEIPT, INVENTITEMLOCATION.WMSLOCATIONIDDEFAULTISSUE, 
                      INVENTITEMLOCATION.COUNTINGJOURNALID, INVENTITEMLOCATION.COUNTINGSTARTED, INVENTITEMLOCATION.WMSPICKINGLOCATION, 
                      INVENTITEMLOCATION.WMSSTOREZONEID, INVENTITEMLOCATION.DEL_DELIVERYTIME, INVENTITEMLOCATION.DEL_MAXINVENTONHAND, 
                      INVENTITEMLOCATION.DEL_MININVENTONHAND, INVENTITEMLOCATION.DEL_COVPERIOD, INVENTITEMLOCATION.DEL_COVRULE, 
                      INVENTITEMLOCATION.DEL_INVENTLOCATIONID, INVENTITEMLOCATION.DEL_CONFIGID, INVENTITEMLOCATION.COUNTGROUPID, 
                      'larslund' as CONFIGID --INVENTDIMCOMBINATION.CONFIGID
INTO	   inventitemlocationShadow
FROM         INVENTITEMLOCATION INNER JOIN
                      INVENTDIMCOMBINATION ON 
				INVENTITEMLOCATION.ITEMID = INVENTDIMCOMBINATION.ITEMID
			AND INVENTITEMLOCATION.INVENTDIMID = replicate(' ',17)+'417'
			AND INVENTDIMCOMBINATION.CONFIGID <> ''
			AND INVENTDIMCOMBINATION.DATAAREAID = INVENTITEMLOCATION.DATAAREAID
			AND INVENTDIMCOMBINATION.DATAAREAID = 'wid'
GO
Declare @NewRecId   as int
declare @count		as int
select @Count = count(*) from inventitemlocationShadow
		-- Update systemSeq - DO NOT UPDATE UNTIL REAL LIFE
		UPDATE dbo.SystemSequences
			SET    @NewRecid  = NextVal,
					NextVal    = NextVal + @Count
			WHERE ID = -1 AND TABID = 0 AND Dataareaid = 'wid'	
		

-- ONLY Simulation
-- SELECT @NewRecid  = cast((select NextVal from dbo.SystemSequences WHERE ID = -1 AND TABID = 0 AND Dataareaid = 'wid') as int); 

update dbo.inventitemlocationShadow set @NewRecid = @NewRecid + 1,
				 recid = @NewRecid; --cast(@NewRecid as varchar(11));
GO
Exec dbo.LogProgressInfo ' Temp inventitemlocationShadow dannet - Slut: '

-- **********************************************************************************************************
-- **************UNITCONVERT*********************************************************************************
-- **********************************************************************************************************
exec droptable 'UnitConvertShadow'
SELECT     UNITCONVERT.FROMUNIT, UNITCONVERT.TOUNIT, UNITCONVERT.FACTOR, UNITCONVERT.ROUNDOFF, UNITCONVERT.ITEMID+' '+INVENTDIMCOMBINATION.CONFIGID as ITEMID, 
                      UNITCONVERT.DATAAREAID, 999999999 AS RECID, UNITCONVERT.MARKUP, INVENTDIMCOMBINATION.CONFIGID
INTO UnitConvertShadow
FROM         UNITCONVERT INNER JOIN
                      INVENTDIMCOMBINATION ON UNITCONVERT.ITEMID = INVENTDIMCOMBINATION.ITEMID
			AND INVENTDIMCOMBINATION.DATAAREAID = UNITCONVERT.DATAAREAID
			AND INVENTDIMCOMBINATION.DATAAREAID = 'wid'
GO
Declare @NewRecId   as int
declare @count		as int
select @Count = count(*) from UnitConvertShadow
		-- Update systemSeq - DO NOT UPDATE UNTIL REAL LIFE
		UPDATE dbo.SystemSequences
			SET    @NewRecid  = NextVal,
					NextVal    = NextVal + @Count
			WHERE ID = -1 AND TABID = 0 AND Dataareaid = 'wid'	
		

-- ONLY Simulation
-- SELECT @NewRecid  = cast((select NextVal from dbo.SystemSequences WHERE ID = -1 AND TABID = 0 AND Dataareaid = 'wid') as int); 

update dbo.UnitConvertShadow set @NewRecid = @NewRecid + 1,
				 recid = @NewRecid; --cast(@NewRecid as varchar(11));
GO
Exec dbo.LogProgressInfo  ' Temp UnitConvertShadow dannet - Slut: '
Exec dbo.LogProgressInfo ' Step3 Create shadow tabeller afsluttet','Step3',2

/*
select count(*) from inventtableshadow
select count(*) from inventtablemoduleshadow
select count(*) from inventitemlocationshadow
select count(*) from UnitConvertShadow
*/