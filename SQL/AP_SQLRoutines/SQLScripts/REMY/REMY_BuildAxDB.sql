----------------------------------------------------------------
-- Building the database from scratch
--
-- (c)1999 Lars Lund, Columbus IT Partner A/S
----------------------------------------------------------------
USE master
GO
IF EXISTS (SELECT * FROM sysdatabases WHERE name = 'axdb')
	drop database axdb 
GO


CREATE DATABASE axdb
ON PRIMARY 	  ( NAME = axdb_1, FILENAME = 'd:\mssql7\data\axdb_1.mdf', SIZE = 100MB),
FILEGROUP Fgrp1   ( NAME = axdb_2, FILENAME = 'd:\mssql7\data\axdb_2.ndf', SIZE = 50MB),
FILEGROUP Fgrp2   ( NAME = axdb_3, FILENAME = 'd:\mssql7\data\axdb_3.ndf', SIZE = 50MB)
LOG ON 	          ( NAME = axdblog_1, FILENAME = 'd:\mssql7\log\axdblog_1.ldf', SIZE = 20MB),
	          ( NAME = axdblog_2, FILENAME = 'd:\mssql7\log\axdblog_2.ldf', SIZE = 20MB),
		  ( NAME = axdblog_3, FILENAME = 'd:\mssql7\log\axdblog_3.ldf', SIZE = 20MB)
GO



--EXEC sp_addlogin 'bmssa', 'bmssa_psw', 'axdb'
use axdb
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


