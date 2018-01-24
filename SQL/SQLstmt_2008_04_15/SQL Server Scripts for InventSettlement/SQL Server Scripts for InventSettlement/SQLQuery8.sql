use widsql3_cit_1
UPDATE [InventSettlement]
   SET [ItemId]= [InventTrans].[ItemId]
   from [InventSettlement] inner join [InventTrans]
     on [InventSettlement].[DATAAREAID] = 'wid'
    AND [InventTrans].[InventTransId] = [InventSettlement].[InventTransId]
	AND [InventTrans].[InventTransId] > 17500000
	AND [InventTrans].[InventTransId] <=20000000
    AND [InventTrans].[DATAAREAID] = 'wid'