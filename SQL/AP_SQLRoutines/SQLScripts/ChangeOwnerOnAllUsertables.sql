DECLARE @id int, @type char(2),@msg varchar(80), 
        @indid smallint, @indname varchar(80), @groupId int,
	@TableName varchar(80)

DECLARE FindTable cursor
FOR SELECT id,name FROM sysobjects WHERE Type = 'U'

OPEN FindTable
FETCH NEXT FROM FindTable INTO @id, @TableName
WHILE @@FETCH_STATUS = 0
BEGIN
	exec sp_changeobjectowner @TableName, 'axapta_db'
	FETCH NEXT FROM FindTable INTO @id, @TableName
End
CLOSE FindTable
DEALLOCATE FindTable