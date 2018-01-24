use widsql3_cit_1
Exec dbo.LogProgressInfo ' Step 2a - Nye CIT_InventSerialIdshadow startet','Step2a',1
begin tran
exec droptable 'CIT_InventSerialIdshadow'
go
SELECT     inventtrans.recid as RefRecId, inventdim.inventserialid as inventserialid, 
		   inventdim.inventbatchid as inventbatchid, 99999999 as recid 
	INTO CIT_InventSerialIdshadow
	FROM         INVENTTABLE, inventtrans, inventdim
	where (inventtable.DIMGROUPID = '005llu')
	and   (inventtrans.itemid = inventtable.itemid)
	and   (inventtrans.inventdimid = inventdim.inventdimid)
	and   (inventdim.dataareaid = 'wid')
	and   (inventtable.dataareaid = 'wid')
	and    (inventtrans.dataareaid = 'wid') 

Declare @NewRecId   as int
declare @count		as int
select @Count = count(*) from CIT_InventSerialIdshadow
		-- Update systemSeq - DO NOT UPDATE UNTIL REAL LIFE
		UPDATE dbo.SystemSequences
			SET    @NewRecid  = NextVal,
					NextVal    = NextVal + @Count
			WHERE ID = -1 AND TABID = 0 AND Dataareaid = 'wid'	

update dbo.CIT_InventSerialIdshadow set @NewRecid = @NewRecid + 1, recid = @NewRecid; 
GO
--Exec dbo.LogProgressInfo ' Temp InventTableModuleShadow dannet - Slut: '
exec Dropview 'CIT_InventSerialIdshadowView'
go
create view CIT_InventSerialIdshadowView as 
	select REFRECID,INVENTSERIALID, INVENTBATCHID, 'wid' as dataareaid, recid
	from CIT_InventSerialIdshadow
GO

insert into CIT_InventSerialId (REFRECID,INVENTSERIALID, INVENTBATCHID, dataareaid, recid)
	SELECT     REFRECID,INVENTSERIALID, INVENTBATCHID, dataareaid, recid 
	FROM         CIT_InventSerialIdshadowView 
GO
commit tran
Exec dbo.LogProgressInfo ' Step 2a - Nye CIT_InventSerialIdshadow afsluttet','Step2a',2