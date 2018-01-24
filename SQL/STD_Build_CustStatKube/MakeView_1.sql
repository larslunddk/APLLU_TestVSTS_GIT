select top 100 ITrans.ITEMID, ITable.ItemName, 
	--ITrans.DATEFINANCIAL as InvDate,
	dbo.LP_Year_Mth(ITrans.DATEFINANCIAL),
	SUM(ITrans.Qty) as QTY, SUM(ITrans.COSTAMOUNTPOSTED)+SUM(Itrans.CostamountAdjustment) as CostAmount,
	COUNT(*) as Cnt
	 from InventTrans ITrans, Inventtable ITable
	 where ITrans.ITEMID = ITable.ITEMID and ITrans.DATAAREAID = ITable.DATAAREAID
	 group by ITrans.ITEMID, ITable.itemname, dbo.LP_Year_Mth(ITrans.DATEFINANCIAL)
	 order by ITrans.ITEMID, dbo.LP_Year_Mth(ITrans.DATEFINANCIAL)