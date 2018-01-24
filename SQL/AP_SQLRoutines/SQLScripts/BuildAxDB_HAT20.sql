----------------------------------------------------------------
-- Building the database from scratch - REMOTE CONTROL
-- written 28/09-99
-- (c)1999 Lars Lund, Columbus IT Partner A/S
----------------------------------------------------------------
USE master
GO
IF EXISTS (SELECT * FROM sysdatabases WHERE name = 'axdb_hat20')
	drop database axdb_hat20 
GO


CREATE DATABASE axdb_hat20
ON PRIMARY 	  ( NAME = axdb_hat20_1, FILENAME = 'f:\mssql7\data\axdb_hat20_1.mdf', SIZE = 300MB)
LOG ON 	          ( NAME = axdb_hat20log_1, FILENAME = 'f:\mssql7\log\axdb_hat20log_1.ldf', SIZE = 30MB)
GO



EXEC sp_addlogin 'bmssa', 'bmssa_psw', 'axdb_hat20'
use axdb_hat20
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


