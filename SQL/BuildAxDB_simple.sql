----------------------------------------------------------------
-- Building the database from scratch
--
-- (c)1999 Lars Lund, Columbus IT Partner A/S
----------------------------------------------------------------
USE master
GO
IF EXISTS (SELECT * FROM sysdatabases WHERE name = 'axdb3_T2')
	drop database axdb3_T2 
GO


CREATE DATABASE axdb3_T2
ON PRIMARY 	  ( NAME = axdb3_T2_Data, FILENAME = 'C:\SQL_Data\axdb3_T2_Data.mdf', SIZE = 20MB)
LOG ON 	          ( NAME = axdb3_T2_Log, FILENAME = 'C:\SQL_Data\axdb3_T2_log.ldf', SIZE = 5MB)
GO



--EXEC sp_addlogin 'bmssa', 'bmssa_psw', 'axdb3_T2'
use axdb3_T2
IF NOT EXISTS (SELECT *
               FROM sysusers
               WHERE name = 'bmssa'
                 AND hasdbaccess = 1)
BEGIN
	EXEC sp_adduser 'bmssa','bmssa','db_owner'
	EXEC sp_password NULL, 'bmssa_pwd', 'bmssa'
	--EXEC sp_addrolemember 'db_owner', 'bmssa'
END

GO


