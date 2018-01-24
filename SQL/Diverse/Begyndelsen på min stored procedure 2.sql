	Declare @FromDate smalldatetime --= CAST('2007-01-01' AS smalldatetime)
	Declare @PCS_TRSID as varchar(20),
		@LATESTDATECUST as smalldatetime, 
		@LATESTDATEPCS as smalldatetime,
		@LastUpd as smalldatetime,
		@PCS_USER_DESC as varchar(127),
		@UserId as varchar(20),
		@TotalTime as int
	
	DROP Table #TempTimeUsage	
	CREATE TABLE #TempTimeUsage (UserId varchar(20) PRIMARY KEY, TimeUsed int, TRS varchar(5))
	select @fromdate = CONVERT(smalldatetime, '2007/09/16',111) 

	select top 1 TR_REPORTTIME.USERID, SUM(TR_REPORTTIME.TOTALTIME) AS SumTotalTime , TRS,
			(select PCS_TRSREPORT.PCS_USER_DESC from PCS_TRSREPORT where PCS_TRSID = '38387')
			from TR_REPORTTIME 
			where TR_REPORTTIME.TRS = '38387'
			and exists (select TR_DEPT from TR_EMPLTABLE where TR_EMPLTABLE.TR_EMPLID = TR_REPORTTIME.USERID and TR_EMPLTABLE.TR_DEPT <> '63' and TR_EMPLTABLE.TR_DEPT <> '99')
			group by TRS, TR_REPORTTIME.USERID
			order by SumTotalTime DESC


	declare PCS_TRSReport CURSOR FOR
		select top 10 PCS_TRSID, LATESTDATECUST, LATESTDATEPCS,  PCS_USER_DESC, LastUpdateDate,
			(select top 1  
			from dbo.PCS_TRSReport 
			where LastUpdateDate >= @FromDate
			and   PCS_CustomerNo <> '9901'
			order by PCS_TRSID
	OPEN PCS_TRSReport
	FETCH NEXT FROM PCS_TRSReport into @PCS_TRSID,@LATESTDATECUST,@LATESTDATEPCS,@PCS_USER_DESC,@LastUpd

	WHILE @@FETCH_STATUS = 0
	BEGIN
		print @PCS_TRSID+' '+@PCS_USER_DESC+' '+convert(varchar(20), @LATESTDATECUST, 111)+' '+convert(varchar(20), @LATESTDATEPCS, 111)
				+ ' '+convert(varchar(20),@LastUpd,111)
		delete from #TempTimeUsage
		declare TR_ReportTime cursor for select userid, sum(totaltime) from dbo.tr_reporttime 
			where trs = @PCS_TRSID 
			group by userid
		open TR_ReportTime
		fetch next from TR_ReportTime into @UserId, @TotalTime
		WHILE @@FETCH_STATUS = 0
		BEGIN
			Insert into #TempTimeUsage (UserId, TimeUsed, TRS) values (@UserId, @TotalTime,@PCS_TRSID)
			fetch next from TR_ReportTime into @UserId, @TotalTime
		END
		close TR_ReportTime
		deallocate TR_ReportTime
		select top 1 TRS, UserId,timeused from #TempTimeUsage order by trs,TimeUsed
		--print @PCS_TRSID --+ select max(UserId) from #TempTimeUsage order by TotalTime
		
		FETCH NEXT FROM PCS_TRSReport into @PCS_TRSID,@LATESTDATECUST,@LATESTDATEPCS,@PCS_USER_DESC,@LastUpd
	END
	CLOSE PCS_TRSReport
	DEALLOCATE PCS_TRSReport