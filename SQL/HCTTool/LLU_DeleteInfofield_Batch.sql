--select COUNT(*) from BATCH
--select COUNT(*) from BATCHHISTORY
--select COUNT(*) from BATCHJOB
--select COUNT(*) from BATCHJOBHISTORY


--select COUNT(*) from BATCHshadow
--select * from batch order by recid
--delete from BATCH where STATUS > 2

--select * into BatchShadow from batch

--select RECID as _recid, * from batch order by recid

update BATCH set INFO=null 
	where CAPTION = 'HCT Automatic Salesorder confirmations'
	OR    CAPTION = 'MPRAutomatic Salesorder confirmations'