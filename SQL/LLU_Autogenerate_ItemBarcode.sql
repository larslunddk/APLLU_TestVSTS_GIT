-- CREATE VIEW InventItemBarcode_View on InventTable for InventItemBarcode
create view InventItemBarcode_View as 
select 'PLU'+itemid as ITEMBARCODE, ITEMID, 'axapta' as INVENTDIMID, 'PLU' as BARCODESETUPID, 0 as USEFORPRINTING, 0 as USEFORINPUT, '' as DESCRIPTION, 0 as QTY, '' as MODIFIEDDATE, 
                      '' as MODIFIEDTIME, '' as MODIFIEDBY, 'RCM' AS DATAAREAID, 0 as RECVERSION, 99999 as RECID
from InventTable
	where (not exists (select itemid from InventItemBarcode where ItemId = InventTable.itemid)) and dataareaid = 'RCM'
GO
begin tran
-- Initiate InventItemBarcodeShadow (Might be a little too complex but more safe :-)) 
drop table InventItemBarcodeShadow 
SELECT     *
INTO            InventItemBarcodeShadow
FROM         INVENTITEMBARCODE
delete from InventItemBarcodeShadow

-- Transfer data from InventItemBarcode_View to InventItemBarcodeShadow
insert into InventItemBarcodeShadow 
select * from InventItemBarcode_View

-- Update numbersequence and recid
Declare @NewRecId   as int
declare @count		as int
select @Count = count(*) from InventItemBarcodeShadow
		-- Update systemSeq - DO NOT UPDATE UNTIL REAL LIFE
		UPDATE dbo.SystemSequences
			SET    @NewRecid  = NextVal,
					NextVal    = NextVal + @Count
			WHERE ID = -1 AND TABID = 0 AND Dataareaid = 'rcm'	


update dbo.InventItemBarcodeShadow set @NewRecid = @NewRecid + 1,
				 recid = @NewRecid; --cast(@NewRecid as varchar(11));


-- Transfer new data to InventItemBarcode
INSERT INTO INVENTITEMBARCODE
SELECT * from InventItemBarcodeShadow 

select count(*) from InventItemBarcodeShadow



drop table InventItemBarcodeShadow 
drop view InventItemBarcode_view

rollback tran
update statistics dbo.inventItemBarcode with fullscan
