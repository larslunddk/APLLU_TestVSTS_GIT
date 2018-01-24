----------------------------------------------------------------
-- Building the database from scratch - REMOTE CONTROL
-- written 28/09-99
-- (c)1999 Lars Lund, Columbus IT Partner A/S
----------------------------------------------------------------
USE master
GO
IF EXISTS (SELECT * FROM sysdatabases WHERE name = 'axdb_hat15')
	drop database axdb_hat15 
GO


CREATE DATABASE axdb_hat15
ON PRIMARY 	  ( NAME = axdb_hat15_1, FILENAME = 'c:\mssql7\data\axdb_hat15_1.mdf', SIZE = 150MB)
LOG ON 	          ( NAME = axdb_hat15log_1, FILENAME = 'c:\mssql7\log\axdb_hat15log_1.ldf', SIZE = 10MB)
GO



--EXEC sp_addlogin 'bmssa', 'bmssa_psw', 'axdb_hat15'
use axdb_hat15
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


