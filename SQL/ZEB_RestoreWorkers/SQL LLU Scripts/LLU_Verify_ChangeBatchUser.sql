--########### Detect batchjob where usernames differs between Batchjob and batchtask

select batchjob.recid, batch.EXECUTEDBY,batch.CREATEDBY, batchjob.CREATEDBY, dbo.enum2str('batchstatus', batchjob.status) as JobStatus,
batchjob.caption, * from batchjob
	join batch on
	batch.BATCHJOBID = batchjob.RECID
where (batch.CREATEDBY <> batchjob.CREATEDBY
or	  batch.EXECUTEDBY <> batchjob.CREATEDBY)
and batchjob.CAPTION <> 'Lasernet tasks'


--########### Correct batchjobs where usernames differs between Batchjob and batchtask
declare @BatchRecId bigint
declare @BatchNewUser nvarchar(100) = 'SA_P_BAT'
--select top 100 * from BATCHJOB where caption like  '%min job%'
--select @BatchRecId = recid from BATCHJOB where caption like  '%min job%'
select @BatchRecId = 5637391438
--select @BatchRecId
update [BATCHJOB] set CREATEDBY = @BatchNewUser where RECID = @BatchRecId
update [BATCH] set EXECUTEDBY = @BatchNewUser, CREATEDBY = @BatchNewUser where BATCHJOBID = @BatchRecId
update [BATCHCONSTRAINTS] set  CREATEDBY = @BatchNewUser 
	where exists (select 1 from batch where batch.recid = batchconstraints.batchid and batch.BATCHJOBID = @BatchRecId)

--update [BATCHJOB] set CREATEDBY = 'frege' where RECID = @BatchRecId
--update [BATCH] set EXECUTEDBY = 'frege', CREATEDBY = 'frege' where BATCHJOBID = @BatchRecId
