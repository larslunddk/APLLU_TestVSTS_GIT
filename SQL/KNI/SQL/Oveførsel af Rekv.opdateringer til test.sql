use AX40_KNI_COPY
delete from dbo.RCMSUPFOORDERS where 
	dataareaid = 'kni' 
	and exists (select * from DC_CONVERTFO_PURCHRELATIONS where DC_CONVERTFO_PURCHRELATIONS.RCMSUPFOORDERID = RCMSUPFOORDERS.ORDERID)
delete from dbo.RCMSUPFOORDERTRANS where 
	dataareaid = 'kni' and
	exists (select * from DC_CONVERTFO_PURCHRELATIONS where DC_CONVERTFO_PURCHRELATIONS.RCMSUPFOORDERID = RCMSUPFOORDERTRANS.ORDERID)

delete from dbo.DC_PURCHPROPOSALLINE where 
	dataareaid = 'kni' and
	DC_PURCHPROPOSALLINE.EmplId = 'IMPORT'
GO
delete from dbo.DC_PURCHPROPOSALLINE where 
	dataareaid = 'kni' --and
	--DC_PURCHPROPOSALLINE.EmplId = ''

delete from dbo.DC_CONVERTFO_PURCHRELATIONS where 
	dataareaid = 'kni'


select top 100 * from DC_PURCHPROPOSALLINE

insert into dbo.RCMSUPFOORDERS select * from AX40_KNI_DRIFT.dbo.RCMSUPFOORDERS
	where AX40_KNI_DRIFT.dbo.RCMSUPFOORDERS.dataareaid = 'kni'
insert into  dbo.RCMSUPFOORDERTRANS select * from AX40_KNI_DRIFT.dbo.RCMSUPFOORDERTRANS
	where AX40_KNI_DRIFT.dbo.RCMSUPFOORDERTRANS.dataareaid = 'kni'
insert into  dbo.DC_PURCHPROPOSALLINE select * from AX40_KNI_DRIFT.dbo.DC_PURCHPROPOSALLINE
	where AX40_KNI_DRIFT.dbo.DC_PURCHPROPOSALLINE.dataareaid = 'kni'
insert into dbo.DC_CONVERTFO_PURCHRELATIONS select * from AX40_KNI_DRIFT.dbo.DC_CONVERTFO_PURCHRELATIONS
	where AX40_KNI_DRIFT.dbo.DC_CONVERTFO_PURCHRELATIONS.dataareaid = 'kni'

select count(*) from RCMSUPFOORDERS
select count(*) from RCMSUPFOORDERTRANS
select count(*) from DC_PURCHPROPOSALLINE
select count(*) from DC_CONVERTFO_PURCHRELATIONS

--delete from RCMSUPFOORDERS
--delete from RCMSUPFOORDERTRANS
--delete from DC_PURCHPROPOSALLINE
--delete from DC_CONVERTFO_PURCHRELATIONS