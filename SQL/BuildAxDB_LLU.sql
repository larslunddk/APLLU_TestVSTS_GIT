----------------------------------------------------------------
-- Building the database from scratch
--
-- (c)1999 Lars Lund, Columbus IT Partner A/S
----------------------------------------------------------------
USE master
GO
IF EXISTS (SELECT * FROM sysdatabases WHERE name = 'axdb3_T1')
	drop database axdb3_T1 
GO


CREATE DATABASE axdb3_T1
ON PRIMARY 	  ( NAME = axdb3_T1_Data, FILENAME = 'C:\SQL_Data\axdb3_T1_Data.mdf', SIZE = 20MB)
LOG ON 	          ( NAME = axdb3_T1_Log, FILENAME = 'C:\SQL_Data\axdb3_T1_log.ldf', SIZE = 5MB)
GO



--EXEC sp_addlogin 'bmssa', 'bmssa_psw', 'axdb3_T1'
use axdb3_T1
IF NOT EXISTS (SELECT *
               FROM sysusers
               WHERE name = 'bmssa'
                 AND hasdbaccess = 1)
BEGIN
	EXEC sp_adduser 'bmssa','bmssa','db_owner'
	EXEC sp_password NULL, 'bmssa_psw', 'bmssa'
	--EXEC sp_addrolemember 'db_owner', 'bmssa'
END

GO


