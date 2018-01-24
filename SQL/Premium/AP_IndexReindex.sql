use AXGIT3
declare @Script	nvarchar(127)
		,@dyn_cmd       nvarchar(127)

declare SysObj CURSOR FOR
	SELECT 
	'DBCC DBREINDEX ('+dbtables.[name]+')' as 'Script'
	FROM sys.dm_db_index_physical_stats (DB_ID(), NULL, NULL, NULL, NULL) AS indexstats
	INNER JOIN sys.tables dbtables on dbtables.[object_id] = indexstats.[object_id]
	INNER JOIN sys.schemas dbschemas on dbtables.[schema_id] = dbschemas.[schema_id]
	INNER JOIN sys.indexes AS dbindexes ON dbindexes.[object_id] = indexstats.[object_id]
	AND indexstats.index_id = dbindexes.index_id
	WHERE indexstats.database_id = DB_ID() and indexstats.avg_fragmentation_in_percent>30			--Only indexfragmentation over 30%
	--ORDER BY indexstats.avg_fragmentation_in_percent desc
	group by dbtables.[name]


OPEN SysObj
FETCH NEXT FROM SysObj into @Script

WHILE @@FETCH_STATUS = 0
BEGIN
	SET @dyn_cmd = @Script

	print   @dyn_cmd
    --EXECUTE(@dyn_cmd)
   	FETCH NEXT FROM SysObj into @Script
END

CLOSE SysObj
DEALLOCATE SysObj
GO


-------------- for test purpose only
	--SELECT dbschemas.[name] as 'Schema', 
	--dbtables.[name] as 'Table', 
	--dbindexes.[name] as 'Index',
	--indexstats.avg_fragmentation_in_percent,
	--indexstats.page_count,
	--'DBCC DBREINDEX ('+dbtables.[name]+')' as 'Script'
	--FROM sys.dm_db_index_physical_stats (DB_ID(), NULL, NULL, NULL, NULL) AS indexstats
	--INNER JOIN sys.tables dbtables on dbtables.[object_id] = indexstats.[object_id]
	--INNER JOIN sys.schemas dbschemas on dbtables.[schema_id] = dbschemas.[schema_id]
	--INNER JOIN sys.indexes AS dbindexes ON dbindexes.[object_id] = indexstats.[object_id]
	--AND indexstats.index_id = dbindexes.index_id
	--WHERE indexstats.database_id = DB_ID() and indexstats.avg_fragmentation_in_percent>30
	--ORDER BY indexstats.avg_fragmentation_in_percent desc
