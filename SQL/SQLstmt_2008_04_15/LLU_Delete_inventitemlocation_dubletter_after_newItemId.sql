drop table inventitemlocationTmp
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

select count(*) from inventitemlocation
	where exists (select itemid from inventitemlocationtmp iil
					where iil.itemid2		= inventitemlocation.itemid
					and   iil.inventdimid2	= inventitemlocation.inventdimid)

delete from inventitemlocation
	where exists (select itemid from inventitemlocationtmp iil
					where iil.itemid2		= inventitemlocation.itemid
					and   iil.inventdimid2	= inventitemlocation.inventdimid)
					


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