use widsql3_cit_udv
SET NOCOUNT ON
Exec dbo.LogProgressInfo ' Step 1001 - InventItemLocation/InventProductGroupItem - Delete dubletter startet','Step1001',1
exec droptable 'inventitemlocationTmp'
select inventitemlocation.itemid, inventitemlocation.inventdimid,
      [ItemId]+' '+[InventDim].[ConfigId]	itemid2, 
	  [InventDim].[InventDimIdNew]			inventdimid2
	into inventitemlocationTmp
     from [InventItemLocation] inner join [InventDim]
     on [InventItemLocation].[DATAAREAID] = 'wid'
     AND [InventItemLocation].[ItemId] <> ''
     AND [InventDim].[InventDimId] = [InventItemLocation].[InventDimId]
     AND [InventDim].[DATAAREAID] = 'wid'
     AND [InventDim].[configId] <> ''

/*select count(*) from inventitemlocation
	where exists (select itemid from inventitemlocationtmp iil
					where iil.itemid2		= inventitemlocation.itemid
					and   iil.inventdimid2	= inventitemlocation.inventdimid)
*/
delete from inventitemlocation
	where exists (select itemid from inventitemlocationtmp iil
					where iil.itemid2		= inventitemlocation.itemid
					and   iil.inventdimid2	= inventitemlocation.inventdimid)
exec droptable 'inventitemlocationTmp'
--------------------------------------					

exec droptable 'InventProductGroupItemTmp'
select InventProductGroupItem.ProductGroupId, InventProductGroupItem.itemid, InventProductGroupItem.inventdimid_WDX,
      [ItemId]+' '+[InventDim].[ConfigId]	itemid2, 
	  [InventDim].[InventDimIdNew]			inventdimid2
	into InventProductGroupItemTmp
     from InventProductGroupItem inner join [InventDim]
     on InventProductGroupItem.[DATAAREAID] = 'wid'
     AND InventProductGroupItem.[ItemId] <> ''	 
     AND [InventDim].[InventDimId] = InventProductGroupItem.[InventDimId_WDX]
     AND [InventDim].[DATAAREAID] = 'wid'
     AND [InventDim].[configId] <> ''
go
delete from InventProductGroupItem
	where exists (select itemid from InventProductGroupItemTmp iil
					where iil.itemid2		= InventProductGroupItem.itemid
					and   iil.inventdimid2	= InventProductGroupItem.inventdimid_wdx
					and   iil.ProductGroupId= InventProductGroupItem.ProductGroupId)
exec droptable 'InventProductGroupItemTmp'
Exec dbo.LogProgressInfo ' Step 1001 - InventItemLocation - Delete dubletter afsluttet','Step1001',2
/*UPDATE [InventItemLocation]
 SET [ItemId]= [ItemId]+' '+[InventDim].[ConfigId],
     [InventDimId] = [InventDim].[InventDimIdNew]
     from [InventItemLocation] inner join [InventDim]
     on [InventItemLocation].[DATAAREAID] = 'wid'
     AND [InventItemLocation].[ItemId] <> ''
     AND [InventDim].[InventDimId] = [InventItemLocation].[InventDimId]
     AND [InventDim].[DATAAREAID] = 'wid'
     AND [InventDim].[configId] <> ''
*/
--InventSum
--InventProductGroupItem