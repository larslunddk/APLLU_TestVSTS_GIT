Drop table #TmpInfo
CREATE TABLE #TmpInfo
(
    DateTime Datetime,
    Text	nvarchar(500)
);
GO
DROP PROCEDURE dbo.CountRecords
GO
CREATE PROCEDURE dbo.CountRecords
    @RetensionDays int = 0,
	@SuffixTxt	nvarchar(30)

AS
	declare @RecCount	int
	declare @StartTime	DateTime
	SET @StartTime = GETDATE();
	select @RecCount = count(*) from BATCHCONSTRAINTSHISTORY
		   where exists (select 1 from BATCHHISTORY, BATCHJOBHISTORY 
									  where BATCHHISTORY.BATCHJOBHISTORYID = BATCHJOBHISTORY.recid 
									  and BATCHCONSTRAINTSHISTORY.BATCHID = BATCHHISTORY.RECID 
									  and BATCHJOBHISTORY.STARTDATETIME < DateAdd(day,-1*@RetensionDays, Getdate()))
	insert into #TmpInfo values(GETDATE(), convert(nvarchar(30),getdate()-@StartTime,114)+' '+@SuffixTxt+' BATCHCONSTRAINTSHISTORY : '+cast(@RecCount as nvarchar(10)))

	--delete from BATCHHISTORY
	SET @StartTime = GETDATE()
	select @RecCount = count(*) from BATCHHISTORY
		   where exists (select 1 from BATCHJOBHISTORY 
									  where BATCHHISTORY.BATCHJOBHISTORYID = BATCHJOBHISTORY.recid 
									  and BATCHJOBHISTORY.STARTDATETIME < DateAdd(day,-1*@RetensionDays, Getdate()))
	insert into #TmpInfo values(GETDATE(), convert(nvarchar(30),getdate()-@StartTime,114)+' '+@SuffixTxt+' BATCHHISTORY : '+cast(@RecCount as nvarchar(10)))

	--delete from BATCHJOBHISTORY
	SET @StartTime = GETDATE();
	select @RecCount = count(*) from BATCHJOBHISTORY
		   where BATCHJOBHISTORY.STARTDATETIME < DateAdd(day,-1*@RetensionDays, Getdate())
    insert into #TmpInfo values(GETDATE(), convert(nvarchar(30),getdate()-@StartTime,114)+' '+@SuffixTxt+' BATCHJOBHISTORY : '+cast(@RecCount as nvarchar(10)))

GO


begin transaction
declare @RetensionDays as int
exec CountRecords @RetensionDays = 0, @SuffixTxt = 'Before'


set @RetensionDays = 60

delete from BATCHCONSTRAINTSHISTORY
       where exists (select 1 from BATCHHISTORY, BATCHJOBHISTORY 
                                  where BATCHHISTORY.BATCHJOBHISTORYID = BATCHJOBHISTORY.recid 
                                  and BATCHCONSTRAINTSHISTORY.BATCHID = BATCHHISTORY.RECID 
                                  and BATCHJOBHISTORY.STARTDATETIME < DateAdd(day,-1*@RetensionDays, Getdate()))
delete from BATCHHISTORY
       where exists (select 1 from BATCHJOBHISTORY 
                                  where BATCHHISTORY.BATCHJOBHISTORYID = BATCHJOBHISTORY.recid 
                                  and BATCHJOBHISTORY.STARTDATETIME < DateAdd(day,-1*@RetensionDays, Getdate()))
delete from BATCHJOBHISTORY
       where BATCHJOBHISTORY.STARTDATETIME < DateAdd(day,-1*@RetensionDays, Getdate())

exec CountRecords @RetensionDays = 0, @SuffixTxt = 'after'
select * from #TmpInfo

commit tran;


-- Reducing 54.105.141 records in Batch (90 days) - approx 1 hour on virtual SQL
-- Reducing  1.107.527 records in BatchJob (90 days) - approx 1 hour on virtual SQL

-- Reducing 73.559.948 records in Batch (70 days) - approx 31 min on physical SQL
-- Reducing  1.532.770 records in BatchJob (70 days) - approx 31 min on physical SQL

--select 96570866-23010918
--select  2514945- 982175