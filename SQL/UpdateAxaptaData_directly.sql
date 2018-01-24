UPDATE dbo.PCS_TRSREPORT
SET dbo.PCS_TRSREPORT.Followup_CustDaysOld = (SELECT DATEDIFF(day, dbo.PCS_TRSREPORT.LATESTDATECUST, GETDATE()))
where dbo.PCS_TRSREPORT.LatestDateCust>'1900-01-01 00:00:00.000'
and   dbo.PCS_TRSREPORT.PCS_CUSTOMERNO <> '9901'
--and dbo.PCS_TRSREPORT.PCS_TRSID = '49003'

UPDATE dbo.PCS_TRSREPORT
SET dbo.PCS_TRSREPORT.FOLLOWUP_PCSDAYSOLD = (SELECT DATEDIFF(day, dbo.PCS_TRSREPORT.LATESTDATEPCS, GETDATE()))
where dbo.PCS_TRSREPORT.LATESTDATEPCS>'1900-01-01 00:00:00.000'
and   dbo.PCS_TRSREPORT.PCS_CUSTOMERNO <> '9901'
--and dbo.PCS_TRSREPORT.PCS_TRSID = '49003'

select	dbo.PCS_TRSREPORT.PCS_CUSTOMERNO,dbo.PCS_TRSREPORT.PCS_TRSID,
		dbo.PCS_TRSREPORT.LatestDateCust, 
		dbo.PCS_TRSREPORT.LATESTDATEPCS,
		dbo.PCS_TRSREPORT.Followup_CustDaysOld,
		dbo.PCS_TRSREPORT.FOLLOWUP_PCSDAYSOLD
 from dbo.PCS_TRSREPORT
	where dbo.PCS_TRSREPORT.PCS_TRSID >= '49000'
	and   dbo.PCS_TRSREPORT.PCS_CUSTOMERNO <> '9901'
	--and dbo.PCS_TRSREPORT.FOLLOWUP_PCSDAYSOLD > 0
	and dbo.PCS_TRSREPORT.PCS_TRSID = '49003'
