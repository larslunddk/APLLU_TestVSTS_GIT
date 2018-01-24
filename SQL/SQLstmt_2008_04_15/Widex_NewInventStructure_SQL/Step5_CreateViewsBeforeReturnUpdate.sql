-- ==STEP 2===========================================
-- Author:		Lars Lund
-- Create date: 2008.03.12
-- Description:	Widex - Create views on shadow table - Must follow creation of shadowtablecreations
-- =============================================
use widsql3_cit_1
Exec dbo.LogProgressInfo ' Step5 Create Views startet','Step5',1
SET NOCOUNT ON
exec Dropview 'InventTableShadowView'
exec Dropview 'InventTableModuleShadowView'
exec Dropview 'InventItemLocationShadowView'
exec Dropview 'UnitConvertShadowView'
GO
Create View InventTableShadowView as
	  SELECT     InventTableShadow.ITEMGROUPID, InventTableShadow.RECID, InventTableShadow.CREATEDBY, InventTableShadow.ITEMIDMASTER, 
                      InventTableShadow.DATEEXPECTED, InventTableShadow.BLOCKEDFORETONA_WDX, InventTableShadow.BLOCKEDFORBIZ_WDX, 
                      InventTableShadow.TECHNICALDESCRIPTION, InventTableShadow.DATAAREAID, InventTableShadow.CREATEDTIME, 
                      InventTableShadow.CREATEDDATE, InventTableShadow.MODIFIEDBY, InventTableShadow.MODIFIEDTIME, InventTableShadow.MODIFIEDDATE, 
                      InventTableShadow.CEVERSION_WDX, InventTableShadow.SERIALNUMCHECKGROUPID, InventTableShadow.DEFAULTCONFIGID_EMS, 
                      InventTableShadow.INVENTPROJECTID_WDX, InventTableShadow.MASTERITEM_EMS, InventTableShadow.MASTERITEMID_EMS, 
                      InventTableShadow.PRODUCTTYPEID_EMS, InventTableShadow.PRODLOCATIONID, InventTableShadow.STATISTIKID2_WID, 
                      InventTableShadow.STATISTIKID_WID, InventTableShadow.HEADTYPE_WID, InventTableShadow.ITEMIDMASKED_WDX, 
                      InventTableShadow.ALTINVENTCOLORID, InventTableShadow.ALTINVENTSIZEID, InventTableShadow.ITEMDIMCOSTPRICE, 
                      InventTableShadow.ITEMDIMCOMBINATIONAUTOCREATE, InventTableShadow.STANDARDINVENTSIZEID, 
                      InventTableShadow.STANDARDINVENTCOLORID, InventTableShadow.SCRAPCONST, InventTableShadow.SCRAPVAR, 
                      InventTableShadow.PACKAGINGGROUPID, InventTableShadow.TARAWEIGHT, InventTableShadow.WMSPICKINGQTYTIME, 
                      InventTableShadow.STOPEXPLODEPRICE, InventTableShadow.ORIGSTATEID, InventTableShadow.WMSPALLETTYPEID, 
                      InventTableShadow.DEL_TEMPLATE, InventTableShadow.TAXPACKAGINGQTY, InventTableShadow.ITEMBUYERGROUPID, 
                      InventTableShadow.MODELGROUPID, InventTableShadow.DIMGROUPID, InventTableShadow.SERIALNUMGROUPID, 
                      InventTableShadow.CONFIGSIMILAR, InventTableShadow.SORTCODE, InventTableShadow.QTYPERLAYER, 
                      InventTableShadow.STANDARDPALLETQUANTITY, InventTableShadow.GROSSHEIGHT, InventTableShadow.GROSSWIDTH, 
                      InventTableShadow.GROSSDEPTH, InventTableShadow.PROJCATEGORYID, InventTableShadow.PRODGROUPID, InventTableShadow.NAMEALIAS, 
                      InventTableShadow.MINAVERAGESETTLE, InventTableShadow.SALESPRICEMODELBASIC, InventTableShadow.SALESCONTRIBUTIONRATIO, 
                      InventTableShadow.SALESPERCENTMARKUP, InventTableShadow.CONFIGURABLE, InventTableShadow.DEL_BARCODETYPE, 
                       'larslund' as DEL_BARCODE /*InventTableShadow.DEL_BARCODE*/, InventTableShadow.COMMISSIONGROUPID, InventTableShadow.ABCCONTRIBUTIONMARGIN, 
                      InventTableShadow.ABCVALUE, InventTableShadow.ABCREVENUE, InventTableShadow.ABCTIEUP, InventTableShadow.PROPERTYID, 
                      InventTableShadow.PRODPOOLID, InventTableShadow.DEL_CONFIGACTIVE, InventTableShadow.STANDARDCONFIGID, 
                      InventTableShadow.ALTCONFIGID, InventTableShadow.STATISTICSFACTOR, InventTableShadow.ORIGCOUNTRYID, 
                      InventTableShadow.AUTOREPORTFINISHED, InventTableShadow.BATCHNUMGROUPID, InventTableShadow.BOMLEVEL, 
                      InventTableShadow.INTRAUNIT, InventTableShadow.PHANTOM, InventTableShadow.DEL_COVPERINVENTLOCATION, 
                      InventTableShadow.STOPEXPLODE, InventTableShadow.BOMMANUALRECEIPT, InventTableShadow.BOMMANUALCONSUMP, 
                      InventTableShadow.INTRACODE, InventTableShadow.ALTITEMID, InventTableShadow.USEALTITEMID, InventTableShadow.COSTMODEL, 
                      InventTableShadow.DIMENSION3_, InventTableShadow.DIMENSION2_, InventTableShadow.DIMENSION, InventTableShadow.DEL_SCRAPTYPEID, 
                      InventTableShadow.DENSITY, InventTableShadow.BOMUNITID, InventTableShadow.UNITVOLUME, InventTableShadow.DEPTH, 
                      InventTableShadow.NETWEIGHT, InventTableShadow.PRIMARYVENDORID, InventTableShadow.REQGROUPID, InventTableShadow.COSTGROUPID, 
                      InventTableShadow.SALESMODEL, InventTableShadow.WIDTH, InventTableShadow.HEIGHT, InventTableShadow.PURCHMODEL, 
                      InventTableShadow.ITEMTYPE, InventTableShadow.ITEMNAME, InventTableShadow.ITEMID, InventTableShadow.INVENTSTATUS
	FROM         InventTableShadow
GO
Create View InventTableModuleShadowView as
	SELECT     InventTableModuleShadow.ITEMID, InventTableModuleShadow.MODULETYPE, InventTableModuleShadow.UNITID, InventTableModuleShadow.PRICE, 
                      InventTableModuleShadow.PRICEUNIT, InventTableModuleShadow.MARKUP, InventTableModuleShadow.LINEDISC, 
                      InventTableModuleShadow.MULTILINEDISC, InventTableModuleShadow.QUANTITY, InventTableModuleShadow.LOWESTQTY, 
                      InventTableModuleShadow.HIGHESTQTY, InventTableModuleShadow.TAXITEMGROUPID, InventTableModuleShadow.BLOCKED, 
                      InventTableModuleShadow.DELIVERYTIME, InventTableModuleShadow.INVENTLOCATIONID, InventTableModuleShadow.STANDARDQTY, 
                      InventTableModuleShadow.MARKUPGROUPID, InventTableModuleShadow.PRICEDATE, InventTableModuleShadow.PRICEQTY, 
                      InventTableModuleShadow.ALLOCATEMARKUP, InventTableModuleShadow.OVERDELIVERYPCT, InventTableModuleShadow.UNDERDELIVERYPCT, 
                      InventTableModuleShadow.SUPPITEMGROUPID, InventTableModuleShadow.CALENDARDAYS, InventTableModuleShadow.INVENTDIMID_WDX, 
                      InventTableModuleShadow.DATAAREAID, InventTableModuleShadow.RECID, InventTableModuleShadow.MANDATORYINVENTLOCATION, 
                      InventTableModuleShadow.ENDDISC
	FROM         InventTableModuleShadow 
GO
Create View InventItemLocationShadowView as
	SELECT     inventitemlocationShadow.ITEMID, inventitemlocationShadow.RECID, inventitemlocationShadow.DATAAREAID, 
                      inventitemlocationShadow.PICKINGLOCATIONREFILLMIN, inventitemlocationShadow.USEWMSORDER, inventitemlocationShadow.INVENTDIMID, 
                      inventitemlocationShadow.WMSLOCATIONIDDEFAULTRECEIPT, inventitemlocationShadow.WMSLOCATIONIDDEFAULTISSUE, 
                      inventitemlocationShadow.COUNTINGJOURNALID, inventitemlocationShadow.COUNTINGSTARTED, inventitemlocationShadow.WMSPICKINGLOCATION, 
                      inventitemlocationShadow.WMSSTOREZONEID, inventitemlocationShadow.DEL_DELIVERYTIME, inventitemlocationShadow.DEL_MININVENTONHAND, 
                      inventitemlocationShadow.DEL_COVPERIOD, inventitemlocationShadow.DEL_COVRULE, inventitemlocationShadow.DEL_INVENTLOCATIONID, 
                      inventitemlocationShadow.DEL_CONFIGID, inventitemlocationShadow.COUNTGROUPID, inventitemlocationShadow.CONFIGID, 
                      inventitemlocationShadow.DEL_MAXINVENTONHAND
	FROM         inventitemlocationShadow 
GO
Create View UnitConvertShadowView as 
	SELECT     UnitConvertShadow.FROMUNIT, UnitConvertShadow.TOUNIT, UnitConvertShadow.ROUNDOFF, UnitConvertShadow.ITEMID, 
                      UnitConvertShadow.DATAAREAID, UnitConvertShadow.RECID, UnitConvertShadow.MARKUP, UnitConvertShadow.CONFIGID, 
                      UnitConvertShadow.FACTOR
	FROM         UnitConvertShadow 
GO
Exec dbo.LogProgressInfo ' Step5 Create Views afsluttet','Step5',2
