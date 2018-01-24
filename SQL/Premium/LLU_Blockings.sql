CREATE TABLE #sp_who2 (SPID INT,Status VARCHAR(255),
      Login  VARCHAR(255),HostName  VARCHAR(255), 
      BlkBy  VARCHAR(255),DBName  VARCHAR(255), 
      Command VARCHAR(255),CPUTime INT, 
      DiskIO INT,LastBatch VARCHAR(255), 
      ProgramName VARCHAR(255),SPID2 INT, 
      REQUESTID INT) 
INSERT INTO #sp_who2 EXEC sp_who2

select * from #sp_who2
where exists (select 'x' from #sp_who2 _who2 where (cast(_who2.SPID as varchar(255))=#sp_who2.BlkBy))

select * from #sp_who2
where BlkBy<>'  .'

--SELECT      * 
--FROM        #sp_who2 _who1
---- Add any filtering of the results here :
--WHERE       DBName <> 'master'
--and         (BlkBy<>'' or exists (select 'x' from #sp_who2 _who2 where (cast(_who2.SPID as varchar(255))=_who1.BlkBy)))
---- Add any sorting of the results here :
--ORDER BY    DBName ASC
 
DROP TABLE #sp_who2