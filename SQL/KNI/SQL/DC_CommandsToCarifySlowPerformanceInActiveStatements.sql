select r.session_id
           ,status
           ,substring(qt.text,r.statement_start_offset/2, 
                   (case when r.statement_end_offset = -1 
                   then len(convert(nvarchar(max), qt.text)) * 2 
                   else r.statement_end_offset end - r.statement_start_offset)/2) 
           as query_text   --- this is the statement executing right now
           ,qt.dbid
           ,qt.objectid
           ,r.cpu_time
           ,r.total_elapsed_time
           ,r.reads
           ,r.writes
           ,r.logical_reads
           ,r.scheduler_id
,r.plan_handle
from sys.dm_exec_requests r
cross apply sys.dm_exec_sql_text(sql_handle) as qt
where r.session_id > 50
order by r.scheduler_id, r.status, r.session_id
--kill 88
/*
exec sp_who;

SELECT * FROM sys.dm_exec_requests
WHERE session_id = 52;

SELECT * FROM sys.dm_exec_query_plan (0x0600070076B2402E40E38190020000000000000000000000)
*/
/*
USE master;
GO
SELECT * FROM sys.dm_exec_cached_plans cp CROSS APPLY sys.dm_exec_query_plan(cp.plan_handle);
*/

--SELECT * FROM sys.dm_exec_query_plan (0x0600070076B2402E40E38190020000000000000000000000)