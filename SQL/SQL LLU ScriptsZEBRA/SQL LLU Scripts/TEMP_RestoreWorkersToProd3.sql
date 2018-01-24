/*delete from [DeletedWorkers_Regenerate5].dbo.HCMWorker
 where not exists (select 1 from [DeletedWorkers_Regenerate].dbo.DeletedWorkersList 
      where [DeletedWorkers_Regenerate].dbo.DeletedWorkersList.[Worker ID] = [DeletedWorkers_Regenerate5].dbo.HCMWorker.PERSONNELNUMBER)
*/
delete from [DeletedWorkers_Regenerate5].dbo.HCMPositionworkerAssignment _HCMPositionworkerAssignment
	where not exists (select 1 from [DeletedWorkers_Regenerate5].dbo.HCMWorker _HCMWorker where _HCMWorker.recid = _HCMPositionworkerAssignment.Worker)



delete from [DeletedWorkers_Regenerate5].dbo.HCMPositionworkerAssignment
 where not exists (select 1 from [DeletedWorkers_Regenerate].dbo.DeletedWorkersList 
      where [DeletedWorkers_Regenerate].dbo.DeletedWorkersList.linkedRecId = [DeletedWorkers_Regenerate5].dbo.HCMPositionworkerAssignment.WORKER)

delete from [DeletedWorkers_Regenerate5].dbo.HcmEmployment
 where not exists (select 1 from [DeletedWorkers_Regenerate].dbo.DeletedWorkersList 
      where [DeletedWorkers_Regenerate].dbo.DeletedWorkersList.linkedRecId = [DeletedWorkers_Regenerate5].dbo.HcmEmployment.WORKER)

delete from [DeletedWorkers_Regenerate5].dbo.HcmWorkerPrimaryPosition
 where not exists (select 1 from [DeletedWorkers_Regenerate].dbo.DeletedWorkersList 
      where [DeletedWorkers_Regenerate].dbo.DeletedWorkersList.linkedRecId = [DeletedWorkers_Regenerate5].dbo.HcmWorkerPrimaryPosition.WORKER)

delete from [DeletedWorkers_Regenerate5].dbo.HcmWorkerTitle
 where not exists (select 1 from [DeletedWorkers_Regenerate].dbo.DeletedWorkersList 
      where [DeletedWorkers_Regenerate].dbo.DeletedWorkersList.linkedRecId = [DeletedWorkers_Regenerate5].dbo.HcmWorkerTitle.WORKER)