----------------------------------------------------------------
-- SHOW all tables and indexes in fieldgroup other that primary
-- filegroup
--
-- Works with Axapta created database (selects only indexes pre-
-- fixed with "I_")
--
-- (c)1999 Lars Lund, Columbus IT Partner A/S
----------------------------------------------------------------

USE master
GO

USE axdb_remy
-- Declare variables to use in this example.
DECLARE @id int, @type char(2),@msg varchar(80), 
        @indid smallint, @indname varchar(80), @groupId int,
	@TableName varchar(80)
-- Obtain the identification number for the authors table to look up
-- its indexes in the sysindexes table.
SET NOCOUNT ON
DECLARE FindTable cursor
FOR SELECT id,name FROM sysobjects WHERE Type = 'U'

OPEN FindTable
FETCH NEXT FROM FindTable INTO @id, @TableName
WHILE @@FETCH_STATUS = 0
BEGIN
    DECLARE FindIndex cursor	
    FOR SELECT indid,name,groupid FROM sysindexes WHERE id = @id AND indid>1 AND indid<255 
						    and substring(name,1,2) = "I_"
						    and groupid <> 1	-- WHICH groupID to select/deselect
    OPEN FindIndex
    FETCH NEXT FROM FindIndex INTO @indid, @indname, @groupId
    WHILE @@FETCH_STATUS = 0
    BEGIN
	print 'groupid >'+CONVERT(varchar,@groupId)+'<   '+CONVERT(varchar, @indid)+' '+@indname
        FETCH NEXT FROM FindIndex INTO @indid, @indname, @groupId
    END
    CLOSE FindIndex
    DEALLOCATE FindIndex
    FETCH NEXT FROM FindTable INTO @id, @TableName
END

print 'Index information ended'
print '-----------------------'
CLOSE FindTable
DEALLOCATE FindTable
SET NOCOUNT OFF
GO
