DROP TABLE #TmpOutput
CREATE TABLE #TmpOutput (
    line int,
    result nvarchar(255),
 
);
GO
DROP PROCEDURE dbo.SaveTableCounts
GO
CREATE PROCEDURE dbo.SaveTableCounts
    @Type nvarchar(10),
	@RetensionDays int
AS
	declare @res as nvarchar(200)
	declare @FromTime as datetime

	SET @FromTime = GetDate()
	select @res = count(*) from BATCHCONSTRAINTSHISTORY
		   where exists (select 1 from BATCHHISTORY, BATCHJOBHISTORY 
									  where BATCHHISTORY.BATCHJOBHISTORYID = BATCHJOBHISTORY.recid 
									  and BATCHCONSTRAINTSHISTORY.BATCHID = BATCHHISTORY.RECID 
									  and BATCHJOBHISTORY.STARTDATETIME < DateAdd(day,-1*@RetensionDays, Getdate()))
	set @res = left(CONVERT(NVARCHAR,CONVERT(TIME, GETDATE())),9)+' / '+left(Convert(nvarchar,CONVERT(TIME, GETDATE()-@FromTime)),9)+' - BATCHCONSTRAINTSHISTORY '+@Type+' : '+@Res
	insert #TmpOutput values ((select max(line)+1 from #TmpOutput), @Res)

	--delete from BATCHHISTORY
	SET @FromTime = GetDate()
	select @Res = COUNT(*) from BATCHHISTORY
		   where exists (select 1 from BATCHJOBHISTORY 
									  where BATCHHISTORY.BATCHJOBHISTORYID = BATCHJOBHISTORY.recid 
									  and BATCHJOBHISTORY.STARTDATETIME < DateAdd(day,-1*@RetensionDays, Getdate()))
	set @res = left(CONVERT(NVARCHAR,CONVERT(TIME, GETDATE())),9)+' / '+left(Convert(nvarchar,CONVERT(TIME, GETDATE()-@FromTime)),9)+' - BATCHHISTORY '+@Type+' : '+@Res
	insert #TmpOutput values ((select max(line)+1 from #TmpOutput), @Res)

	--delete from BATCHJOBHISTORY
	SET @FromTime = GetDate()
	select @Res = COUNT(*) from BATCHJOBHISTORY
		   where BATCHJOBHISTORY.STARTDATETIME < DateAdd(day,-1*@RetensionDays, Getdate())
	set @res = left(CONVERT(NVARCHAR,CONVERT(TIME, GETDATE())),9)+' / '+left(Convert(nvarchar,CONVERT(TIME, GETDATE()-@FromTime)),9)+' - BATCHJOBHISTORY '+@Type+' : '+@Res
	insert #TmpOutput values ((select max(line)+1 from #TmpOutput), @Res)

	RETURN 0 
GO

begin transaction
declare @RetensionDays as int
declare @res as nvarchar(200)
declare @FromTime as datetime

exec SaveTableCounts 'Before',0

set @RetensionDays = 60
--delete from BATCHCONSTRAINTSHISTORY
SET @FromTime = GetDate()
delete from BATCHCONSTRAINTSHISTORY
       where exists (select 1 from BATCHHISTORY, BATCHJOBHISTORY 
                                  where BATCHHISTORY.BATCHJOBHISTORYID = BATCHJOBHISTORY.recid 
                                  and BATCHCONSTRAINTSHISTORY.BATCHID = BATCHHISTORY.RECID 
                                  and BATCHJOBHISTORY.STARTDATETIME < DateAdd(day,-1*@RetensionDays, Getdate()))
set @res = left(CONVERT(NVARCHAR,CONVERT(TIME, GETDATE())),9)+' / '+left(Convert(nvarchar,CONVERT(TIME, GETDATE()-@FromTime)),9)+' - Deleting BATCHCONSTRAINTSHISTORY'
insert #TmpOutput values ((select max(line)+1 from #TmpOutput), @Res)

--delete from BATCHHISTORY
SET @FromTime = GetDate()
delete from BATCHHISTORY
       where exists (select 1 from BATCHJOBHISTORY 
                                  where BATCHHISTORY.BATCHJOBHISTORYID = BATCHJOBHISTORY.recid 
                                  and BATCHJOBHISTORY.STARTDATETIME < DateAdd(day,-1*@RetensionDays, Getdate()))
set @res = left(CONVERT(NVARCHAR,CONVERT(TIME, GETDATE())),9)+' / '+left(Convert(nvarchar,CONVERT(TIME, GETDATE()-@FromTime)),9)+' - Deleting BATCHHISTORY'
insert #TmpOutput values ((select max(line)+1 from #TmpOutput), @Res)

--delete from BATCHJOBHISTORY
SET @FromTime = GetDate()
delete from BATCHJOBHISTORY
       where BATCHJOBHISTORY.STARTDATETIME < DateAdd(day,-1*@RetensionDays, Getdate())
set @res = left(CONVERT(NVARCHAR,CONVERT(TIME, GETDATE())),9)+' / '+left(Convert(nvarchar,CONVERT(TIME, GETDATE()-@FromTime)),9)+' - Deleting BATCHJOBHISTORY'
insert #TmpOutput values ((select max(line)+1 from #TmpOutput), @Res)

exec SaveTableCounts 'After',0

ROLLBACK tran;
select * from #TmpOutput

