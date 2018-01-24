declare @transdate	datetime
declare @DayCnt		int
declare @CntPT		int
declare @CntPL		int
select @transdate = '20090314'
select @DayCnt = 0
drop table #TmpDate
create table #TmpDate (transdate datetime, NoOfPT int, NoOfPL int)

while (@DayCnt<15)
begin
	set @CntPT = (select count(*) from purchtabledelete where createddate = @transdate)
	set @CntPL = (select count(*) from purchlinedelete where createddate = @transdate)
	insert into #TmpDate 
	values(	@transdate,@CntPT, @CntPL)
	select @TransDate = dateadd(day,1,@TransDate)
	select @DayCnt = @DayCnt+1
end
select * from #TmpDate
