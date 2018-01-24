delete from DC_SGInvoiceHeader where DC_SGExternalVoucher <> '0247347'
delete from DC_SGInvoiceLine DC_SGExternalVoucher <> '0247347'


create view LLU_TmpDC_SGinvoiceline as
select top 100 SGITEMID, QTY, Price, SGEXTERNALVOUCHER, ITEMNAME,
	(select top 1 ITEMID from dbo.CUSTVENDEXTERNALITEM
			where moduletype = 3 and externalitemid = DC_SGinvoiceline.SGITEMID) as LookupITEMID,
	(select itemname from inventtable where itemid = (select top 1 ITEMID from dbo.CUSTVENDEXTERNALITEM
			where moduletype = 3 and externalitemid = DC_SGinvoiceline.SGITEMID)) as LookupITEMName,
	(select PONUMBER_1 from DC_SGinvoiceheader where SGEXTERNALVOUCHER = DC_SGinvoiceline.SGEXTERNALVOUCHER) AS PONumber,
	(select CONNECTIONID from DC_SGinvoiceheader where SGEXTERNALVOUCHER = DC_SGinvoiceline.SGEXTERNALVOUCHER) AS Connection,
	(select top 1 QtyOrdered from Purchline where purchid = right(replicate(' ',20)+(select PONUMBER_1 from DC_SGinvoiceheader where SGEXTERNALVOUCHER = DC_SGinvoiceline.SGEXTERNALVOUCHER),20)
									    and itemid = (select top 1 ITEMID from dbo.CUSTVENDEXTERNALITEM
			where moduletype = 3 and externalitemid = DC_SGinvoiceline.SGITEMID)) AS PO_QtyOrdered --right(replicate(' ',20)+'70000017',20)
 from DC_SGinvoiceline

select SGITEMID, QTY, Price, SGEXTERNALVOUCHER, ITEMNAME, lookupitemid, PO_QtyOrdered, PONumber from LLU_TmpDC_SGinvoiceline 
	where ponumber = '70000016' order by lookupitemid

select top 100 * from Purchline where purchid = right(replicate(' ',20)+'70000017',20)

select top 5 * from DC_SGinvoiceline
select count(*) as cnt, SGEXTERNALVOUCHER from DC_SGinvoiceheader group by SGEXTERNALVOUCHER order by cnt DESC
