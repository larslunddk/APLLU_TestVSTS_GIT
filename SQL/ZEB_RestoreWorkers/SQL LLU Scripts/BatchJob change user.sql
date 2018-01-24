select top 100 * from BATCHJOB where caption like  '%US01%Export%'

  update [BATCHJOB] set CREATEDBY = 'SA_N_BAT' where RECID = 5637412372
  update [BATCH] set EXECUTEDBY = 'SA_N_BAT', CREATEDBY = 'SA_N_BAT' where BATCHJOBID = 5637412372
  update [BATCHCONSTRAINTS] set  CREATEDBY = 'SA_N_BAT' 
	where exists (select 1 from batch where batch.recid = batchconstraints.batchid and batch.BATCHJOBID = 5637412372)