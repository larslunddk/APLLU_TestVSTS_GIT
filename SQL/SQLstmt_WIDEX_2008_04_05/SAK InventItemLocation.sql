UPDATE [InventItemLocation]
 SET [ItemId]= [ItemId]+' '+[InventDim].[ConfigId],
     [InventDimId] = [InventDim].[InventDimIdNew]
     from [InventItemLocation] inner join [InventDim]
     on [InventItemLocation].[DATAAREAID] = 'wid'
     AND [InventItemLocation].[ItemId] <> ''
     AND [InventDim].[InventDimId] = [InventItemLocation].[InventDimId]
     AND [InventDim].[DATAAREAID] = 'wid'
     AND [InventDim].[configId] <> ''

--InventSum
--InventProductGroupItem