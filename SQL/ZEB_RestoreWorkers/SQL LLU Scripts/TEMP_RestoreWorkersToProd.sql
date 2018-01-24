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


--Alter tablename in PROD DeletedWorkers_Regenerate3_LarsLund to DeletedWorkers_Regenerate3
insert into [AX2012_PROD].dbo.HCMWorker  select * from [DeletedWorkers_Regenerate3].dbo.HCMWorker  where not exists (select 1 from [AX2012_PROD].dbo.HCMWorker t1 where t1.recid = [DeletedWorkers_Regenerate3].dbo.HCMWorker.recid)
insert into [AX2012_PROD].dbo.HCMPositionworkerAssignment  select * from [DeletedWorkers_Regenerate3].dbo.HCMPositionworkerAssignment  where not exists (select 1 from [AX2012_PROD].dbo.HCMPositionworkerAssignment t1 where t1.recid = [DeletedWorkers_Regenerate3].dbo.HCMPositionworkerAssignment.recid)
insert into [AX2012_PROD].dbo.HcmEmployment  select * from [DeletedWorkers_Regenerate3].dbo.HcmEmployment  where not exists (select 1 from [AX2012_PROD].dbo.HcmEmployment t1 where t1.recid = [DeletedWorkers_Regenerate3].dbo.HcmEmployment.recid)
insert into [AX2012_PROD].dbo.HcmWorkerPrimaryPosition  select * from [DeletedWorkers_Regenerate3].dbo.HcmWorkerPrimaryPosition  where not exists (select 1 from [AX2012_PROD].dbo.HcmWorkerPrimaryPosition t1 where t1.recid = [DeletedWorkers_Regenerate3].dbo.HcmWorkerPrimaryPosition.recid)
insert into [AX2012_PROD].dbo.HcmWorkerTitle  select * from [DeletedWorkers_Regenerate3].dbo.HcmWorkerTitle  where not exists (select 1 from [AX2012_PROD].dbo.HcmWorkerTitle t1 where t1.recid = [DeletedWorkers_Regenerate3].dbo.HcmWorkerTitle.recid)

