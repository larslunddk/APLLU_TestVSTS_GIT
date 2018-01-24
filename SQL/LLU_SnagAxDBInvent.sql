-- =============================================
-- Create database template
-- =============================================
USE master
GO
-- Drop the database if it already exists
IF  EXISTS (SELECT name FROM sys.databases 	WHERE name = N'LLUTmp')
	DROP DATABASE LLUTmp
GO
CREATE DATABASE LLUTmp
GO
use LLUTmp
select * into Inventtable		from axdb_develop.dbo.Inventtable
select * into InventtableModule	from axdb_develop.dbo.InventtableModule
select * into InventTrans		from axdb_develop.dbo.inventtrans

select * into custtable			from axdb_develop.dbo.custtable
select * into vendTable			from axdb_develop.dbo.vendTable
select * into inventitemgroup	from axdb_develop.dbo.inventitemgroup
select * into InventPosting		from axdb_develop.dbo.InventPosting
select * into LedgerTable		from axdb_develop.dbo.LedgerTable


/*
select * into inventdim		from axdb_develop.dbo.inventdim
select * into inventdimgroup from axdb_develop.dbo.inventdimgroup
select * into inventdimsetup from axdb_develop.dbo.inventdimsetup
select * into inventdimsetupgrid from axdb_develop.dbo.inventdimsetupgrid
select * into inventitemlocation	from axdb_develop.dbo.inventitemlocation
*/


