/* Drop Table Scripts:
Drop Table dbo.dba_indexDefragLog;
Drop Table dbo.dba_indexDefragExclusion;
*/
IF Not Exists(SELECT [OBJECT_ID] FROM sys.tables 
    WHERE [name] In (N'dba_indexDefragLog', 'dba_indexDefragExclusion'))
BEGIN
 
    CREATE TABLE dbo.dba_indexDefragLog
    (
          indexDefrag_id    INT IDENTITY(1,1)   Not Null
        , databaseID        INT                 Not Null
        , databaseName      NVARCHAR(128)       Not Null
        , objectID          INT                 Not Null
        , objectName        NVARCHAR(128)       Not Null
        , indexID           INT                 Not Null
        , indexName         NVARCHAR(128)       Not Null
        , partitionNumber   SMALLINT            Not Null
        , fragmentation     FLOAT               Not Null
        , page_count        INT                 Not Null
        , dateTimeStart     DATETIME            Not Null
        , dateTimeEnd       DATETIME            Null
        , durationSeconds   INT                 Null
 
        CONSTRAINT PK_indexDefragLog 
            PRIMARY KEY CLUSTERED (indexDefrag_id)
    );
 
    PRINT 'dba_indexDefragLog Table Created';
 
    CREATE TABLE dbo.dba_indexDefragExclusion
    (
          databaseID        INT                 Not Null
        , databaseName      NVARCHAR(128)       Not Null
        , objectID          INT                 Not Null
        , objectName        NVARCHAR(128)       Not Null
        , indexID           INT                 Not Null
        , indexName         NVARCHAR(128)       Not Null
        , exclusionMask     INT                 Not Null
            /* 1=Sunday, 2=Monday, 4=Tuesday, 8=Wednesday, 16=Thursday, 32=Friday, 64=Saturday */
 
        CONSTRAINT PK_indexDefragExclusion 
            PRIMARY KEY CLUSTERED (databaseID, objectID, indexID)
    );
 
    PRINT 'dba_indexDefragExclusion Table Created';
 
END
ELSE
    RAISERROR('One or more tables already exist.  Please drop or rename before proceeding.', 16, 0);
 
IF OBJECTPROPERTY(OBJECT_ID('dbo.dba_indexDefrag_sp'), N'IsProcedure') = 1
BEGIN
    DROP PROCEDURE dbo.dba_indexDefrag_sp;
    PRINT 'Procedure dba_indexDefrag_sp dropped';
END;
Go
 
 
CREATE PROCEDURE dbo.dba_indexDefrag_sp
 
    /* Declare Parameters */
      @minFragmentation     FLOAT           = 5.0  
        /* in percent, will not defrag if fragmentation less than specified */
    , @rebuildThreshold     FLOAT           = 30.0  
        /* in percent, greater than @rebuildThreshold will result in rebuild instead of reorg */
    , @executeSQL           BIT             = 1     
        /* 1 = execute; 0 = print command only */
    , @DATABASE             VARCHAR(128)    = Null
        /* Option to specify a database name; null will return all */
    , @tableName            VARCHAR(4000)   = Null  -- databaseName.schema.tableName
        /* Option to specify a table name; null will return all */
    , @scanMode             VARCHAR(10)     = N'LIMITED'
        /* Options are LIMITED, SAMPLED, and DETAILED */
    , @onlineRebuild        BIT             = 1     
        /* 1 = online rebuild; 0 = offline rebuild; only in Enterprise */
    , @maxDopRestriction    TINYINT         = Null
        /* Option to restrict the number of processors for the operation; only in Enterprise */
    , @printCommands        BIT             = 0     
        /* 1 = print commands; 0 = do not print commands */
    , @printFragmentation   BIT             = 0
        /* 1 = print fragmentation prior to defrag; 
           0 = do not print */
    , @defragDelay          CHAR(8)         = '00:00:05'
        /* time to wait between defrag commands */
    , @debugMode            BIT             = 0
        /* display some useful comments to help determine if/where issues occur */
    , @rebuildStats         BIT             = 1
        /* option to rebuild stats after completed index defrags */
 
AS
/*********************************************************************************
    Name:       dba_indexDefrag_sp
 
    Author:     Michelle Ufford, http://sqlfool.com
 
    Purpose:    Defrags all indexes for the current database
 
    Notes:
 
    CAUTION: TRANSACTION LOG SIZE SHOULD BE MONITORED CLOSELY WHEN DEFRAGMENTING.
 
      @minFragmentation     defaulted to 10%, will not defrag if fragmentation 
                            is less than that
 
      @rebuildThreshold     defaulted to 30% as recommended by Microsoft in BOL;
                            greater than 30% will result in rebuild instead
 
      @executeSQL           1 = execute the SQL generated by this proc; 
                            0 = print command only
 
      @database             Optional, specify specific database name to defrag;
                            If not specified, all non-system databases will
                            be defragged.
 
      @tableName            Specify if you only want to defrag indexes for a 
                            specific table, format = databaseName.schema.tableName;
                            if not specified, all tables will be defragged.
 
      @scanMode             Specifies which scan mode to use to determine
                            fragmentation levels.  Options are:
                            LIMITED - scans the parent level; quickest mode,
                                      recommended for most cases.
                            SAMPLED - samples 1% of all data pages; if less than
                                      10k pages, performs a DETAILED scan.
                            DETAILED - scans all data pages.  Use great care with
                                       this mode, as it can cause performance issues.
 
      @onlineRebuild        1 = online rebuild; 
                            0 = offline rebuild
 
      @maxDopRestriction    Option to specify a processor limit for index rebuilds
 
      @printCommands        1 = print commands to screen; 
                            0 = do not print commands
 
      @printFragmentation   1 = print fragmentation to screen;
                            0 = do not print fragmentation
 
      @defragDelay          Time to wait between defrag commands; gives the
                            server a little time to catch up 
 
      @debugMode            1 = display debug comments; helps with troubleshooting
                            0 = do not display debug comments
 
      @rebuildStats         Affects only statistics that need to be rebuilt
                            1 = rebuild stats
                            0 = do not rebuild stats
 
    Called by:  SQL Agent Job or DBA
 
    Date        Initials	Version Description
    ----------------------------------------------------------------------------
    2007-12-18  MFU         1.0     Initial Release
    2008-10-17  MFU         1.1     Added @defragDelay, CIX_temp_indexDefragList
    2008-11-17  MFU         1.2     Added page_count to log table
                                    , added @printFragmentation option
    2009-03-17  MFU         2.0     Provided support for centralized execution
                                    , consolidated Enterprise & Standard versions
                                    , added @debugMode, @maxDopRestriction
                                    , modified LOB and partition logic  
    2009-06-18  MFU         3.0     Fixed bug in LOB logic, added @scanMode option
                                    , added support for stat rebuilds (@rebuildStats)
                                    , support model and msdb defrag
                                    , added columns to the dba_indexDefragLog table
                                    , modified logging to show "in progress" defrags
                                    , added defrag exclusion list (scheduling)
*********************************************************************************
    Exec dbo.dba_indexDefrag_sp
          @executeSQL           = 0
        , @printCommands        = 1
        , @debugMode            = 1
        , @printFragmentation   = 1;
*********************************************************************************/																
 
SET NOCOUNT ON;
SET XACT_Abort ON;
SET Ansi_Padding ON;
SET Ansi_Warnings ON;
SET ArithAbort ON;
SET Concat_Null_Yields_Null ON;
SET Numeric_RoundAbort OFF;
SET Quoted_Identifier ON;
 
BEGIN
 
    IF @debugMode = 1 RAISERROR('Undusting the cogs and starting up...', 0, 42) WITH NoWait;
 
    /* Declare our variables */
    DECLARE   @objectID             INT
            , @databaseID           INT
            , @databaseName         NVARCHAR(128)
            , @indexID              INT
            , @partitionCount       BIGINT
            , @schemaName           NVARCHAR(128)
            , @objectName           NVARCHAR(128)
            , @indexName            NVARCHAR(128)
            , @partitionNumber      SMALLINT
            , @fragmentation        FLOAT
            , @pageCount            INT
            , @sqlCommand           NVARCHAR(4000)
            , @rebuildCommand       NVARCHAR(200)
            , @dateTimeStart        DATETIME
            , @dateTimeEnd          DATETIME
            , @containsLOB          BIT
            , @editionCheck         BIT
            , @debugMessage         VARCHAR(128)
            , @updateSQL            NVARCHAR(4000)
            , @partitionSQL         NVARCHAR(4000)
            , @partitionSQL_Param   NVARCHAR(1000)
            , @LOB_SQL              NVARCHAR(4000)
            , @LOB_SQL_Param        NVARCHAR(1000)
            , @rebuildStatsID       INT
            , @rebuildStatsSQL      NVARCHAR(1000)
            , @indexDefrag_id       INT;
 
    /* Create our temporary tables */
    CREATE TABLE #indexDefragList
    (
          databaseID        INT
        , databaseName      NVARCHAR(128)
        , objectID          INT
        , indexID           INT
        , partitionNumber   SMALLINT
        , fragmentation     FLOAT
        , page_count        INT
        , defragStatus      BIT
        , schemaName        NVARCHAR(128)   Null
        , objectName        NVARCHAR(128)   Null
        , indexName         NVARCHAR(128)   Null
    );
 
    CREATE TABLE #databaseList
    (
          databaseID        INT
        , databaseName      VARCHAR(128)
        , scanStatus        BIT
        , statsStatus       BIT
    );
 
    CREATE TABLE #processor 
    (
          [INDEX]           INT
        , Name              VARCHAR(128)
        , Internal_Value    INT
        , Character_Value   INT
    );
 
    IF @debugMode = 1 RAISERROR('Beginning validation...', 0, 42) WITH NoWait;
 
    /* Just a little validation... */
    IF @minFragmentation Not Between 0.00 And 100.0
        SET @minFragmentation = 10.0;
 
    IF @rebuildThreshold Not Between 0.00 And 100.0
        SET @rebuildThreshold = 30.0;
 
    IF @defragDelay Not Like '00:[0-5][0-9]:[0-5][0-9]'
        SET @defragDelay = '00:00:05';
 
    IF @scanMode Not In ('LIMITED', 'SAMPLED', 'DETAILED')
        SET @scanMode = 'LIMITED';
 
    /* Make sure we're not exceeding the number of processors we have available */
    INSERT INTO #processor
    EXECUTE XP_MSVER 'ProcessorCount';
 
    IF @maxDopRestriction IS Not Null And @maxDopRestriction > (SELECT Internal_Value FROM #processor)
        SELECT @maxDopRestriction = Internal_Value
        FROM #processor;
 
    /* Check our server version; 1804890536 = Enterprise, 610778273 = Enterprise Evaluation, -2117995310 = Developer */
    IF (SELECT SERVERPROPERTY('EditionID')) In (1804890536, 610778273, -2117995310) 
        SET @editionCheck = 1 -- supports online rebuilds
    ELSE
        SET @editionCheck = 0; -- does not support online rebuilds
 
    IF @debugMode = 1 RAISERROR('Grabbing a list of our databases...', 0, 42) WITH NoWait;
 
    /* Retrieve the list of databases to investigate */
    INSERT INTO #databaseList
    SELECT database_id
        , name
        , 0 -- not scanned yet for fragmentation
        , 0 -- statistics not yet updated
    FROM sys.databases
    WHERE name = IsNull(@DATABASE, name)
        And [name] Not In ('master', 'tempdb')-- exclude system databases
        And [STATE] = 0; -- state must be ONLINE
 
    IF @debugMode = 1 RAISERROR('Looping through our list of databases and checking for fragmentation...', 0, 42) WITH NoWait;
 
    /* Loop through our list of databases */
    WHILE (SELECT COUNT(*) FROM #databaseList WHERE scanStatus = 0) > 0
    BEGIN
 
        SELECT TOP 1 @databaseID = databaseID
        FROM #databaseList
        WHERE scanStatus = 0;
 
        SELECT @debugMessage = '  working on ' + DB_NAME(@databaseID) + '...';
 
        IF @debugMode = 1
            RAISERROR(@debugMessage, 0, 42) WITH NoWait;
 
       /* Determine which indexes to defrag using our user-defined parameters */
        INSERT INTO #indexDefragList
        SELECT
              database_id AS databaseID
            , QUOTENAME(DB_NAME(database_id)) AS 'databaseName'
            , [OBJECT_ID] AS objectID
            , index_id AS indexID
            , partition_number AS partitionNumber
            , avg_fragmentation_in_percent AS fragmentation
            , page_count 
            , 0 AS 'defragStatus' /* 0 = unprocessed, 1 = processed */
            , Null AS 'schemaName'
            , Null AS 'objectName'
            , Null AS 'indexName'
        FROM sys.dm_db_index_physical_stats (@databaseID, OBJECT_ID(@tableName), Null , Null, @scanMode)
        WHERE avg_fragmentation_in_percent >= @minFragmentation 
            And index_id > 0 -- ignore heaps
            And page_count > 8 -- ignore objects with less than 1 extent
            And index_level = 0 -- leaf-level nodes only, supports @scanMode
        OPTION (MaxDop 2);
 
        /* Keep track of which databases have already been scanned */
        UPDATE #databaseList
        SET scanStatus = 1
        WHERE databaseID = @databaseID;
 
    END
 
    CREATE CLUSTERED INDEX CIX_temp_indexDefragList
        ON #indexDefragList(databaseID, objectID, indexID, partitionNumber);
 
    /* Delete any indexes from our to-do that are also in our exclusion list for today */
    DELETE idl
    FROM #indexDefragList AS idl
    Join dbo.dba_indexDefragExclusion AS ide
        ON idl.databaseID = ide.databaseID
        And idl.objectID = ide.objectID
        And idl.indexID = ide.indexID
    WHERE exclusionMask & POWER(2, DATEPART(weekday, GETDATE())-1) > 0;
 
    SELECT @debugMessage = 'Looping through our list... there''s ' + CAST(COUNT(*) AS VARCHAR(10)) + ' indexes to defrag!'
    FROM #indexDefragList;
 
    IF @debugMode = 1 RAISERROR(@debugMessage, 0, 42) WITH NoWait;
 
    /* Begin our loop for defragging */
    WHILE (SELECT COUNT(*) FROM #indexDefragList WHERE defragStatus = 0) > 0
    BEGIN
 
        IF @debugMode = 1 RAISERROR('  Picking an index to beat into shape...', 0, 42) WITH NoWait;
 
        /* Grab the most fragmented index first to defrag */
        SELECT TOP 1 
              @objectID         = objectID
            , @indexID          = indexID
            , @databaseID       = databaseID
            , @databaseName     = databaseName
            , @fragmentation    = fragmentation
            , @partitionNumber  = partitionNumber
            , @pageCount        = page_count
        FROM #indexDefragList
        WHERE defragStatus = 0
        ORDER BY fragmentation DESC;
 
        IF @debugMode = 1 RAISERROR('  Looking up the specifics for our index...', 0, 42) WITH NoWait;
 
        /* Look up index information */
        SELECT @updateSQL = N'Update idl
            Set schemaName = QuoteName(s.name)
                , objectName = QuoteName(o.name)
                , indexName = QuoteName(i.name)
            From #indexDefragList As idl
            Inner Join ' + @databaseName + '.sys.objects As o
                On idl.objectID = o.object_id
            Inner Join ' + @databaseName + '.sys.indexes As i
                On o.object_id = i.object_id
            Inner Join ' + @databaseName + '.sys.schemas As s
                On o.schema_id = s.schema_id
            Where o.object_id = ' + CAST(@objectID AS VARCHAR(10)) + '
                And i.index_id = ' + CAST(@indexID AS VARCHAR(10)) + '
                And i.type > 0
                And idl.databaseID = ' + CAST(@databaseID AS VARCHAR(10));
 
        EXECUTE SP_EXECUTESQL @updateSQL;
 
        /* Grab our object names */
        SELECT @objectName  = objectName
            , @schemaName   = schemaName
            , @indexName    = indexName
        FROM #indexDefragList
        WHERE objectID = @objectID
            And indexID = @indexID
            And databaseID = @databaseID;
 
        IF @debugMode = 1 RAISERROR('  Grabbing the partition count...', 0, 42) WITH NoWait;
 
        /* Determine if the index is partitioned */
        SELECT @partitionSQL = 'Select @partitionCount_OUT = Count(*)
                                    From ' + @databaseName + '.sys.partitions
                                    Where object_id = ' + CAST(@objectID AS VARCHAR(10)) + '
                                        And index_id = ' + CAST(@indexID AS VARCHAR(10)) + ';'
            , @partitionSQL_Param = '@partitionCount_OUT int OutPut';
 
        EXECUTE SP_EXECUTESQL @partitionSQL, @partitionSQL_Param, @partitionCount_OUT = @partitionCount OUTPUT;
 
        IF @debugMode = 1 RAISERROR('  Seeing if there''s any LOBs to be handled...', 0, 42) WITH NoWait;
 
        /* Determine if the table contains LOBs */
        SELECT @LOB_SQL = ' Select @containsLOB_OUT = Count(*)
                            From ' + @databaseName + '.sys.columns With (NoLock) 
                            Where [object_id] = ' + CAST(@objectID AS VARCHAR(10)) + '
                                And (system_type_id In (34, 35, 99)
                                        Or max_length = -1);'
                            /*  system_type_id --> 34 = image, 35 = text, 99 = ntext
                                max_length = -1 --> varbinary(max), varchar(max), nvarchar(max), xml */
                , @LOB_SQL_Param = '@containsLOB_OUT int OutPut';
 
        EXECUTE SP_EXECUTESQL @LOB_SQL, @LOB_SQL_Param, @containsLOB_OUT = @containsLOB OUTPUT;
 
        IF @debugMode = 1 RAISERROR('  Building our SQL statements...', 0, 42) WITH NoWait;
 
        /* If there's not a lot of fragmentation, or if we have a LOB, we should reorganize */
        IF @fragmentation < @rebuildThreshold Or @containsLOB >= 1 Or @partitionCount > 1
        BEGIN
 
            SET @sqlCommand = N'Alter Index ' + @indexName + N' On ' + @databaseName + N'.' 
                                + @schemaName + N'.' + @objectName + N' ReOrganize';
 
            /* If our index is partitioned, we should always reorganize */
            IF @partitionCount > 1
                SET @sqlCommand = @sqlCommand + N' Partition = ' 
                                + CAST(@partitionNumber AS NVARCHAR(10));
 
        END;
 
        /* If the index is heavily fragmented and doesn't contain any partitions or LOB's, rebuild it */
        IF @fragmentation >= @rebuildThreshold And IsNull(@containsLOB, 0) != 1 And @partitionCount <= 1
        BEGIN
 
            /* Set online rebuild options; requires Enterprise Edition */
            IF @onlineRebuild = 1 And @editionCheck = 1 
                SET @rebuildCommand = N' Rebuild With (Online = On';
            ELSE
                SET @rebuildCommand = N' Rebuild With (Online = Off';
 
            /* Set processor restriction options; requires Enterprise Edition */
            IF @maxDopRestriction IS Not Null And @editionCheck = 1
                SET @rebuildCommand = @rebuildCommand + N', MaxDop = ' + CAST(@maxDopRestriction AS VARCHAR(2)) + N')';
            ELSE
                SET @rebuildCommand = @rebuildCommand + N')';
 
            SET @sqlCommand = N'Alter Index ' + @indexName + N' On ' + @databaseName + N'.'
                            + @schemaName + N'.' + @objectName + @rebuildCommand;
 
        END;
 
        /* Are we executing the SQL?  If so, do it */
        IF @executeSQL = 1
        BEGIN
 
            IF @debugMode = 1 RAISERROR('  Executing SQL statements...', 0, 42) WITH NoWait;
 
            /* Grab the time for logging purposes */
            SET @dateTimeStart  = GETDATE();
 
            /* Log our actions */
            INSERT INTO dbo.dba_indexDefragLog
            (
                  databaseID
                , databaseName
                , objectID
                , objectName
                , indexID
                , indexName
                , partitionNumber
                , fragmentation
                , page_count
                , dateTimeStart
            )
            SELECT
                  @databaseID
                , @databaseName
                , @objectID
                , @objectName
                , @indexID
                , @indexName
                , @partitionNumber
                , @fragmentation
                , @pageCount
                , @dateTimeStart;
 
            SET @indexDefrag_id = SCOPE_IDENTITY();
 
            /* Execute our defrag! */
            EXECUTE SP_EXECUTESQL @sqlCommand;
            SET @dateTimeEnd  = GETDATE();
 
            /* Update our log with our completion time */
            UPDATE dbo.dba_indexDefragLog
            SET dateTimeEnd = @dateTimeEnd
                , durationSeconds = DATEDIFF(SECOND, @dateTimeStart, @dateTimeEnd)
            WHERE indexDefrag_id = @indexDefrag_id;
 
            /* Just a little breather for the server */
            WAITFOR Delay @defragDelay;
 
            /* Print if specified to do so */
            IF @printCommands = 1
                PRINT N'Executed: ' + @sqlCommand;
        END
        ELSE
        /* Looks like we're not executing, just printing the commands */
        BEGIN
            IF @debugMode = 1 RAISERROR('  Printing SQL statements...', 0, 42) WITH NoWait;
 
            IF @printCommands = 1 PRINT IsNull(@sqlCommand, 'error!');
        END
 
        IF @debugMode = 1 RAISERROR('  Updating our index defrag status...', 0, 42) WITH NoWait;
 
        /* Update our index defrag list so we know we've finished with that index */
        UPDATE #indexDefragList
        SET defragStatus = 1
        WHERE databaseID       = @databaseID
          And objectID         = @objectID
          And indexID          = @indexID
          And partitionNumber  = @partitionNumber;
 
    END
 
    /* Do we want to output our fragmentation results? */
    IF @printFragmentation = 1
    BEGIN
 
        IF @debugMode = 1 RAISERROR('  Displaying fragmentation results...', 0, 42) WITH NoWait;
 
        SELECT databaseID
            , databaseName
            , objectID
            , objectName
            , indexID
            , indexName
            , fragmentation
            , page_count
        FROM #indexDefragList;
 
    END;
 
    /* Do we want to rebuild stats? */
    IF @rebuildStats = 1
    BEGIN
 
        WHILE Exists(SELECT TOP 1 * FROM #databaseList WHERE statsStatus = 0)
        BEGIN
 
            /* Build our SQL statement to update stats */
            SELECT TOP 1 @rebuildStatsSQL = 'Use [' + databaseName + ']; ' + 
                                            'Execute sp_updatestats;'
                    , @rebuildStatsID = databaseID
            FROM #databaseList
            WHERE statsStatus = 0;
 
            SET @debugMessage = 'Rebuilding Statistics: ' + @rebuildStatsSQL;
 
            IF @debugMode = 1 RAISERROR(@debugMessage, 0, 42) WITH NoWait;
 
            /* Execute our stats update! */
            EXECUTE SP_EXECUTESQL @rebuildStatsSQL;
 
            /* Keep track of which databases have been updated */
            UPDATE #databaseList 
            SET statsStatus = 1
            WHERE databaseID = @rebuildStatsID;
 
        END;
    END;
 
    /* When everything is said and done, make sure to get rid of our temp table */
    DROP TABLE #indexDefragList;
    DROP TABLE #databaseList;
    DROP TABLE #processor;
 
    IF @debugMode = 1 RAISERROR('DONE!  Thank you for taking care of your indexes!  :)', 0, 42) WITH NoWait;
 
    SET NOCOUNT OFF;
    RETURN 0
END
Go
 
SET Quoted_Identifier OFF 
SET ANSI_Nulls ON
Go