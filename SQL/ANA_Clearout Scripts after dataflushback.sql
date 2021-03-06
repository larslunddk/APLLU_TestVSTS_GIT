-- The following instructions should be looked at / run whether you copy a DB or shutdonw the AOD
SELECT * FROM axgit3.dbo.SYSSERVERSESSIONS
DELETE FROM axgit3.dbo.SYSSERVERSESSIONS

SELECT * FROM axgit3.dbo.SYSCLIENTSESSIONS
DELETE FROM axgit3.dbo.SYSCLIENTSESSIONS

--The following are only run if you copy a database over (not just the modelstore)
SELECT * FROM axgit3.dbo.SYSSERVERCONFIG
DELETE FROM SYSSERVERCONFIG

SELECT * FROM SYSUSERLOG
DELETE FROM SYSUSERLOG

SELECT * FROM BATCHSERVERCONFIG
DELETE FROM BATCHSERVERCONFIG

SELECT * FROM BATCHSERVERGROUP
DELETE FROM BATCHSERVERGROUP

SELECT * FROM BATCH where SERVERID like '%APPP%'
update BATCH set SERVERID = '02@KP-APPQ03' where SERVERID like '%APPP%'

Select * from BATCH
DELETE FROM BATCH

--Specific Jobs
delete from [AXEdu].dbo.batch where CAPTION like 'RETAIL A-1040%'
delete from [AXEdu].dbo.batchJob where CAPTION like 'RETAIL A-1040%'
delete from [AXEdu].dbo.batchJobHistory where CAPTION like 'RETAIL A-1040%'

select * from [AXGIT3].dbo.batch
select * from [AXGIT3].dbo.batchJob where CAPTION like 'RETAIL A-1040%'

SELECT * FROM BATCHJOB
DELETE FROM BATCHJOB

SELECT * FROM SRSSERVERS
DELETE FROM SRSSERVERS

SELECT * FROM BICONFIGURATION
DELETE FROM BICONFIGURATION

SELECT * FROM BIANALYSISSERVER
DELETE FROM BIANALYSISSERVER

SELECT * FROM SMMPHONEPARAMETERS
DELETE FROM SMMPHONEPARAMETERS

SELECT * FROM EPGLOBALPARAMETERS
DELETE FROM EPGLOBALPARAMETERS

SELECT * FROM EPWEBSITEPARAMETERS
DELETE FROM EPWEBSITEPARAMETERS


SELECT * FROM SYSSQMSETTINGS
UPDATE SYSSQMSETTINGS SET GLOBALGUID = CAST('00000000-0000-0000-0000-000000000000' AS uniqueidentifier)
--ONly required if on separate GC / AD
--UPDATE SYSUSERINFO SET SQMUSERGUID = CAST('00000000-0000-0000-0000-000000000000' AS uniqueidentifier)

select * from SYSEMAILPARAMETERS
UPDATE SYSEMAILPARAMETERS SET SMTPRELAYSERVERNAME = '', SMTPPORTNUMBER = 0, SMTPSERVERIPADDRESS = '', SMTPUSERNAME = '', NTLM = 0
