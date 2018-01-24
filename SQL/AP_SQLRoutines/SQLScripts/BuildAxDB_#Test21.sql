----------------------------------------------------------------
-- Building the database from scratch - Testdatabase
-- written 28/09-99 - revised 23/08-2000
-- (c)1999 Lars Lund, Columbus IT Partner A/S
--
-- Start with Search/Replace of: test21
----------------------------------------------------------------
USE master
GO
IF EXISTS (SELECT * FROM sysdatabases WHERE name = 'axdb_test21')
	drop database axdb_test21 
GO


CREATE DATABASE axdb_test21
ON PRIMARY 	  ( NAME = axdb_test21_1, FILENAME = 'c:\mssql7\data\axdb_test21_1.mdf', SIZE = 30MB)
LOG ON 	          ( NAME = axdb_test21log_1, FILENAME = 'c:\mssql7\data\axdb_test21log_1.ldf', SIZE = 5MB)
GO



EXEC sp_addlogin 'bmssa', 'bmssa_psw', 'axdb_test21'
EXEC sp_addsrvrolemember 'bmssa', 'sysadmin'
use axdb_test21
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


