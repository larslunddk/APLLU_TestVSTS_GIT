-- =============================================
-- Create database template
-- =============================================
USE axdb_develop
declare @Dataareaid varchar(3)
declare @SQLcmd varchar(4000)
select @Dataareaid = 'WDX'
/*
update LLUTmpWid.dbo.InventTable set dataareaid = @Dataareaid
update LLUTmpWid.dbo.InventtableModule set dataareaid = @Dataareaid
update LLUTmpWid.dbo.inventtrans set dataareaid = @Dataareaid
update LLUTmpWid.dbo.custtable set dataareaid = @Dataareaid
update LLUTmpWid.dbo.vendTable set dataareaid = @Dataareaid
update LLUTmpWid.dbo.inventitemgroup set dataareaid = @Dataareaid
update LLUTmpWid.dbo.InventPosting set dataareaid = @Dataareaid
update LLUTmpWid.dbo.LedgerTable set dataareaid = @Dataareaid
*/
use LLUTmpWid
select @SQLcmd = 'insert dbo.inventtable select '+dbo.columnList(dbo.InventTable)+'from LLUTmpWid.dbo.InventTable'
select @SQLcmd 
/*insert dbo.InventtableModule select * from LLUTmpWid.dbo.InventtableModule
insert dbo.inventtrans select * from LLUTmpWid.dbo.inventtrans
insert dbo.custtable select * from LLUTmpWid.dbo.custtable
insert dbo.vendTable select * from LLUTmpWid.dbo.vendTable
insert dbo.inventitemgroup select * from LLUTmpWid.dbo.inventitemgroup
insert dbo.InventPosting select * from LLUTmpWid.dbo.InventPosting
insert dbo.LedgerTable select * from LLUTmpWid.dbo.LedgerTable
*/