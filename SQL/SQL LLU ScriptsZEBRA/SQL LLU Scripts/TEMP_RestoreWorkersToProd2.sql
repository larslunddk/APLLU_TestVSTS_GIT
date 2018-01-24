select count(*) as HCMWorker from [DeletedWorkers_Regenerate5].[dbo].[HCMWorker]
-- Refresh [DeletedWorkers_Regenerate5]
---------------------------------------
/*drop table [DeletedWorkers_Regenerate5].dbo.HCMWorker
drop table [DeletedWorkers_Regenerate5].dbo.HCMPositionworkerAssignment
drop table [DeletedWorkers_Regenerate5].dbo.HcmEmployment
drop table [DeletedWorkers_Regenerate5].dbo.HcmWorkerPrimaryPosition
drop table [DeletedWorkers_Regenerate5].dbo.HcmWorkerTitle

select * into [DeletedWorkers_Regenerate5].dbo.HCMWorker from [DeletedWorkers_Regenerate4_Full].dbo.HCMWorker
select * into [DeletedWorkers_Regenerate5].dbo.HCMPositionworkerAssignment from [DeletedWorkers_Regenerate4_Full].dbo.HCMPositionworkerAssignment
select * into [DeletedWorkers_Regenerate5].dbo.HcmEmployment from [DeletedWorkers_Regenerate4_Full].dbo.HcmEmployment
select * into [DeletedWorkers_Regenerate5].dbo.HcmWorkerPrimaryPosition from [DeletedWorkers_Regenerate4_Full].dbo.HcmWorkerPrimaryPosition
select * into [DeletedWorkers_Regenerate5].dbo.HcmWorkerTitle from [DeletedWorkers_Regenerate4_Full].dbo.HcmWorkerTitle
*/

select 'after',count(*) from [DeletedWorkers_Regenerate5].dbo.HCMWorker
select PERSONNELNUMBER from [DeletedWorkers_Regenerate5].dbo.HCMWorker
begin tran
-- find 2 employees that belongs to DK01 and a NON-DK01 organisation
--------------------------------------------------------------------
/*select count(*) /*HCMWorker.PERSONNELNUMBER*/  from [DeletedWorkers_Regenerate5].dbo.HCMWorker HCMWorker
	where  exists (select 1 from SUPPORT_AX2012.dbo.DIRPARTYTABLE _DIRPARTYTABLE 
				join SUPPORT_AX2012.dbo.DIRADDRESSBOOKPARTYVIEW _DIRADDRESSBOOKPARTYVIEW on
					HCMWorker.PERSON = _DIRADDRESSBOOKPARTYVIEW.PARTY
				join SUPPORT_AX2012.dbo.DIRADDRESSBOOK _DIRADDRESSBOOK on
					_DIRADDRESSBOOK.RECID = _DIRADDRESSBOOKPARTYVIEW.ADDRESSBOOK
				where
					_DIRPARTYTABLE.recid = HCMWorker.PERSON
				and (HCMWorker.PERSONNELNUMBER = '003681' or HCMWorker.PERSONNELNUMBER = '003682'))
*/

-- Delete all DK01 workers from regenerate table (and existing in as persons (dirparty) in PROD)
------------------------------------------------
--select 'delete DK existing',PERSONNELNUMBER from [DeletedWorkers_Regenerate5].dbo.HCMWorker 
delete from [DeletedWorkers_Regenerate5].dbo.HCMWorker 
	where  exists (select 1 from SUPPORT_AX2012.dbo.DIRPARTYTABLE _DIRPARTYTABLE 
				join SUPPORT_AX2012.dbo.DIRADDRESSBOOKPARTYVIEW _DIRADDRESSBOOKPARTYVIEW on
					[DeletedWorkers_Regenerate5].dbo.HCMWorker.PERSON = _DIRADDRESSBOOKPARTYVIEW.PARTY
				join SUPPORT_AX2012.dbo.DIRADDRESSBOOK _DIRADDRESSBOOK on
					_DIRADDRESSBOOK.RECID = _DIRADDRESSBOOKPARTYVIEW.ADDRESSBOOK
				where
					_DIRPARTYTABLE.recid = [DeletedWorkers_Regenerate5].dbo.HCMWorker.PERSON
				and _DIRADDRESSBOOK.NAME <> 'DK01')
	and  exists (select 1 from SUPPORT_AX2012.dbo.HCMWorker SUP_HCMWorker where SUP_HCMWorker.RECID = [DeletedWorkers_Regenerate5].dbo.HCMWorker.RECID)


-- Delete all non-DK01 workers from regenerate table that exists in PROD
------------------------------
select 'delete non-DK existing',PERSONNELNUMBER from [DeletedWorkers_Regenerate5].dbo.HCMWorker
	where  exists (select 1 from SUPPORT_AX2012.dbo.DIRPARTYTABLE _DIRPARTYTABLE 
				join SUPPORT_AX2012.dbo.DIRADDRESSBOOKPARTYVIEW _DIRADDRESSBOOKPARTYVIEW on
					[DeletedWorkers_Regenerate5].dbo.HCMWorker.PERSON = _DIRADDRESSBOOKPARTYVIEW.PARTY
				join SUPPORT_AX2012.dbo.DIRADDRESSBOOK _DIRADDRESSBOOK on
					_DIRADDRESSBOOK.RECID = _DIRADDRESSBOOKPARTYVIEW.ADDRESSBOOK
				where
					_DIRPARTYTABLE.recid = [DeletedWorkers_Regenerate5].dbo.HCMWorker.PERSON
				and _DIRADDRESSBOOK.NAME <> 'DK01')
	and  exists (select 1 from SUPPORT_AX2012.dbo.HCMWorker SUP_HCMWorker where SUP_HCMWorker.RECID = [DeletedWorkers_Regenerate5].dbo.HCMWorker.RECID)
	
select 'delete',PERSONNELNUMBER from [DeletedWorkers_Regenerate5].dbo.HCMWorker
	where  not exists (select 1 from SUPPORT_AX2012.dbo.DIRPARTYTABLE _DIRPARTYTABLE 
				join SUPPORT_AX2012.dbo.DIRADDRESSBOOKPARTYVIEW _DIRADDRESSBOOKPARTYVIEW on
					[DeletedWorkers_Regenerate5].dbo.HCMWorker.PERSON = _DIRADDRESSBOOKPARTYVIEW.PARTY
				join SUPPORT_AX2012.dbo.DIRADDRESSBOOK _DIRADDRESSBOOK on
					_DIRADDRESSBOOK.RECID = _DIRADDRESSBOOKPARTYVIEW.ADDRESSBOOK
				where
					_DIRPARTYTABLE.recid = [DeletedWorkers_Regenerate5].dbo.HCMWorker.PERSON
				and _DIRADDRESSBOOK.NAME <> 'DK01')
	--and  exists (select 1 from SUPPORT_AX2012.dbo.HCMWorker SUP_HCMWorker where SUP_HCMWorker.RECID = [DeletedWorkers_Regenerate5].dbo.HCMWorker.RECID)


select 'after',count(*) from [DeletedWorkers_Regenerate5].dbo.HCMWorker
rollback tran



select 'Regenerate',PERSONNELNUMBER, _DIRADDRESSBOOK.NAME,NAMEALIAS from [DeletedWorkers_Regenerate5].dbo.HCMWorker 
				join SUPPORT_AX2012.dbo.DIRPARTYTABLE _DIRPARTYTABLE on
					_DIRPARTYTABLE.recid = [DeletedWorkers_Regenerate5].dbo.HCMWorker.PERSON
				join SUPPORT_AX2012.dbo.DIRADDRESSBOOKPARTYVIEW _DIRADDRESSBOOKPARTYVIEW on
					[DeletedWorkers_Regenerate5].dbo.HCMWorker.PERSON = _DIRADDRESSBOOKPARTYVIEW.PARTY
				join SUPPORT_AX2012.dbo.DIRADDRESSBOOK _DIRADDRESSBOOK on
					_DIRADDRESSBOOK.RECID = _DIRADDRESSBOOKPARTYVIEW.ADDRESSBOOK
	where
		not exists (select 1 from SUPPORT_AX2012.dbo.HCMWorker SUP_HCMWorker where SUP_HCMWorker.RECID = [DeletedWorkers_Regenerate5].dbo.HCMWorker.RECID)



/*select 'Regenerate',PERSONNELNUMBER, _DIRADDRESSBOOK.NAME, NAMEALIAS from [DeletedWorkers_Regenerate5].dbo.HCMWorker 
				join SUPPORT_AX2012.dbo.DIRPARTYTABLE _DIRPARTYTABLE on
					_DIRPARTYTABLE.recid = [DeletedWorkers_Regenerate5].dbo.HCMWorker.PERSON
				join SUPPORT_AX2012.dbo.DIRADDRESSBOOKPARTYVIEW _DIRADDRESSBOOKPARTYVIEW on
					[DeletedWorkers_Regenerate5].dbo.HCMWorker.PERSON = _DIRADDRESSBOOKPARTYVIEW.PARTY
				join SUPPORT_AX2012.dbo.DIRADDRESSBOOK _DIRADDRESSBOOK on
					_DIRADDRESSBOOK.RECID = _DIRADDRESSBOOKPARTYVIEW.ADDRESSBOOK
	where
		_DIRADDRESSBOOK.NAME <> 'DK01'
	and  not exists (select 1 from SUPPORT_AX2012.dbo.HCMWorker SUP_HCMWorker where SUP_HCMWorker.RECID = [DeletedWorkers_Regenerate5].dbo.HCMWorker.RECID)
*/	