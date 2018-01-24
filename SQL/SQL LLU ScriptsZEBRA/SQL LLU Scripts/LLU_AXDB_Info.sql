use AX2012_PROD
select 'AOSs',ENABLEBATCH, right(serverid,len(serverid)-charindex('@',SERVERID)) as serverid from SYSSERVERCONFIG
select 'SSRS',serverid, SERVERURL from SRSSERVERS group by serverid, SERVERURL
select 'WEB',VIRTUALDIRECTORYSHARE from AIFWEBSITES
select top 1 'Data refresh', count(*) cnt, CONVERT(VARCHAR(10), DATELASTHEARTBEATRECORDED, 126) from RETAILCDXDATASTOREHEARTBEATLOG group by CONVERT(VARCHAR(10), DATELASTHEARTBEATRECORDED, 126) order by cnt desc

use AX2012_Prod_model
select 'EG model',cast(VERSIONMAJOR as varchar)+'.'+cast(VERSIONMINOR as varchar)+'.'+cast(VERSIONREVISION as varchar)+'.'+cast(VERSIONBUILDNO as varchar) from SysModelManifest where NAME = 'EG'

select cast(VERSIONMAJOR as varchar)+'.'+cast(VERSIONMINOR as varchar)+'.'+cast(VERSIONREVISION as varchar)+'.'+cast(VERSIONBUILDNO as varchar) from SysModelManifest
join SYSMODELELEMENTDATA on SysModelManifest.RecId = SYSMODELELEMENTDATA.ModelId
join SYSMODELELEMENT on
 SYSMODELELEMENTDATA.ModelElement = SYSMODELELEMENT.RecId and 
 SYSMODELELEMENT.ELEMENTTYPE = 13 and --UtilElementType::ClassStaticMethod
 SYSMODELELEMENT.PARENTID = 758 and --classnum(ApplicationVersion)
 SYSMODELELEMENT.NAME = 'applbuildno' --staticmethodstr(ApplicationVersion, applBuildNo)
join SYSMODELLAYER on
        SYSMODELLAYER.RecId = SYSMODELELEMENTDATA.Layer and
              SYSMODELLAYER.Layer = 1 --UtilEntryLevel::syp;
