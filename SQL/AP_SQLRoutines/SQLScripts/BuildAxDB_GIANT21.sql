----------------------------------------------------------------
-- Building the database from scratch - REMOTE CONTROL
-- written 28/09-99
-- (c)1999 Lars Lund, Columbus IT Partner A/S
----------------------------------------------------------------
USE master
GO
IF EXISTS (SELECT * FROM sysdatabases WHERE name = 'axdb_km21')
	drop database axdb_km21 
GO


CREATE DATABASE axdb_km21
ON PRIMARY 	  ( NAME = axdb_km21_1, FILENAME = 'c:\mssql7\data\axdb_km21_1.mdf', SIZE = 30MB)
LOG ON 	          ( NAME = axdb_km21log_1, FILENAME = 'c:\mssql7\data\axdb_km21log_1.ldf', SIZE = 5MB)
GO



EXEC sp_addlogin 'bmssa', 'bmssa_psw', 'axdb_km21'
use axdb_km21
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


