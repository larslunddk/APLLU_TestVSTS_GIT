use widsql3_cit_1
 UPDATE [InventSettlement] SET [InventSettlement].[ItemId]= [InventTrans].[ItemId]
 from [InventSettlement] inner join [InventTrans]
 on [InventSettlement].[DATAAREAID] = 'wid'
 AND [InventTrans].[RecId] = [InventSettlement].[TransRecId]
 AND [InventSettlement].[TransRecId] > 800000000
 AND [InventSettlement].[TransRecId] <= 1000000000
 AND [InventTrans].[DATAAREAID] = 'wid'
 
