-- ######## CREATE THE SNAPSHOT - 13 sec. ################
EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'SUPPORT2_AX2012_dbss20170629_1300'
GO
USE [master]
GO
/****** Object:  Database [SUPPORT2_AX2012_dbss20170629_1030]    Script Date: 28-06-2017 09:42:32 ******/
DROP DATABASE [SUPPORT2_AX2012_dbss20170629_1300]
GO
DECLARE @ExtName nvarchar(30) = 'dbss20170629_1400.ss'
CREATE DATABASE SUPPORT2_AX2012_dbss20170629_1300 ON
( NAME = SUPPORT2_AX2012_1, FILENAME = 'H:\SnapshotDB\SUPPORT2_AX2012_1_' + @ExtName ),
( NAME = SUPPORT2_AX2012_2, FILENAME = 'H:\SnapshotDB\SUPPORT2_AX2012_2_dbss20170629_1300.ss' ),
( NAME = SUPPORT2_AX2012_3, FILENAME = 'H:\SnapshotDB\SUPPORT2_AX2012_3_dbss20170629_1300.ss' ),
( NAME = SUPPORT2_AX2012_4, FILENAME = 'H:\SnapshotDB\SUPPORT2_AX2012_4_dbss20170629_1300.ss' )
AS SNAPSHOT OF SUPPORT2_AX2012;
GO



USE master;  
declare @d datetime = GETDATE()
select 'StartTime',@D

RESTORE DATABASE SUPPORT2_AX2012 from   
DATABASE_SNAPSHOT = 'SUPPORT2_AX2012_dbss20170629_1300';

select 'EndTime',GETDATE()
SELECT 'Exec time', 
       CONVERT(VARCHAR(8), GETDATE()-@D, 108) 'hh:mi:ss'