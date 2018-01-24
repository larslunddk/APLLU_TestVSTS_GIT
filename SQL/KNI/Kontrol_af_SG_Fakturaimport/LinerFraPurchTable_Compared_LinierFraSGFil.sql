declare @Purch varchar(20)
select @Purch = '70000016'

select purchline.itemid, purchline.QtyOrdered, purchline.purchprice, purchline.lineamount, 
	   SGIL.lookupitemid,SGIL.QTY, SGIL.Price, sgil.itemname
from purchline 
	inner join LLU_TmpDC_SGinvoiceline SGIL ON SGIL.ponumber = ltrim(purchline.purchid) 
										   and SGIL.lookupitemid = purchline.itemid
where ltrim(Purchline.purchid) = @Purch and PurchLine.dataareaid = 'kni' 
order by PurchLine.itemid
-------------------------------------------------------------------------------------------------------
select 'Findes ikke i SG fil',purchline.itemid, purchline.QtyOrdered, purchline.purchprice, purchline.lineamount  
from purchline 
where ltrim(Purchline.purchid) = @Purch and PurchLine.dataareaid = 'kni' 
and   not exists (select * from LLU_TmpDC_SGinvoiceline SGIL where SGIL.ponumber = ltrim(purchline.purchid) 
										   and SGIL.lookupitemid = purchline.itemid)
order by PurchLine.itemid
-------------------------------------------------------------------------------------------------------
select 'Findes ikke i PurchLine',SGIL.PONumber, SGIL.lookupitemid,SGIL.QTY, SGIL.Price, sgil.itemname
from LLU_TmpDC_SGinvoiceline SGIL 
where SGIL.ponumber = @Purch 
	and not exists (select * from purchline where ltrim(purchid) = SGIL.PONumber and itemid = SGIL.lookupitemid)
order by SGIL.lookupitemid