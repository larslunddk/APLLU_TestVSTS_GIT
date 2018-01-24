
use widsql3_cit_1
SET NOCOUNT ON
-- ******************* WDX_PriceCubeData
Exec dbo.LogProgressInfo ' Step7 ConvertItemId misc. tables startet','Step7',1
exec droptable 'WDX_PriceCubeDatashadow'
go
SELECT  WDX_PriceCubeData.ITEMID+' '+INVENTDIMCOMBINATION.CONFIGID as ItemId,
		WDX_PRICECUBEDATA.CUSTACCOUNT,  WDX_PRICECUBEDATA.PRICEDATE, 
        WDX_PRICECUBEDATA.DISCPCT_WDX, WDX_PRICECUBEDATA.PRICECUR, WDX_PRICECUBEDATA.CURRENCYCODE, 
        WDX_PRICECUBEDATA.CREATEDDATE, WDX_PRICECUBEDATA.DATAAREAID, 
		WDX_PRICECUBEDATA.PRICE,
		999999999 as RECID
into WDX_PriceCubeDataShadow
FROM         WDX_PriceCubeData INNER JOIN
                      dbo.INVENTDIMCOMBINATION 
					 ON WDX_PriceCubeData.ITEMID = INVENTDIMCOMBINATION.ITEMID
				     and WDX_PriceCubeData.DATAAREAID = 'wid'
					 and WDX_PriceCubeData.dataareaid = INVENTDIMCOMBINATION.dataareaid
GO

Declare @NewRecId   as int
declare @count		as int
select @Count = count(*) from WDX_PriceCubeDatashadow

		-- Update systemSeq - DO NOT UPDATE UNTIL REAL LIFE
		UPDATE dbo.SystemSequences
			SET    @NewRecid  = NextVal,
					NextVal    = NextVal + @Count
			WHERE ID = -1 AND TABID = 0 AND Dataareaid = 'wid'	
update dbo.WDX_PriceCubeDatashadow set @NewRecid = @NewRecid + 1,
				 recid = @NewRecid;
GO
exec dropview 'WDX_PriceCubeData_shadowView'
GO
create view WDX_PriceCubeData_shadowView as
	SELECT     
		CUSTACCOUNT, PRICEDATE, PRICE, DISCPCT_WDX, PRICECUR, CREATEDDATE,CURRENCYCODE,
		ITEMID, DATAAREAID, RECID
	FROM         WDX_PriceCubeDataShadow
	where		Dataareaid = 'wid'
GO	
insert into WDX_PriceCubeData 
		  (CUSTACCOUNT, PRICEDATE, PRICE, DISCPCT_WDX, PRICECUR, CREATEDDATE,CURRENCYCODE,
										ITEMID, RECID, DATAAREAID)
	select CUSTACCOUNT, PRICEDATE, PRICE, DISCPCT_WDX, PRICECUR, CREATEDDATE,CURRENCYCODE,
										ITEMID, RECID, DATAAREAID
		from WDX_PriceCubeData_shadowView
go

exec dropview 'WDX_PriceCubeData_shadowView'
go
DELETE FROM WDX_PriceCubeData 
	where exists(select itemid from dbo.INVENTDIMCOMBINATION 
					 where INVENTDIMCOMBINATION.ITEMID = WDX_PriceCubeData.ITEMID
				     and WDX_PriceCubeData.DATAAREAID = 'wid'
					 and WDX_PriceCubeData.dataareaid = INVENTDIMCOMBINATION.dataareaid)



Exec dbo.LogProgressInfo ' WDX_PriceCubeData dannet'
-- ******************* INVENTBATCH

exec droptable 'INVENTBATCHshadow'
go
SELECT  INVENTBATCH.ITEMID+' '+INVENTDIMCOMBINATION.CONFIGID as ItemId,
		INVENTBATCHID, EXPDATE, DEL_CONFIGID, PRODDATE, [DESCRIPTION],
		INVENTBATCH.DATAAREAID, 
		999999999 as RECID
into INVENTBATCHshadow
FROM         INVENTBATCH INNER JOIN
                      dbo.INVENTDIMCOMBINATION 
					 ON INVENTBATCH.ITEMID = INVENTDIMCOMBINATION.ITEMID
				     and INVENTBATCH.DATAAREAID = 'wid'
					 and INVENTBATCH.dataareaid = INVENTDIMCOMBINATION.dataareaid


GO
Declare @NewRecId   as int
declare @count		as int
select @Count = count(*) from INVENTBATCHshadow

		-- Update systemSeq - DO NOT UPDATE UNTIL REAL LIFE
		UPDATE dbo.SystemSequences
			SET    @NewRecid  = NextVal,
					NextVal    = NextVal + @Count
			WHERE ID = -1 AND TABID = 0 AND Dataareaid = 'wid'	
update dbo.INVENTBATCHshadow set @NewRecid = @NewRecid + 1,
				 recid = @NewRecid;
GO
exec dropview 'INVENTBATCHshadowView'
GO
create view INVENTBATCHshadowView as
	SELECT      ITEMID, 
				INVENTBATCHID, EXPDATE, DEL_CONFIGID, PRODDATE, [DESCRIPTION],
				DATAAREAID, 
				RECID
	FROM         INVENTBATCHshadow
	where		Dataareaid = 'wid'
GO	

DELETE FROM INVENTBATCH 
	where exists(select itemid from dbo.INVENTDIMCOMBINATION 
					 where INVENTDIMCOMBINATION.ITEMID = INVENTBATCH.ITEMID
				     and INVENTBATCH.DATAAREAID = 'wid'
					 and INVENTBATCH.dataareaid = INVENTDIMCOMBINATION.dataareaid)
	and   inventbatch.dataareaid = 'wid'
GO
insert into INVENTBATCH (INVENTBATCHID, EXPDATE, DEL_CONFIGID, PRODDATE, [DESCRIPTION],DATAAREAID,
										ITEMID, RECID)
	select INVENTBATCHID, EXPDATE, DEL_CONFIGID, PRODDATE, [DESCRIPTION],DATAAREAID,
										ITEMID, RECID
		from INVENTBATCHshadowView
go
exec dropview 'INVENTBATCHshadowView'

Exec dbo.LogProgressInfo ' INVENTBATCH dannet'
-- ******************* dbo.PRICEDISCTABLE
exec droptable 'PRICEDISCTABLEshadow'
go
SELECT  PRICEDISCTABLE.ITEMRELATION+' '+INVENTDIMCOMBINATION.CONFIGID as ITEMRELATION,
		     PRICEDISCTABLE.AGREEMENT, PRICEDISCTABLE.ITEMCODE, PRICEDISCTABLE.ACCOUNTCODE, PRICEDISCTABLE.ACCOUNTRELATION, 
                      PRICEDISCTABLE.QUANTITYAMOUNT, PRICEDISCTABLE.FROMDATE, PRICEDISCTABLE.TODATE, PRICEDISCTABLE.AMOUNT, 
                      PRICEDISCTABLE.CURRENCY, PRICEDISCTABLE.PERCENT1, PRICEDISCTABLE.DELIVERYTIME, PRICEDISCTABLE.SEARCHAGAIN, 
                      PRICEDISCTABLE.PRICEUNIT, PRICEDISCTABLE.RELATION, PRICEDISCTABLE.UNITID, PRICEDISCTABLE.MARKUP, 
                      PRICEDISCTABLE.ALLOCATEMARKUP, PRICEDISCTABLE.MODULE, PRICEDISCTABLE.DEL_CONFIGID, PRICEDISCTABLE.INVENTDIMID, 
                      PRICEDISCTABLE.CALENDARDAYS, PRICEDISCTABLE.DATAAREAID, PRICEDISCTABLE.PERCENT2, 999999999 as RECID
into PRICEDISCTABLEshadow
FROM         PRICEDISCTABLE INNER JOIN
                      dbo.INVENTDIMCOMBINATION 
					 ON PRICEDISCTABLE.ITEMRELATION = INVENTDIMCOMBINATION.ITEMID
					 and exists (select recid from inventdim 
									where inventdim.dataareaid = PRICEDISCTABLE.dataareaid
									and   inventdim.dataareaid = 'wid'
									and   inventdim.inventdimid = PRICEDISCTABLE.inventdimid
									and   inventdim.configid = '')
				     and PRICEDISCTABLE.DATAAREAID = 'wid'
					 and PRICEDISCTABLE.dataareaid = INVENTDIMCOMBINATION.dataareaid
				     and INVENTDIMCOMBINATION.configid <> ''
					 and PRICEDISCTABLE.itemcode = 0
go
Declare @NewRecId   as int
declare @count		as int
select @Count = count(*) from PRICEDISCTABLEshadow

		-- Update systemSeq - DO NOT UPDATE UNTIL REAL LIFE
		UPDATE dbo.SystemSequences
			SET    @NewRecid  = NextVal,
					NextVal    = NextVal + @Count
			WHERE ID = -1 AND TABID = 0 AND Dataareaid = 'wid'	
update dbo.PRICEDISCTABLEshadow set @NewRecid = @NewRecid + 1,
				 recid = @NewRecid,		DEL_CONFIGID = 'larslund', INVENTDIMID = replicate(' ',17)+'417';

GO
exec dropview 'PRICEDISCTABLEshadowView'
GO
create view PRICEDISCTABLEshadowView as
	SELECT      * 
	FROM        PRICEDISCTABLEshadow
	where		Dataareaid = 'wid'
GO	

insert into PRICEDISCTABLE (ITEMRELATION, AGREEMENT, ITEMCODE, ACCOUNTCODE, QUANTITYAMOUNT, FROMDATE, TODATE, 
							AMOUNT, CURRENCY, PERCENT1, 
							DELIVERYTIME, SEARCHAGAIN, PRICEUNIT, RELATION, UNITID, MARKUP, ALLOCATEMARKUP, MODULE, 
							DEL_CONFIGID, INVENTDIMID, 
							CALENDARDAYS, DATAAREAID, PERCENT2, RECID, ACCOUNTRELATION)
		select  ITEMRELATION, AGREEMENT, ITEMCODE, ACCOUNTCODE, QUANTITYAMOUNT, FROMDATE, TODATE, AMOUNT, CURRENCY, PERCENT1, 
                      DELIVERYTIME, SEARCHAGAIN, PRICEUNIT, RELATION, UNITID, MARKUP, ALLOCATEMARKUP, MODULE, DEL_CONFIGID, INVENTDIMID, 
                      CALENDARDAYS, DATAAREAID, PERCENT2, RECID, ACCOUNTRELATION
		 from PRICEDISCTABLEshadowview
go
exec dropview 'PRICEDISCTABLEshadowView'

delete --SELECT  count(*) 
	FROM PRICEDISCTABLE 
				   where PRICEDISCTABLE.DATAAREAID = 'wid'
					 and PRICEDISCTABLE.itemcode = 0
					 and exists (select recid from INVENTDIMCOMBINATION 
									where INVENTDIMCOMBINATION.dataareaid = PRICEDISCTABLE.dataareaid
									and   INVENTDIMCOMBINATION.itemid = PRICEDISCTABLE.ITEMRELATION
									and   INVENTDIMCOMBINATION.dataareaid = 'wid'
									and   INVENTDIMCOMBINATION.configid <> '')
					 and exists (select recid from inventdim 
									where inventdim.dataareaid = PRICEDISCTABLE.dataareaid
									and   inventdim.dataareaid = 'wid'
									and   inventdim.inventdimid = PRICEDISCTABLE.inventdimid
									and   inventdim.configid = '')

Exec dbo.LogProgressInfo ' PRICEDISCTABLE dannet'



Exec dbo.LogProgressInfo ' ECPPresentation konvertering start'
UPDATE ECPPresentation 
	SET RefId = LTRIM(RefId) + ' ' +InventDim.configid,
		RefInventDimId_WDX = InventDim.InventDimIdNew
	FROM ECPPresentation inner join InventDim
	on ECPPresentation.dataareaid = 'wid'
	and ECPPresentation.refid <> ''
	and ECPPresentation.RefInventDimId_WDX = InventDim.InventDimId
	and inventdim.dataareaid = 'wid'
	and inventdim.configid <> ''
GO

UPDATE ECPPresentation 
	SET RefId = dbo.RLen(RefId, 20) -- SPACE(20-LEN(LTRIM(RefId)))+LTRIM(RefId)
	where 
	    ECPPresentation.dataareaid = 'wid';
Exec dbo.LogProgressInfo ' ECPPresentation konvertering Slut'


Exec dbo.LogProgressInfo ' Step7 ConvertItemId misc. tables afsluttet','Step7',2