----------------------------------------------------------------
-- Building the database from scratch - REMOTE CONTROL
-- written 28/09-99
-- (c)1999 Lars Lund, Columbus IT Partner A/S
----------------------------------------------------------------
USE master
GO
IF EXISTS (SELECT * FROM sysdatabases WHERE name = 'axdb_rc')
	drop database axdb_rc 
GO


CREATE DATABASE axdb_rc20
ON PRIMARY 	  ( NAME = axdb_rc20_1, FILENAME = 'f:\mssql7\data\axdb_rc20_1.mdf', SIZE = 20MB)
LOG ON 	          ( NAME = axdb_rc20log_1, FILENAME = 'f:\mssql7\data\axdb_rc20log_1.ldf', SIZE = 6MB)
GO



--EXEC sp_addlogin 'bmssa', 'bmssa_psw', 'axdb_rc20'
use axdb_rc20
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


