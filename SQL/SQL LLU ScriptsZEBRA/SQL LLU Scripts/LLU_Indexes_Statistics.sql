-- Statistics operations
DBCC freeproccache

update statistics GENERALJOURNALENTRY with fullscan
update statistics GENERALJOURNALACCOUNTENTRY with fullscan
update statistics DIMENSIONATTRIBUTEVALUECOMBINATION with fullscan


---------------------------------- FIND FRAGMENTATION
--SELECT OBJECT_NAME(ind.OBJECT_ID) AS TableName, 
--	ind.name AS IndexName, indexstats.index_type_desc AS IndexType, 
--	indexstats.avg_fragmentation_in_percent 
--FROM sys.dm_db_index_physical_stats(DB_ID(), NULL, NULL, NULL, NULL) indexstats 
--INNER JOIN sys.indexes ind  
--	ON ind.object_id = indexstats.object_id 
--	AND ind.index_id = indexstats.index_id 
--WHERE indexstats.avg_fragmentation_in_percent > 50 
--ORDER BY indexstats.avg_fragmentation_in_percent DESC



----------------------------------- FIND MISSING INDEXES
--SELECT 
--  migs.avg_total_user_cost * (migs.avg_user_impact / 100.0) * (migs.user_seeks + migs.user_scans) AS improvement_measure, 
--  'CREATE INDEX [missing_index_' + CONVERT (varchar, mig.index_group_handle) + '_' + CONVERT (varchar, mid.index_handle) 
--  + '_' + LEFT (PARSENAME(mid.statement, 1), 32) + ']'
--  + ' ON ' + mid.statement 
--  + ' (' + ISNULL (mid.equality_columns,'') 
--    + CASE WHEN mid.equality_columns IS NOT NULL AND mid.inequality_columns IS NOT NULL THEN ',' ELSE '' END 
--    + ISNULL (mid.inequality_columns, '')
--  + ')' 
--  + ISNULL (' INCLUDE (' + mid.included_columns + ')', '') AS create_index_statement, 
--  migs.*, mid.database_id, mid.[object_id]
--FROM sys.dm_db_missing_index_groups mig
--INNER JOIN sys.dm_db_missing_index_group_stats migs ON migs.group_handle = mig.index_group_handle
--INNER JOIN sys.dm_db_missing_index_details mid ON mig.index_handle = mid.index_handle
--WHERE migs.avg_total_user_cost * (migs.avg_user_impact / 100.0) * (migs.user_seeks + migs.user_scans) > 10
--AND mid.database_id = 5
--ORDER BY migs.avg_total_user_cost * migs.avg_user_impact * (migs.user_seeks + migs.user_scans) DESC

--select * from sys.databases
