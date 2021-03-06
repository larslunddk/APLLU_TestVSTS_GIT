--####################### Jobs started late WARNING - Must be executed every 5 min
--## Baseline is BATCHJOB.ORIGSTARTDATETIME + 120
select top 100 batchjob.caption, dbo.enum2str('batchstatus', batchjob.status) as JobStatus,
BATCHJOB.ORIGSTARTDATETIME,BATCHJOB.STARTDATETIME, 
EGBCBATCHJOB.STARTTIMETHRESHOLDWARNING,
Dateadd(minute, EGBCBATCHJOB.STARTTIMETHRESHOLDWARNING,BATCHJOB.ORIGSTARTDATETIME)+120 as latestStart
from batchjob
join EGBCBATCHJOB
on EGBCBATCHJOB.BATCHJOB = BATCHJOB.RECID
where batchjob.status = 1
and EGBCBATCHJOB.STARTTIMETHRESHOLDERROR<>0
and getdate()> Dateadd(minute, EGBCBATCHJOB.STARTTIMETHRESHOLDWARNING+120,BATCHJOB.ORIGSTARTDATETIME)
and getdate()< Dateadd(minute, EGBCBATCHJOB.STARTTIMETHRESHOLDERROR+120,BATCHJOB.ORIGSTARTDATETIME)
       
--####################### Jobs started late WARNING - Must be executed every 5 min
--## Baseline is BATCHJOB.STARTDATETIME + 120
select top 100 batchjob.caption, dbo.enum2str('batchstatus', batchjob.status) as JobStatus,
BATCHJOB.STARTDATETIME,
EGBCBATCHJOB.EXECUTIONTIMETHRESHOLDWARNING,
Dateadd(minute, EGBCBATCHJOB.EXECUTIONTIMETHRESHOLDWARNING,BATCHJOB.STARTDATETIME)+120 as latestEnd
from batchjob
join EGBCBATCHJOB
on EGBCBATCHJOB.BATCHJOB = BATCHJOB.RECID
where batchjob.status = 2
and EGBCBATCHJOB.EXECUTIONTIMETHRESHOLDERROR<>0
and getdate()> Dateadd(minute, EGBCBATCHJOB.EXECUTIONTIMETHRESHOLDWARNING+120,BATCHJOB.STARTDATETIME)
and getdate()< Dateadd(minute, EGBCBATCHJOB.EXECUTIONTIMETHRESHOLDERROR+120,BATCHJOB.STARTDATETIME)

--####################### Jobs started late ERROR - Must be executed every 5 min
--## Baseline is BATCHJOB.ORIGSTARTDATETIME + 120
--## If job exeeding Error treshold value the error is ONLY send once
select top 100 batchjob.caption, dbo.enum2str('batchstatus', batchjob.status) as JobStatus,
BATCHJOB.ORIGSTARTDATETIME,BATCHJOB.STARTDATETIME, 
EGBCBATCHJOB.STARTTIMETHRESHOLDWARNING,
Dateadd(minute, EGBCBATCHJOB.STARTTIMETHRESHOLDERROR,BATCHJOB.ORIGSTARTDATETIME)+120 as latestStart
from batchjob
join EGBCBATCHJOB
on EGBCBATCHJOB.BATCHJOB = BATCHJOB.RECID
where batchjob.status = 1
and EGBCBATCHJOB.STARTTIMETHRESHOLDERROR<>0
and getdate()> Dateadd(minute, EGBCBATCHJOB.STARTTIMETHRESHOLDERROR+120,BATCHJOB.ORIGSTARTDATETIME)
and getdate()< Dateadd(minute, EGBCBATCHJOB.STARTTIMETHRESHOLDERROR+125,BATCHJOB.ORIGSTARTDATETIME)
       
--####################### Jobs started late ERROR - Must be executed every 5 min
--## Baseline is BATCHJOB.STARTDATETIME + 120
--## If job exeeding Error treshold value the error is ONLY send once
select top 100 batchjob.caption, dbo.enum2str('batchstatus', batchjob.status) as JobStatus,
BATCHJOB.STARTDATETIME,
EGBCBATCHJOB.EXECUTIONTIMETHRESHOLDWARNING,
Dateadd(minute, EGBCBATCHJOB.EXECUTIONTIMETHRESHOLDERROR,BATCHJOB.STARTDATETIME)+120 as latestEnd
from batchjob
join EGBCBATCHJOB
on EGBCBATCHJOB.BATCHJOB = BATCHJOB.RECID
where batchjob.status = 2
and EGBCBATCHJOB.EXECUTIONTIMETHRESHOLDERROR<>0
and getdate()> Dateadd(minute, EGBCBATCHJOB.EXECUTIONTIMETHRESHOLDERROR+120,BATCHJOB.STARTDATETIME)
and getdate()< Dateadd(minute, EGBCBATCHJOB.EXECUTIONTIMETHRESHOLDERROR+125,BATCHJOB.STARTDATETIME)



-- ####### Daily job based on BatchJobHistory
select top 100  
       --BATCHJOBHISTORY.ORIGSTARTDATETIME, 
       BATCHJOBHISTORY.STARTDATETIME, 
       BATCHJOBHISTORY.CAPTION,
       datediff(SECOND, BATCHJOBHISTORY.ORIGSTARTDATETIME,BATCHJOBHISTORY.STARTDATETIME)/60 [StartDelay (min)],
       datediff(SECOND, BATCHJOBHISTORY.STARTDATETIME, BATCHJOBHISTORY.ENDDATETIME)/60 [Exec delay (min)],
       EGBCBATCHJOB.STARTTIMETHRESHOLDWARNING [Warn Start Threshold],
       EGBCBATCHJOB.EXECUTIONTIMETHRESHOLDWARNING [Warn Exec Threshold],
       EGBCBATCHJOB.STARTTIMETHRESHOLDERROR [Err Start Threshold],
       EGBCBATCHJOB.EXECUTIONTIMETHRESHOLDERROR [Err Exec Threshold],
       case when (datediff(SECOND, BATCHJOBHISTORY.ORIGSTARTDATETIME,BATCHJOBHISTORY.STARTDATETIME)/60>EGBCBATCHJOB.STARTTIMETHRESHOLDERROR) THEN 'ERROR STARTTIME' 
       else case when (datediff(SECOND, BATCHJOBHISTORY.STARTDATETIME,BATCHJOBHISTORY.ENDDATETIME)/60>EGBCBATCHJOB.EXECUTIONTIMETHRESHOLDERROR) THEN 'ERROR EXECTTIME'
       else case when (datediff(SECOND, BATCHJOBHISTORY.ORIGSTARTDATETIME,BATCHJOBHISTORY.STARTDATETIME)/60>EGBCBATCHJOB.STARTTIMETHRESHOLDWARNING) THEN 'WARN STARTTIME' 
       else case when (datediff(SECOND, BATCHJOBHISTORY.STARTDATETIME,BATCHJOBHISTORY.ENDDATETIME)/60>EGBCBATCHJOB.EXECUTIONTIMETHRESHOLDWARNING) THEN 'WARN EXECTTIME'
       else 'n/a'
       END END END END [INFO]
from BATCHJOBHISTORY
join BATCHJOB 
on BATCHJOB.RECID = BATCHJOBHISTORY.BATCHJOBID
join EGBCBATCHJOB
on EGBCBATCHJOB.BATCHJOB = BATCHJOB.RECID
where BATCHJOBHISTORY.status<>0
and BATCHJOBHISTORY.ORIGSTARTDATETIME>=dateadd(day,-1,getdate())
and BATCHJOBHISTORY.ORIGSTARTDATETIME<=getdate()
and EGBCBATCHJOB.STARTTIMETHRESHOLDERROR<>0
and EGBCBATCHJOB.EXECUTIONTIMETHRESHOLDERROR<>0
and (datediff(SECOND, BATCHJOBHISTORY.ORIGSTARTDATETIME,BATCHJOBHISTORY.STARTDATETIME)/60>EGBCBATCHJOB.STARTTIMETHRESHOLDWARNING
       OR datediff(SECOND, BATCHJOBHISTORY.STARTDATETIME, BATCHJOBHISTORY.ENDDATETIME)/60>EGBCBATCHJOB.EXECUTIONTIMETHRESHOLDWARNING)
order by STARTDATETIME