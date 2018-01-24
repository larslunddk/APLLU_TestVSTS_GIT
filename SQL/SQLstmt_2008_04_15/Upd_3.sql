use widsql3_cit_1
 UPDATE [InventSettlement] SET [InventSettlement].[ItemId]= [InventTrans].[ItemId]
 from [InventSettlement] inner join [InventTrans]
 on [InventSettlement].[DATAAREAID] = 'wid'
 AND [InventTrans].[RecId] = [InventSettlement].[TransRecId]
 AND [InventSettlement].[TransRecId] > 400000000
 AND [InventSettlement].[TransRecId] <= 600000000
 AND [InventTrans].[DATAAREAID] = 'wid'
 
