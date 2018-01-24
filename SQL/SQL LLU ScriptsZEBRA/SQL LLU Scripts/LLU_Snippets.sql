-- ############## Template for starttime, endtime, execution time
declare @d datetime = GETDATE()
select 'StartTime',@D
WAITFOR DELAY '00:00:10' 
select 'EndTime',GETDATE()
SELECT 'Exec time', 
       CONVERT(VARCHAR(8), GETDATE()-@D, 108) 'hh:mi:ss'


-- ###### LLU Helper jobs
-- ############## Show blocked sessions
select cmd,* from sys.sysprocesses
where blocked > 0

-- ############## Show sessions running on a specific AOS
select * from batch 
where STARTDATETIME>'20170421'
and status =2

-- ############## Show traceflags
dbcc tracestatus
DBCC FREEPROCCACHE

-- ############## Batch jobs
select top 100 status, dbo.enum2str('batchstatus', batch.status) as JobStatus, count(*)  from batch
group by STATUS

select batchjob.CAPTION,* from batch 
join batchjob on batchjob.RECID = batch.BATCHJOBID 
where batch.status = 2
and serverid like '%aos20%' 
order by SERVERID -- 1 = Waiting, 2 = Executing


select CAPTION, status, dbo.enum2str('batchstatus', BATCHJOB.status) as JobStatus,EXECUTIONTIMETHRESHOLDWARNING, EXECUTIONTIMETHRESHOLDERROR,STARTTIMETHRESHOLDWARNING, STARTTIMETHRESHOLDERROR
from BATCHJOB join EGBCBATCHJOB on EGBCBATCHJOB.BATCHJOB = BATCHJOB.RECID
where STATUS>=1 AND STATUS<=2

-- ############## Show sessions running on a specific AOS
select BJH.CAPTION, BH.CAPTION, BH.COMPANY, bh.SERVERID, bh.STARTDATETIME from batchhistory BH
join BATCHJOBHISTORY BJH on
BJH.RECID = BH.BATCHJOBHISTORYID
where BH.STARTDATETIME>='2017-07-13 04:00' 
and BH.STARTDATETIME<='2017-07-13 05:00'
--and BH.status =2
order by STARTDATETIME


-- ############## DELETEING batchjobhistory and related records
--delete from BATCHJOBHISTORY where STARTDATETIME<'20170410'
--delete from BATCHHISTORY where NOT EXISTS(select 1 from BATCHJOBHISTORY where BATCHJOBHISTORY.recid = BATCHHISTORY.BatchJobHistoryId)
--delete from BATCHCONSTRAINTSHISTORY where NOT EXISTS(select 1 from BATCHHISTORY where BATCHHISTORY.recid = BATCHCONSTRAINTSHISTORY.Batchid)
