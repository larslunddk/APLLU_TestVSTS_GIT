-- ==STEP 3===========================================
-- Author:		Lars Lund
-- Create date: 2008.03.12
-- Description:	Widex - Updating back to Maintables
-- =============================================
use widsql3_cit_udv
SET NOCOUNT ON
Exec dbo.LogProgressInfo ' Step6 Insert shadow tables startet','Step6',1
INSERT INTO [dbo].[INVENTTABLE]
           ( ITEMGROUPID, RECID, CREATEDBY, DATEEXPECTED, INVENTSTATUS, BLOCKEDFORETONA_WDX, BLOCKEDFORBIZ_WDX, 
                      TECHNICALDESCRIPTION, DATAAREAID, CREATEDTIME, CREATEDDATE, MODIFIEDBY, MODIFIEDTIME, MODIFIEDDATE, CEVERSION_WDX, 
                      SERIALNUMCHECKGROUPID, DEFAULTCONFIGID_EMS, INVENTPROJECTID_WDX, MASTERITEM_EMS, MASTERITEMID_EMS, 
                      PRODUCTTYPEID_EMS, PRODLOCATIONID, STATISTIKID2_WID, STATISTIKID_WID, HEADTYPE_WID, ITEMIDMASKED_WDX, ALTINVENTCOLORID, 
                      ALTINVENTSIZEID, ITEMDIMCOSTPRICE, ITEMDIMCOMBINATIONAUTOCREATE, STANDARDINVENTSIZEID, STANDARDINVENTCOLORID, 
                      SCRAPCONST, SCRAPVAR, PACKAGINGGROUPID, TARAWEIGHT, WMSPICKINGQTYTIME, STOPEXPLODEPRICE, ORIGSTATEID, WMSPALLETTYPEID, 
                      DEL_TEMPLATE, TAXPACKAGINGQTY, ITEMBUYERGROUPID, MODELGROUPID, DIMGROUPID, SERIALNUMGROUPID, CONFIGSIMILAR, SORTCODE, 
                      QTYPERLAYER, STANDARDPALLETQUANTITY, GROSSHEIGHT, GROSSWIDTH, GROSSDEPTH, PROJCATEGORYID, PRODGROUPID, NAMEALIAS, 
                      MINAVERAGESETTLE, SALESPRICEMODELBASIC, SALESCONTRIBUTIONRATIO, SALESPERCENTMARKUP, CONFIGURABLE, DEL_BARCODETYPE, 
                      DEL_BARCODE, COMMISSIONGROUPID, ABCCONTRIBUTIONMARGIN, ABCVALUE, ABCREVENUE, ABCTIEUP, PROPERTYID, PRODPOOLID, 
                      DEL_CONFIGACTIVE, STANDARDCONFIGID, ALTCONFIGID, STATISTICSFACTOR, ORIGCOUNTRYID, AUTOREPORTFINISHED, BATCHNUMGROUPID, 
                      BOMLEVEL, INTRAUNIT, PHANTOM, DEL_COVPERINVENTLOCATION, STOPEXPLODE, BOMMANUALRECEIPT, BOMMANUALCONSUMP, INTRACODE, 
                      ALTITEMID, USEALTITEMID, COSTMODEL, DIMENSION3_, DIMENSION2_, DIMENSION, DEL_SCRAPTYPEID, DENSITY, BOMUNITID, UNITVOLUME, 
                      DEPTH, NETWEIGHT, PRIMARYVENDORID, REQGROUPID, COSTGROUPID, SALESMODEL, WIDTH, HEIGHT, PURCHMODEL, ITEMTYPE, ITEMNAME, 
                      ITEMID, ITEMIDMASTER)
   SELECT  ITEMGROUPID, RECID, CREATEDBY, DATEEXPECTED, INVENTSTATUS, BLOCKEDFORETONA_WDX, BLOCKEDFORBIZ_WDX, 
                      TECHNICALDESCRIPTION, DATAAREAID, CREATEDTIME, CREATEDDATE, MODIFIEDBY, MODIFIEDTIME, MODIFIEDDATE, CEVERSION_WDX, 
                      SERIALNUMCHECKGROUPID, DEFAULTCONFIGID_EMS, INVENTPROJECTID_WDX, MASTERITEM_EMS, MASTERITEMID_EMS, 
                      PRODUCTTYPEID_EMS, PRODLOCATIONID, STATISTIKID2_WID, STATISTIKID_WID, HEADTYPE_WID, ITEMIDMASKED_WDX, ALTINVENTCOLORID, 
                      ALTINVENTSIZEID, ITEMDIMCOSTPRICE, ITEMDIMCOMBINATIONAUTOCREATE, STANDARDINVENTSIZEID, STANDARDINVENTCOLORID, 
                      SCRAPCONST, SCRAPVAR, PACKAGINGGROUPID, TARAWEIGHT, WMSPICKINGQTYTIME, STOPEXPLODEPRICE, ORIGSTATEID, WMSPALLETTYPEID, 
                      DEL_TEMPLATE, TAXPACKAGINGQTY, ITEMBUYERGROUPID, MODELGROUPID, DIMGROUPID, SERIALNUMGROUPID, CONFIGSIMILAR, SORTCODE, 
                      QTYPERLAYER, STANDARDPALLETQUANTITY, GROSSHEIGHT, GROSSWIDTH, GROSSDEPTH, PROJCATEGORYID, PRODGROUPID, NAMEALIAS, 
                      MINAVERAGESETTLE, SALESPRICEMODELBASIC, SALESCONTRIBUTIONRATIO, SALESPERCENTMARKUP, CONFIGURABLE, DEL_BARCODETYPE, 
                      DEL_BARCODE, COMMISSIONGROUPID, ABCCONTRIBUTIONMARGIN, ABCVALUE, ABCREVENUE, ABCTIEUP, PROPERTYID, PRODPOOLID, 
                      DEL_CONFIGACTIVE, STANDARDCONFIGID, ALTCONFIGID, STATISTICSFACTOR, ORIGCOUNTRYID, AUTOREPORTFINISHED, BATCHNUMGROUPID, 
                      BOMLEVEL, INTRAUNIT, PHANTOM, DEL_COVPERINVENTLOCATION, STOPEXPLODE, BOMMANUALRECEIPT, BOMMANUALCONSUMP, INTRACODE, 
                      ALTITEMID, USEALTITEMID, COSTMODEL, DIMENSION3_, DIMENSION2_, DIMENSION, DEL_SCRAPTYPEID, DENSITY, BOMUNITID, UNITVOLUME, 
                      DEPTH, NETWEIGHT, PRIMARYVENDORID, REQGROUPID, COSTGROUPID, SALESMODEL, WIDTH, HEIGHT, PURCHMODEL, ITEMTYPE, ITEMNAME, 
                      ITEMID, ITEMIDMASTER 
		from inventTableShadowView
GO
Exec dbo.LogProgressInfo ' INVENTTABLE dannet - slut.  '
INSERT INTO [dbo].[INVENTTABLEMODULE]
	(ITEMID, MODULETYPE, PRICE, PRICEUNIT, MARKUP, LINEDISC, MULTILINEDISC, ENDDISC, QUANTITY, LOWESTQTY, HIGHESTQTY, 
                      TAXITEMGROUPID, BLOCKED, DELIVERYTIME, INVENTLOCATIONID, STANDARDQTY, MARKUPGROUPID, PRICEDATE, PRICEQTY, ALLOCATEMARKUP, 
                      OVERDELIVERYPCT, UNDERDELIVERYPCT, SUPPITEMGROUPID, CALENDARDAYS, INVENTDIMID_WDX, DATAAREAID, RECID, 
                      MANDATORYINVENTLOCATION, UNITID)
	SELECT     ITEMID, MODULETYPE, PRICE, PRICEUNIT, MARKUP, LINEDISC, MULTILINEDISC, ENDDISC, QUANTITY, LOWESTQTY, HIGHESTQTY, 
                      TAXITEMGROUPID, BLOCKED, DELIVERYTIME, INVENTLOCATIONID, STANDARDQTY, MARKUPGROUPID, PRICEDATE, PRICEQTY, ALLOCATEMARKUP, 
                      OVERDELIVERYPCT, UNDERDELIVERYPCT, SUPPITEMGROUPID, CALENDARDAYS, INVENTDIMID_WDX, DATAAREAID, RECID, 
                      MANDATORYINVENTLOCATION, UNITID
	from InventTableModuleShadowView
GO
Exec dbo.LogProgressInfo ' INVENTTABLEMODULE dannet - slut. '
INSERT INTO [dbo].[INVENTITEMLOCATION]
	(RECID, DATAAREAID, PICKINGLOCATIONREFILLMIN, USEWMSORDER, INVENTDIMID, WMSLOCATIONIDDEFAULTRECEIPT, 
                      WMSLOCATIONIDDEFAULTISSUE, COUNTINGJOURNALID, COUNTINGSTARTED, WMSPICKINGLOCATION, WMSSTOREZONEID, DEL_DELIVERYTIME, 
                      DEL_MAXINVENTONHAND, DEL_MININVENTONHAND, DEL_COVPERIOD, DEL_COVRULE, DEL_INVENTLOCATIONID, DEL_CONFIGID, COUNTGROUPID, 
                      ITEMID)
	SELECT     RECID, DATAAREAID, PICKINGLOCATIONREFILLMIN, USEWMSORDER, INVENTDIMID, WMSLOCATIONIDDEFAULTRECEIPT, 
                      WMSLOCATIONIDDEFAULTISSUE, COUNTINGJOURNALID, COUNTINGSTARTED, WMSPICKINGLOCATION, WMSSTOREZONEID, DEL_DELIVERYTIME, 
                      DEL_MAXINVENTONHAND, DEL_MININVENTONHAND, DEL_COVPERIOD, DEL_COVRULE, DEL_INVENTLOCATIONID, DEL_CONFIGID, COUNTGROUPID, 
                      ITEMID
	from InventItemLocationShadowView
GO
Exec dbo.LogProgressInfo ' INVENTITEMLOCATION dannet - slut. '
INSERT INTO [dbo].[UNITCONVERT]
	(FROMUNIT, TOUNIT, FACTOR, ROUNDOFF, ITEMID, DATAAREAID, MARKUP,  RECID)
	SELECT     FROMUNIT, TOUNIT, FACTOR, ROUNDOFF, ITEMID, DATAAREAID, MARKUP,  RECID
	from UnitConvertShadowView
GO
Exec dbo.LogProgressInfo ' UNITCONVERT dannet - slut. '
Exec dbo.LogProgressInfo ' Step6 Insert shadow tables afsluttet','Step6',2
/*select count(*) from inventtable
	where inventtable.dataareaid = 'wid'
	AND   inventtable.DEL_BARCODE = 'larslund'
select count(*) from inventtableshadow
	where inventtableshadow.dataareaid = 'wid'
*/
