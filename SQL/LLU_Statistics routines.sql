--Specify the name of the database to count in the following line
USE axdb_lp;
GO
SELECT o.name AS "Table Name", i.rowcnt AS "Row Count"
FROM sysobjects o, sysindexes i
WHERE i.id = o.id
AND indid IN(0,1)
AND xtype = 'u' 
AND o.name <> 'sysdiagrams' 
ORDER BY i.rowcnt DESC
COMPUTE SUM(i.rowcnt);
GO

select * from sysindexes
select * from sys.indexes
sp_helpstats 'ledgertrans', 'ALL'
dbcc show_statistics ("ledgertrans",I_225ACDATE)
select * from sys.dm_db_index_usage_stats

SELECT   OBJECT_NAME(S.[OBJECT_ID]) AS [OBJECT NAME], 
         I.[NAME] AS [INDEX NAME], 
         USER_SEEKS, 
         USER_SCANS, 
         USER_LOOKUPS, 
         USER_UPDATES 
FROM     SYS.DM_DB_INDEX_USAGE_STATS AS S 
         INNER JOIN SYS.INDEXES AS I 
           ON I.[OBJECT_ID] = S.[OBJECT_ID] 
              AND I.INDEX_ID = S.INDEX_ID 
WHERE    OBJECTPROPERTY(S.[OBJECT_ID],'IsUserTable') = 1
order by user_updates desc
--Notes
--The values for these counters get reset each time you restart SQL Server.  
--In addition, the values for the data returned by sys.dm_db_index_operational_stats exists 
--only as long as the metadata cache object that represents the heap or index is available.


