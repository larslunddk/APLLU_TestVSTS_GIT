USE [LLUTmpWid]

ALTER TABLE [dbo].[InventTrans]
	ADD [CostAmount]  AS ([COSTAMOUNTPOSTED]+[COSTAMOUNTADJUSTMENT])


select top 100 itemid, sum(qty) QTY, sum(Costamount) CostAmount
into InventTransTmp
from inventtrans
group by itemid

select *,(select count(*) from inventtrans where inventtrans.itemid = InventTransTmp.itemid) as Cnt from inventtranstmp
drop table inventtranstmp