--Regenerate workers

--Step 1 Extract relevant tables into Regenerate table
select * into [DeletedWorkers_Regenerate3].dbo.HCMWorker from [UAT_AX2012].dbo.HCMWorker
select * into [DeletedWorkers_Regenerate3].dbo.HCMPositionworkerAssignment from [UAT_AX2012].dbo.HCMPositionworkerAssignment
--0	select * into [DeletedWorkers_Regenerate2].dbo.PayrollWorkerGarnishmentComment from [UAT_AX2012].dbo.PayrollWorkerGarnishmentComment
--0	select * into [DeletedWorkers_Regenerate2].dbo.PayrollWorkerGarnishmentRule from [UAT_AX2012].dbo.PayrollWorkerGarnishmentRule
--0	select * into [DeletedWorkers_Regenerate2].dbo.ProjPeriodEmpl from [UAT_AX2012].dbo.ProjPeriodEmpl
--0	select * into [DeletedWorkers_Regenerate2].dbo.HRMAbsenceTable from [UAT_AX2012].dbo.HRMAbsenceTable
--0	select * into [DeletedWorkers_Regenerate2].dbo.HcmDiscussion from [UAT_AX2012].dbo.HcmDiscussion
select * into [DeletedWorkers_Regenerate3].dbo.HcmEmployment from [UAT_AX2012].dbo.HcmEmployment
--0	select * into [DeletedWorkers_Regenerate2].dbo.HcmGoal from [UAT_AX2012].dbo.HcmGoal
--0	select * into [DeletedWorkers_Regenerate2].dbo.HcmLoanItem from [UAT_AX2012].dbo.HcmLoanItem
--0	select * into [DeletedWorkers_Regenerate2].dbo.HcmWorkerBankAccount from [UAT_AX2012].dbo.HcmWorkerBankAccount
--0	select * into [DeletedWorkers_Regenerate2].dbo.HcmWorkerEnrolledBenefit from [UAT_AX2012].dbo.HcmWorkerEnrolledBenefit
select * into [DeletedWorkers_Regenerate3].dbo.HcmWorkerPrimaryPosition from [UAT_AX2012].dbo.HcmWorkerPrimaryPosition
select * into [DeletedWorkers_Regenerate3].dbo.HcmWorkerTitle from [UAT_AX2012].dbo.HcmWorkerTitle

--Step 2 - Import from Excel into DeletedWorkers_Regenerate - create field for LinkedRecId
--Step 3 - Update recId from Regenerate table
update [DeletedWorkers_Regenerate].dbo.DeletedWorkersList 
	SET [DeletedWorkers_Regenerate].dbo.DeletedWorkersList.LinkedRecId = (select recid from [DeletedWorkers_Regenerate2] where [DeletedWorkers_Regenerate2].[PERSONNELNUMBER] = [DeletedWorkers_Regenerate].dbo.DeletedWorkersList.[Worker ID])

--Step 4 - Cleanup non-used records
delete from [DeletedWorkers_Regenerate3].dbo.HCMWorker
 where not exists (select 1 from [DeletedWorkers_Regenerate].dbo.DeletedWorkersList 
      where [DeletedWorkers_Regenerate].dbo.DeletedWorkersList.[Worker ID] = [DeletedWorkers_Regenerate3].dbo.HCMWorker.PERSONNELNUMBER)
delete from [DeletedWorkers_Regenerate3].dbo.HCMPositionworkerAssignment
 where not exists (select 1 from [DeletedWorkers_Regenerate].dbo.DeletedWorkersList 
      where [DeletedWorkers_Regenerate].dbo.DeletedWorkersList.linkedRecId = [DeletedWorkers_Regenerate3].dbo.HCMPositionworkerAssignment.WORKER)
delete from [DeletedWorkers_Regenerate3].dbo.HcmEmployment
 where not exists (select 1 from [DeletedWorkers_Regenerate].dbo.DeletedWorkersList 
      where [DeletedWorkers_Regenerate].dbo.DeletedWorkersList.linkedRecId = [DeletedWorkers_Regenerate3].dbo.HcmEmployment.WORKER)
delete from [DeletedWorkers_Regenerate3].dbo.HcmWorkerPrimaryPosition
 where not exists (select 1 from [DeletedWorkers_Regenerate].dbo.DeletedWorkersList 
      where [DeletedWorkers_Regenerate].dbo.DeletedWorkersList.linkedRecId = [DeletedWorkers_Regenerate3].dbo.HcmWorkerPrimaryPosition.WORKER)
delete from [DeletedWorkers_Regenerate3].dbo.HcmWorkerTitle
 where not exists (select 1 from [DeletedWorkers_Regenerate].dbo.DeletedWorkersList 
      where [DeletedWorkers_Regenerate].dbo.DeletedWorkersList.linkedRecId = [DeletedWorkers_Regenerate3].dbo.HcmWorkerTitle.WORKER)
-- ALL DONE 


--CLEANUP - for NON-DK01 workers
select top 10000 Reg_HCMWorker.PERSONNELNUMBER, _DIRPARTYTABLE.NAME, _DIRADDRESSBOOK.NAME from [DeletedWorkers_Regenerate4].dbo.HCMWorker Reg_HCMWorker
join SUPPORT_AX2012.dbo.DIRPARTYTABLE _DIRPARTYTABLE on
_DIRPARTYTABLE.recid = Reg_HCMWorker.PERSON
join SUPPORT_AX2012.dbo.DIRADDRESSBOOKPARTYVIEW _DIRADDRESSBOOKPARTYVIEW on
Reg_HCMWorker.PERSON = _DIRADDRESSBOOKPARTYVIEW.PARTY
join SUPPORT_AX2012.dbo.DIRADDRESSBOOK _DIRADDRESSBOOK on
_DIRADDRESSBOOK.RECID = _DIRADDRESSBOOKPARTYVIEW.ADDRESSBOOK
	where not exists (select 1 from SUPPORT_AX2012.dbo.HCMWorker SUP_HCMWorker where SUP_HCMWorker.RECID = Reg_HCMWorker.RECID)
	and _DIRADDRESSBOOK.NAME <> 'DK01'  
order by _DIRADDRESSBOOK.NAME, Reg_HCMWorker.PERSONNELNUMBER

select top 10000 Reg_HCMWorker.PERSONNELNUMBER, _DIRPARTYTABLE.NAME, _DIRADDRESSBOOK.NAME from [DeletedWorkers_Regenerate5].dbo.HCMWorker Reg_HCMWorker
join SUPPORT_AX2012.dbo.DIRPARTYTABLE _DIRPARTYTABLE on
_DIRPARTYTABLE.recid = Reg_HCMWorker.PERSON
join SUPPORT_AX2012.dbo.DIRADDRESSBOOKPARTYVIEW _DIRADDRESSBOOKPARTYVIEW on
Reg_HCMWorker.PERSON = _DIRADDRESSBOOKPARTYVIEW.PARTY
join SUPPORT_AX2012.dbo.DIRADDRESSBOOK _DIRADDRESSBOOK on
_DIRADDRESSBOOK.RECID = _DIRADDRESSBOOKPARTYVIEW.ADDRESSBOOK
	where not exists (select 1 from SUPPORT_AX2012.dbo.HCMWorker SUP_HCMWorker where SUP_HCMWorker.RECID = Reg_HCMWorker.RECID)
	AND   not exists (select 1 from SUPPORT_AX2012.dbo.HCMWorker SUP_HCMWorker where SUP_HCMWorker.PERSONNELNUMBER = Reg_HCMWorker.PERSONNELNUMBER)
	--AND   not exists (select 1 from SUPPORT_AX2012.dbo.HCMWorker SUP_HCMWorker where SUP_HCMWorker.PERSON = Reg_HCMWorker.PERSON)
	and _DIRADDRESSBOOK.NAME <> 'DK01'  
order by _DIRADDRESSBOOK.NAME, Reg_HCMWorker.PERSONNELNUMBER

-- Move workers to new table
/*
select * into [DeletedWorkers_Regenerate5].dbo.HCMWorker from [DeletedWorkers_Regenerate4].dbo.HCMWorker
select * into [DeletedWorkers_Regenerate5].dbo.HCMPositionworkerAssignment from [DeletedWorkers_Regenerate4].dbo.HCMPositionworkerAssignment
select * into [DeletedWorkers_Regenerate5].dbo.HcmEmployment from [DeletedWorkers_Regenerate4].dbo.HcmEmployment
select * into [DeletedWorkers_Regenerate5].dbo.HcmWorkerPrimaryPosition from [DeletedWorkers_Regenerate4].dbo.HcmWorkerPrimaryPosition
select * into [DeletedWorkers_Regenerate5].dbo.HcmWorkerTitle from [DeletedWorkers_Regenerate4].dbo.HcmWorkerTitle
*/



--Alter tablename in PROD DeletedWorkers_Regenerate3_LarsLund to DeletedWorkers_Regenerate3
insert into [SUPPORT_AX2012].dbo.HCMWorker  select * from [DeletedWorkers_Regenerate3].dbo.HCMWorker  where not exists (select 1 from [SUPPORT_AX2012].dbo.HCMWorker t1 where t1.recid = [DeletedWorkers_Regenerate3].dbo.HCMWorker.recid)
insert into [SUPPORT_AX2012].dbo.HCMPositionworkerAssignment  select * from [DeletedWorkers_Regenerate3].dbo.HCMPositionworkerAssignment  where not exists (select 1 from [SUPPORT_AX2012].dbo.HCMPositionworkerAssignment t1 where t1.recid = [DeletedWorkers_Regenerate3].dbo.HCMPositionworkerAssignment.recid)
insert into [SUPPORT_AX2012].dbo.HcmEmployment  select * from [DeletedWorkers_Regenerate3].dbo.HcmEmployment  where not exists (select 1 from [SUPPORT_AX2012].dbo.HcmEmployment t1 where t1.recid = [DeletedWorkers_Regenerate3].dbo.HcmEmployment.recid)
insert into [SUPPORT_AX2012].dbo.HcmWorkerPrimaryPosition  select * from [DeletedWorkers_Regenerate3].dbo.HcmWorkerPrimaryPosition  where not exists (select 1 from [SUPPORT_AX2012].dbo.HcmWorkerPrimaryPosition t1 where t1.recid = [DeletedWorkers_Regenerate3].dbo.HcmWorkerPrimaryPosition.recid)
insert into [SUPPORT_AX2012].dbo.HcmWorkerTitle  select * from [DeletedWorkers_Regenerate3].dbo.HcmWorkerTitle  where not exists (select 1 from [SUPPORT_AX2012].dbo.HcmWorkerTitle t1 where t1.recid = [DeletedWorkers_Regenerate3].dbo.HcmWorkerTitle.recid)

select HCMWorker.recid, personnelnumber,HCMWorker.PERSON, FIRSTNAME, MIDDLENAME, LASTNAME from [SUPPORT_AX2012].dbo.HCMWorker 
	join DIRPERSONNAME on DIRPERSONNAME.PERSON = HCMWorker.PERSON
	where PERSONNELNUMBER = '008522' or PERSONNELNUMBER = '008352'
select HCMWorker.recid, personnelnumber,HCMWorker.PERSON, FIRSTNAME, MIDDLENAME, LASTNAME from [DeletedWorkers_Regenerate3].dbo.HCMWorker 
	join DIRPERSONNAME on DIRPERSONNAME.PERSON = HCMWorker.PERSON
	where PERSONNELNUMBER = '006166' or PERSONNELNUMBER = '006928'

-- Personnel number 006928 -> 008352 Alexander Lundsgaard
-- Personnel number 006166 -> 008522 Signe Søgaard Hansen
select * from DIRPERSONNAME where PERSON = 5637224101


/*
select * from HCMWORKER where PARTITION = 5637144576 and  person = 5637224101
select * from HCMWORKER where PARTITION = 5637144576 and  person = 5637296080
delete from [DeletedWorkers_Regenerate3].dbo.HCMWorker where PARTITION = 5637144576 and  person = 5637224101 --PersonnelNumber 008522
delete from [DeletedWorkers_Regenerate3].dbo.HCMWORKER where PARTITION = 5637144576 and  person = 5637296080 --PersonnelNumber 008352

update [DeletedWorkers_Regenerate3].dbo.HCMPositionworkerAssignment set validto = '2017-10-15 21:59:59.000'
*/