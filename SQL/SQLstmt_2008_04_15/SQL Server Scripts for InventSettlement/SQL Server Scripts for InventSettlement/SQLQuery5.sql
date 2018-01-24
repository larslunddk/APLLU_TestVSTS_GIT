use widsql3_cit_1
UPDATE [InventSettlement]
   SET [ItemId]= [InventTrans].[ItemId]
   from [InventSettlement] inner join [InventTrans]
     on [InventSettlement].[DATAAREAID] = 'wid'
    AND [InventTrans].[InventTransId] = [InventSettlement].[InventTransId]
	AND [InventTrans].[InventTransId] > 10000000
	AND [InventTrans].[InventTransId] <=12500000
    AND [InventTrans].[DATAAREAID] = 'wid'