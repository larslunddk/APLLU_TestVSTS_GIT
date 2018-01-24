--select count(*) from batch
--select min(startdatetime) from batch
select top 100 * from batch order by STARTDATETIME --where STARTDATETIME = '19000101'
select top 100 * from batch where not exists(select 1 from batchjob where batchjob.RECID = Batch.BATCHJOBID)