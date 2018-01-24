-- show data/log files and available space
SELECT name ,size/128.0 - CAST(FILEPROPERTY(name, 'SpaceUsed') AS int)/128.0 AS AvailableSpaceInMB
FROM sys.database_files;

-- SHRINK single file
DBCC SHRINKFILE(tempdev,3000)
