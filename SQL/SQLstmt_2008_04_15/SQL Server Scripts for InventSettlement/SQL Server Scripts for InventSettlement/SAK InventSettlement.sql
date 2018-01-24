UPDATE [InventSettlement]
   SET [ItemId]= [InventTrans].[ItemId]
   from [InventSettlement] inner join [InventTrans]
     on [InventSettlement].[DATAAREAID] = 'wid'
    AND [InventTrans].[InventTransId] = [InventSettlement].[InventTransId]
	AND [InventTrans].[InventTransId] <= 2500000
    AND [InventTrans].[DATAAREAID] = 'wid'

UPDATE [InventSettlement]
   SET [ItemId]= [InventTrans].[ItemId]
   from [InventSettlement] inner join [InventTrans]
     on [InventSettlement].[DATAAREAID] = 'wid'
    AND [InventTrans].[InventTransId] = [InventSettlement].[InventTransId]
	AND [InventTrans].[InventTransId] >  2500000
	AND [InventTrans].[InventTransId] <= 5000000
    AND [InventTrans].[DATAAREAID] = 'wid'

UPDATE [InventSettlement]
   SET [ItemId]= [InventTrans].[ItemId]
   from [InventSettlement] inner join [InventTrans]
     on [InventSettlement].[DATAAREAID] = 'wid'
    AND [InventTrans].[InventTransId] = [InventSettlement].[InventTransId]
	AND [InventTrans].[InventTransId] >  5000000
	AND [InventTrans].[InventTransId] <= 7500000
    AND [InventTrans].[DATAAREAID] = 'wid'

UPDATE [InventSettlement]
   SET [ItemId]= [InventTrans].[ItemId]
   from [InventSettlement] inner join [InventTrans]
     on [InventSettlement].[DATAAREAID] = 'wid'
    AND [InventTrans].[InventTransId] = [InventSettlement].[InventTransId]
	AND [InventTrans].[InventTransId] >  7500000
	AND [InventTrans].[InventTransId] <=10000000
    AND [InventTrans].[DATAAREAID] = 'wid'

UPDATE [InventSettlement]
   SET [ItemId]= [InventTrans].[ItemId]
   from [InventSettlement] inner join [InventTrans]
     on [InventSettlement].[DATAAREAID] = 'wid'
    AND [InventTrans].[InventTransId] = [InventSettlement].[InventTransId]
	AND [InventTrans].[InventTransId] > 10000000
	AND [InventTrans].[InventTransId] <=12500000
    AND [InventTrans].[DATAAREAID] = 'wid'

UPDATE [InventSettlement]
   SET [ItemId]= [InventTrans].[ItemId]
   from [InventSettlement] inner join [InventTrans]
     on [InventSettlement].[DATAAREAID] = 'wid'
    AND [InventTrans].[InventTransId] = [InventSettlement].[InventTransId]
	AND [InventTrans].[InventTransId] > 12500000
	AND [InventTrans].[InventTransId] <=15000000
    AND [InventTrans].[DATAAREAID] = 'wid'

UPDATE [InventSettlement]
   SET [ItemId]= [InventTrans].[ItemId]
   from [InventSettlement] inner join [InventTrans]
     on [InventSettlement].[DATAAREAID] = 'wid'
    AND [InventTrans].[InventTransId] = [InventSettlement].[InventTransId]
	AND [InventTrans].[InventTransId] > 15000000
	AND [InventTrans].[InventTransId] <=17500000
    AND [InventTrans].[DATAAREAID] = 'wid'

UPDATE [InventSettlement]
   SET [ItemId]= [InventTrans].[ItemId]
   from [InventSettlement] inner join [InventTrans]
     on [InventSettlement].[DATAAREAID] = 'wid'
    AND [InventTrans].[InventTransId] = [InventSettlement].[InventTransId]
	AND [InventTrans].[InventTransId] > 17500000
	AND [InventTrans].[InventTransId] <=20000000
    AND [InventTrans].[DATAAREAID] = 'wid'
