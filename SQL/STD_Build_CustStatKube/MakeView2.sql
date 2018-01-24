select top 100 itemid, 
SUM(InventTrans.Qty) as QTY, SUM(InventTrans.COSTAMOUNTPOSTED)+SUM(InventTrans.CostamountAdjustment) as CostAmount,
COUNT(*) as Cnt from InventTrans group by ITEMID

select top 100 itemid, 
--SUM(InventTrans.Qty) as QTY, SUM(InventTrans.COSTAMOUNTPOSTED)+SUM(InventTrans.CostamountAdjustment) as CostAmount,
COUNT(*) as Cnt from InventTrans group by ITEMID