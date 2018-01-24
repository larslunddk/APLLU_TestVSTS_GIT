use AX2012_PROD
-- Show AOS servers
select ENABLEBATCH, right(serverid,len(serverid)-charindex('@',SERVERID)) as serverid from SYSSERVERCONFIG

-- Show SSRS servers
select serverid, SERVERURL/*, right(AOSID,len(AOSID)-charindex('@',AOSID)) as AOSServerId*/  from SRSSERVERS group by serverid/*,AOSID*/, SERVERURL 

-- show WebSites
select VIRTUALDIRECTORYSHARE from AIFWEBSITES

-- show retail
select SHAREDOWNLOADPATH, SHAREUPLOADPATH from RETAILCDXFILESTORAGEPROVIDER
select PROFILEID, CENTRALTABLESERVER,CENTRALTABLESERVERPORT, SERVERSERVICENAME from RETAILTRANSACTIONSERVICEPROFILE
select HQMSGDBSERVERNAME, HQMSGDBNAME, HQMSGDBINSTANCENAME from RetailConnParameters

-- Last data refresh (using RETAILCDXDATASTOREHEARTBEATLOG)
select top 1 count(*) cnt, CONVERT(VARCHAR(10), DATELASTHEARTBEATRECORDED, 126)
	from RETAILCDXDATASTOREHEARTBEATLOG 
	group by CONVERT(VARCHAR(10), DATELASTHEARTBEATRECORDED, 126)
	order by cnt desc

-- find EG version number
use AX2012_Prod_model
select * from SysModelManifest
select cast(VERSIONMAJOR as varchar)+'.'+cast(VERSIONMINOR as varchar)+'.'+cast(VERSIONREVISION as varchar)+'.'+cast(VERSIONBUILDNO as varchar) from SysModelManifest
	where NAME = 'EG'

-- find AX Appl version number (taken from Class.method: ApplicationVersion.applBuildNo()
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
