drop table dbo.ledgertrans 
select * into LLUTmp2.dbo.ledgertrans 
	from devsql.AX40SP2_KNI_UDV.dbo.ledgertrans as lt
	--where lt.accountnum = replicate(' ',20-4)+'1100'
	
select count(*) From dbo.ledgertrans
select count(*) From devsql.AX40SP2_KNI_UDV.dbo.ledgertrans
select top 100 * from devsql.AX40SP2_KNI_UDV.dbo.ledgertrans as lt

--select top 5 * from devsql.AX40SP2_KNI_UDV.dbo.ledgertrans