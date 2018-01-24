use axdb_TEST
declare @counter int = 0
declare @maxcounter int
declare @cntTxt nvarchar(10)
declare	@NewId  nvarchar(10)
declare @TimeStart datetime = sysdatetime()
declare @TimeEnd datetime
declare @TimeDiff datetime

declare @nextRecId bigint = 5637208735*10

	delete from AP_PerfTestSimpleTable
	
	while @counter < 10000
	begin
	  set @counter = @counter + 1
	  set @cntTxt = CAST(@counter as nvarchar(10))
	  insert into AP_PerfTestSimpleTable (ID,CUSTACCOUNT,DESCRIPTION255,RECID)
	  values (@cntTxt,'A'+@cntTxt,REPLICATE('A',255),@nextRecId)
	  select @nextRecId = @nextRecId+1 
	end

	select @maxcounter = cast(MAX(id) as int) from AP_PerfTestSimpleTable
	select @maxcounter
	
	set @TimeStart = sysdatetime()
	set @counter = 0
	while @counter < @maxcounter
	begin
	  set @counter = @counter + 1
	  set @cntTxt = CAST(@counter as nvarchar(10))
	  select @NewId = ID from AP_PerfTestSimpleTable
		where ID = @cntTxt
	end
select @TimeEnd	= SYSDATETIME()
select @TimeDiff = @TimeEnd-@TimeStart
select @Timestart as Time_Start, @TimeEnd as Time_End, cast(@TimeDiff as TIME) as Diff
--select @TimeStart , cast(sysdatetime() as datetime) as EndTime, cast(CAST(@FLToTime-@FLfromTime as datetime) as Time)
--select DATEDIFF(microsecond, @StartTime, sysdatetime())
