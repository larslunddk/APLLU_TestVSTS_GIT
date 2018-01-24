update [DeletedWorkers_Regenerate3].[dbo].[HCMPositionworkerAssignment] set VALIDTO = '2017-10-23 21:59:58.000'
update [DeletedWorkers_Regenerate5].[dbo].[HCMPositionworkerAssignment] set VALIDTO = '2017-10-23 21:59:58.000'

--insert into [AX2012_PROD].dbo.HCMWorker  select * from [DeletedWorkers_Regenerate3].dbo.HCMWorker  where not exists (select 1 from [AX2012_PROD].dbo.HCMWorker t1 where t1.recid = [DeletedWorkers_Regenerate3].dbo.HCMWorker.recid)
insert into [AX2012_PROD].dbo.HCMWorker  select * from [DeletedWorkers_Regenerate3].dbo.HCMWorker  
where (not exists (select 1 from [AX2012_PROD].dbo.HCMWorker t1 where t1.recid = [DeletedWorkers_Regenerate3].dbo.HCMWorker.recid)
	   AND
	   not exists (select 1 from [AX2012_PROD].dbo.HCMWorker t1 where t1.PERSON = [DeletedWorkers_Regenerate3].dbo.HCMWorker.PERSON))

insert into [AX2012_PROD].dbo.HCMPositionworkerAssignment  select * from [DeletedWorkers_Regenerate3].dbo.HCMPositionworkerAssignment  where not exists (select 1 from [AX2012_PROD].dbo.HCMPositionworkerAssignment t1 where t1.recid = [DeletedWorkers_Regenerate3].dbo.HCMPositionworkerAssignment.recid)
insert into [AX2012_PROD].dbo.HcmEmployment  select * from [DeletedWorkers_Regenerate3].dbo.HcmEmployment  where not exists (select 1 from [AX2012_PROD].dbo.HcmEmployment t1 where t1.recid = [DeletedWorkers_Regenerate3].dbo.HcmEmployment.recid)
insert into [AX2012_PROD].dbo.HcmWorkerPrimaryPosition  select * from [DeletedWorkers_Regenerate3].dbo.HcmWorkerPrimaryPosition  where not exists (select 1 from [AX2012_PROD].dbo.HcmWorkerPrimaryPosition t1 where t1.recid = [DeletedWorkers_Regenerate3].dbo.HcmWorkerPrimaryPosition.recid)
insert into [AX2012_PROD].dbo.HcmWorkerTitle  select * from [DeletedWorkers_Regenerate3].dbo.HcmWorkerTitle  where not exists (select 1 from [AX2012_PROD].dbo.HcmWorkerTitle t1 where t1.recid = [DeletedWorkers_Regenerate3].dbo.HcmWorkerTitle.recid)

--insert into [AX2012_PROD].dbo.HCMWorker  select * from [DeletedWorkers_Regenerate5].dbo.HCMWorker where not exists (select 1 from [AX2012_PROD].dbo.HCMWorker t1 where t1.recid = [DeletedWorkers_Regenerate5].dbo.HCMWorker.recid)
insert into [AX2012_PROD].dbo.HCMWorker  select * from [DeletedWorkers_Regenerate5].dbo.HCMWorker  
where (not exists (select 1 from [AX2012_PROD].dbo.HCMWorker t1 where t1.recid = [DeletedWorkers_Regenerate5].dbo.HCMWorker.recid)
	   AND
	   not exists (select 1 from [AX2012_PROD].dbo.HCMWorker t1 where t1.PERSON = [DeletedWorkers_Regenerate5].dbo.HCMWorker.PERSON))
insert into [AX2012_PROD].dbo.HCMPositionworkerAssignment  select * from [DeletedWorkers_Regenerate5].dbo.HCMPositionworkerAssignment  where not exists (select 1 from [AX2012_PROD].dbo.HCMPositionworkerAssignment t1 where t1.recid = [DeletedWorkers_Regenerate5].dbo.HCMPositionworkerAssignment.recid)
insert into [AX2012_PROD].dbo.HcmEmployment  select * from [DeletedWorkers_Regenerate5].dbo.HcmEmployment  where not exists (select 1 from [AX2012_PROD].dbo.HcmEmployment t1 where t1.recid = [DeletedWorkers_Regenerate5].dbo.HcmEmployment.recid)
insert into [AX2012_PROD].dbo.HcmWorkerPrimaryPosition  select * from [DeletedWorkers_Regenerate5].dbo.HcmWorkerPrimaryPosition  where not exists (select 1 from [AX2012_PROD].dbo.HcmWorkerPrimaryPosition t1 where t1.recid = [DeletedWorkers_Regenerate5].dbo.HcmWorkerPrimaryPosition.recid)
insert into [AX2012_PROD].dbo.HcmWorkerTitle  select * from [DeletedWorkers_Regenerate5].dbo.HcmWorkerTitle  where not exists (select 1 from [AX2012_PROD].dbo.HcmWorkerTitle t1 where t1.recid = [DeletedWorkers_Regenerate5].dbo.HcmWorkerTitle.recid)

