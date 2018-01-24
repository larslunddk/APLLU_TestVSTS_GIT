use widsql3_cit_udv
-- Find de unikke kombinationer der skal tjekkes
SET NOCOUNT ON
Exec dbo.LogProgressInfo ' Nye inventdim (Serial/Batch) startet (Step2b)'
begin tran
exec droptable 'InventDimTmp'
go
select count(*) as cnt, INVENTBATCHID, WMSLOCATIONID, WMSPALLETID, INVENTLOCATIONID, DATAAREAID, 
						999999999 AS RECID, '999999999' AS INVENTDIMID
	into InventDimTmp
	FROM         INVENTDIM
	where INVENTDIM.dataareaid = 'wid'
/*	and   NOT EXISTS (select inventdimid from inventdim as id 
										where id.inventbatchid	= INVENTDIM.inventbatchid
										and	  id.wmslocationid	= INVENTDIM.wmslocationid
										and   id.wmspalletid	= INVENTDIM.wmspalletid
										and   id.inventlocationid = INVENTDIM.inventlocationid
										and	  id.inventserialid = ''
										and   id.configid		= ''
										and   id.palletposition = ''
										and   id.DATAAREAID = INVENTDIM.DATAAREAID)
*/	group by INVENTBATCHID, WMSLOCATIONID, WMSPALLETID, INVENTLOCATIONID, DATAAREAID

GO
declare @Count int
declare @NextInventdimId int
Declare @NewRecId   as int
select @Count = (select count(*) from InventDimTmp)
update NUMBERSEQUENCETABLE set @NextInventdimId = nextrec, nextrec = nextrec+@count
	where NUMBERSEQUENCE = 'Lage_2' and	DATAAREAID = 'wid'
UPDATE dbo.SystemSequences SET    @NewRecid  = NextVal,	NextVal    = NextVal + @Count
	WHERE ID = -1 AND TABID = 0 AND Dataareaid = 'wid'	

--select @count
--select @nextrec

update dbo.InventDimTmp set @NewRecid = @NewRecid + 1,
				 recid = @NewRecid,
				 @NextInventDimId = @NextInventDimId + 1,
				 InventDimID = CAST(@NextInventDimId as VARCHAR(20))
				 ;
GO
/****** Object:  Index [TmpIdx]    Script Date: 03/13/2008 15:06:58 ******/
CREATE NONCLUSTERED INDEX [TmpIdx] ON [dbo].[InventDimTmp] 
(
	[INVENTBATCHID] ASC,
	[WMSLOCATIONID] ASC,
	[WMSPALLETID] ASC,
	[INVENTLOCATIONID] ASC,
	[DATAAREAID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
exec dropview 'InventDimTmpView'
GO
create view InventDimTmpView as
	SELECT     INVENTBATCHID, WMSLOCATIONID, WMSPALLETID, INVENTLOCATIONID, DATAAREAID, RECID, INVENTDIMID, 'larslund' as ident
	FROM         InventDimTmp
	WHERE NOT EXISTS (select inventdimid from inventdim as id 
										where id.inventbatchid	= InventDimTmp.inventbatchid
										and	  id.wmslocationid	= InventDimTmp.wmslocationid
										and   id.wmspalletid	= InventDimTmp.wmspalletid
										and   id.inventlocationid = InventDimTmp.inventlocationid
										and	  id.inventserialid = ''
										and   id.configid		= ''
										and   id.palletposition = ''
										and   id.DATAAREAID = InventDimTmp.DATAAREAID)
GO

insert into dbo.inventdim 
		(INVENTBATCHID, WMSLOCATIONID, WMSPALLETID, INVENTLOCATIONID, DATAAREAID, RECID, INVENTDIMID)	
	select 
		INVENTBATCHID, WMSLOCATIONID, WMSPALLETID, INVENTLOCATIONID, DATAAREAID, RECID, INVENTDIMID
	from InventDimTmpView
GO

update inventdim set InventDimIdNew = (select id.INVENTDIMID from InventDim as id 
										where id.inventbatchid	= INVENTDIM.inventbatchid
										and	  id.wmslocationid	= INVENTDIM.wmslocationid
										and   id.wmspalletid	= INVENTDIM.wmspalletid
										and   id.inventlocationid = INVENTDIM.inventlocationid
										and	  id.inventserialid = ''
										and   id.configid		= ''
										and   id.palletposition = ''
										and   id.DATAAREAID = 'wid')
	where dataareaid = 'wid'
GO
commit tran
Exec dbo.LogProgressInfo ' Nye inventdim afsluttet (Step2b)'
GO
--select top 100 * from InventDimTmpView where inventdimid = '11265022'

--select * from inventdim where inventdimid = '11265022'

/*update inventdim set InventDimIdNew = (select id.INVENTDIMID from InventDim as id 
										where id.inventbatchid	= INVENTDIM.inventbatchid
										and	  id.wmslocationid	= INVENTDIM.wmslocationid
										and   id.wmspalletid	= INVENTDIM.wmspalletid
										and   id.inventlocationid = INVENTDIM.inventlocationid
										and	  id.inventserialid = ''
										and   id.configid		= ''
										and   id.palletposition = '' 
										and   id.DATAAREAID = 'wid')
	where dataareaid = 'wid'

*/

/*

select count(*) from InventDimTmpView
select count(*) from InventDimTmp
select top 100 * from InventDimTmpView
select top 100 * from inventdim
	where not exists (select INVENTDIMID from InventDim id 
										where id.inventbatchid	= INVENTDIM.inventbatchid
										and	  id.wmslocationid	= INVENTDIM.wmslocationid
										and   id.wmspalletid	= INVENTDIM.wmspalletid
										and   id.inventlocationid = INVENTDIM.inventlocationid)
	and	  inventdim.inventbatchid	= ''
	and	  inventdim.wmslocationid	= '301-02-06-01'
	and   inventdim.wmspalletid	= '858'
	and   inventdim.inventlocationid = 'fvl'
select * from InventDimTmp  
	where InventDimTmp.inventbatchid	= ''
	and	  InventDimTmp.wmslocationid	= '301-02-06-01'
	and   InventDimTmp.wmspalletid	= '858'
	and   InventDimTmp.inventlocationid = 'fvl'
select * from InventDimTmpView  
	where InventDimTmpView.inventbatchid	= ''
	and	  InventDimTmpView.wmslocationid	= '301-02-06-01'
	and   InventDimTmpView.wmspalletid	= '858'
	and   InventDimTmpView.inventlocationid = 'fvl'

	--and   id.DATAAREAID = 'wid'
update inventdim set InventDimIdNew = (select inventdimid from inventdim as id 
										where id.inventbatchid	= INVENTDIM.inventbatchid
										and	  id.wmslocationid	= INVENTDIM.wmslocationid
										and   id.wmspalletid	= INVENTDIM.wmspalletid
										and	  id.inventserialid = ''
										and   id.inventlocationid = INVENTDIM.inventlocationid
										and   id.configid		= 'larslund'
										and   id.palletposition = '' 
										and   id.DATAAREAID = 'wid')
	where dataareaid = 'wid'
	and inventlocationid  IN ('ah-værktøj','amb','am-fjern','bb')
;
GO

select top 20 * from inventdim 
	where dataareaid = 'wid'  
	and  configId = 'larslund'
	and inventlocationid  IN ('ah-værktøj','amb','am-fjern','bb')
	order by inventlocationid


SELECT     INVENTDIM.INVENTDIMID, INVENTDIM.INVENTBATCHID, INVENTDIM.WMSLOCATIONID, INVENTDIM.WMSPALLETID, INVENTDIM.INVENTSERIALID, 
                      INVENTDIM.INVENTLOCATIONID, INVENTDIM.CONFIGID, INVENTDIM.INVENTSIZEID, INVENTDIM.PALLETPOSITION, INVENTDIM.DATAAREAID, 
                      INVENTDIM.INVENTCOLORID, INVENTDIM_1.INVENTDIMID AS Expr1, INVENTDIM_1.INVENTBATCHID AS Expr2, 
                      INVENTDIM_1.WMSLOCATIONID AS Expr3, INVENTDIM_1.WMSPALLETID AS Expr4, INVENTDIM_1.INVENTSERIALID AS Expr5, 
                      INVENTDIM_1.INVENTLOCATIONID AS Expr6, INVENTDIM_1.INVENTSIZEID AS Expr7, INVENTDIM_1.INVENTCOLORID AS Expr8, 
                      INVENTDIM_1.PALLETPOSITION AS Expr9, INVENTDIM_1.DATAAREAID AS Expr10, INVENTDIM_1.RECID, INVENTDIM_1.CONFIGID AS Expr12
FROM        INVENTDIM 
INNER JOIN	INVENTDIM AS INVENTDIM_1 ON 
						INVENTDIM.INVENTBATCHID = INVENTDIM_1.INVENTBATCHID 
					AND INVENTDIM.WMSLOCATIONID = INVENTDIM_1.WMSLOCATIONID 
					AND INVENTDIM.WMSPALLETID = INVENTDIM_1.WMSPALLETID 
					AND INVENTDIM.INVENTLOCATIONID = INVENTDIM_1.INVENTLOCATIONID
					AND INVENTDIM.DATAAREAID = INVENTDIM_1.DATAAREAID
WHERE     (INVENTDIM.DATAAREAID = 'WID') 
	AND (INVENTDIM_1.INVENTSERIALID = '') 
	AND (INVENTDIM_1.INVENTSIZEID = '') 
	AND (INVENTDIM_1.PALLETPOSITION = '') 
	and (INVENTDIM.inventlocationid  IN ('ah-værktøj','amb','am-fjern','bb'))



select * from inventdim as id 
										where id.inventbatchid	= '' --INVENTDIM.inventbatchid
										and	  id.wmslocationid	= '57-01-01' --INVENTDIM.wmslocationid
										and   id.wmspalletid	= '' --INVENTDIM.wmspalletid
										and	  id.inventserialid = ''
										and   id.inventlocationid = 'ah-værktøj' --INVENTDIM.inventlocationid
										and   id.configid		= 'larslund'
										and   id.palletposition = ''
										and   id.DATAAREAID = 'wid'
*/
--delete from inventdim where configId = 'larslund'


/*		HISTORY HEREUNDER


/*update NUMBERSEQUENCETABLE set nextrec = 11258142
	where		NUMBERSEQUENCE = 'Lage_2'
	and			DATAAREAID = 'wid'
UPDATE dbo.SystemSequences SET    NextVal    = 105183764 --1054183763
	WHERE ID = -1 AND TABID = 0 AND Dataareaid = 'wid'	

select nextval from SystemSequences
	WHERE ID = -1 AND TABID = 0 AND Dataareaid = 'wid'	
select top 10 * from InventDimTmp

select count(*) from inventdim where configid = 'larslund'
delete from inventdim where configid = 'larslund'
select max(recid) from InventDimTmp
select count(*) from inventdimtmp*/


-- ONLY Simulation
--SELECT @NewRecid  = cast((select NextVal from dbo.SystemSequences WHERE ID = -1 AND TABID = 0 AND Dataareaid = 'wid') as int);
update dbo.inventTableShadow set @NewRecid = @NewRecid + 1,
				 recid = @NewRecid; 

-- ResetNumberseq END
select NVENTBATCHID, WMSLOCATIONID, WMSPALLETID, INVENTLOCATIONID, INVENTSIZEID, INVENTCOLORID, 
                      PALLETPOSITION, DATAAREAID, 999999999 AS RECID, '999999999' AS INVENTDIMID



update inventdim
	set inventdimIdNew = (case when ((select inventdimid from inventdim as id 
										where id.inventbatchid	= inventdim.inventbatchid
										and	  id.wmslocationid	= inventdim.wmslocationid
										and   id.wmspalletid	= inventdim.wmspalletid
										and	  id.inventserialid = ''
										and   id.inventlocationid = inventdim.inventlocationid
										and   id.configid		= ''
										and	  id.INVENTSIZEID = inventdim.INVENTSIZEID 
										and	  id.INVENTCOLORID = inventdim.INVENTCOLORID 
										and   id.DATAAREAID = inventdim.DATAAREAID) <> '')
							   then		(select inventdimid from inventdim as id 
										where id.inventbatchid	= inventdim.inventbatchid
										and	  id.wmslocationid	= inventdim.wmslocationid
										and   id.wmspalletid	= inventdim.wmspalletid
										and	  id.inventserialid = ''
										and   id.inventlocationid = inventdim.inventlocationid
										and   id.configid		= ''
										and	  id.INVENTSIZEID = inventdim.INVENTSIZEID 
										and	  id.INVENTCOLORID = inventdim.INVENTCOLORID 
										and   id.DATAAREAID = inventdim.DATAAREAID)
								else
										'ToBeDefined'
								end)
	
	where	(INVENTDIM.DATAAREAID = 'wid')
/*	AND     (INVENTDIM.INVENTSERIALID = '') 
	AND		(INVENTDIM.CONFIGID = '') 
	AND		(INVENTDIM.PALLETPOSITION = '')
*/	and		(inventdim.recid = 50914295)					

select * from inventdim
	where inventdim.recid = 50914295
select max(inventdimid) from InventDim
	where InventDimId < 'AAAA-000000'

select distinct wmslocationid from inventdim
*/