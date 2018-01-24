drop function dbo.F_ISO_YEAR_WEEK_DAY_OF_WEEK
GO
create function dbo.F_ISO_YEAR_WEEK_DAY_OF_WEEK
	(
	@Date	datetime
	)
returns		varchar(10)
as
/*
Function F_ISO_YEAR_WEEK_DAY_OF_WEEK
returns the ISO 8601 Year Week Day of Week
in format YYYY-W01-D for the date passed.
*/
begin

declare @YearWeekDayOfWeek	varchar(10)

Select
	--Format to form YYYY-W01-D
	@YearWeekDayOfWeek =
	convert(varchar(4),year(dateadd(dd,7,a.YearStart)))+'-W'+
	right('00'+convert(varchar(2),(datediff(dd,a.YearStart,@Date)/7)+1),2)
	-- +'-'+convert(varchar(1),(datediff(dd,a.YearStart,@Date)%7)+1) 
from
(
select
	YearStart =
	-- Case finds start of year
	case
	when	NextYrStart <= @date
	then	NextYrStart
	when	CurrYrStart <= @date
	then	CurrYrStart
	else	PriorYrStart
	end
from
(
select
	-- First day of first week of prior year
	PriorYrStart =
	dateadd(dd,(datediff(dd,-53690,dateadd(yy,-1,aaa.Jan4))/7)*7,-53690),
	-- First day of first week of current year
	CurrYrStart =
	dateadd(dd,(datediff(dd,-53690,aaa.Jan4)/7)*7,-53690),
	-- First day of first week of next year
	NextYrStart =
	dateadd(dd,(datediff(dd,-53690,dateadd(yy,1,aaa.Jan4))/7)*7,-53690)
from
(
select
	--Find Jan 4 for the year of the input date
	Jan4	= 
	dateadd(dd,3,dateadd(yy,datediff(yy,0,@date),0))
) aaa
) aa
) a

return @YearWeekDayOfWeek

end
go


-- Execute function on first day, first day+60,
-- and first day+364 for years from 1990 to 2030.

select
	DT	= convert(varchar(10),DT,121),
	YR_START_DT = 
		dbo.F_ISO_YEAR_WEEK_DAY_OF_WEEK(a.DT),
	YR_START_DT_60 = 
		dbo.F_ISO_YEAR_WEEK_DAY_OF_WEEK(a.DT+60),
	YR_START_DT_365 = 
		dbo.F_ISO_YEAR_WEEK_DAY_OF_WEEK(a.DT+364)
from
	(
	select DT = getdate()	union all
	select DT = convert(datetime,'1990/01/01')  union all
	select DT = convert(datetime,'1990/12/31')  union all
	select DT = convert(datetime,'1991/12/30')  union all
	select DT = convert(datetime,'1993/01/04')  union all
	select DT = convert(datetime,'1994/01/03')  union all
	select DT = convert(datetime,'1995/01/02')  union all
	select DT = convert(datetime,'1996/01/01')  union all
	select DT = convert(datetime,'1996/12/30')  union all
	select DT = convert(datetime,'1997/12/29')  union all
	select DT = convert(datetime,'1999/01/04')  union all
	select DT = convert(datetime,'2000/01/03')  union all
	select DT = convert(datetime,'2001/01/01')  union all
	select DT = convert(datetime,'2001/12/31')  union all
	select DT = convert(datetime,'2002/12/30')  union all
	select DT = convert(datetime,'2003/12/29')  union all
	select DT = convert(datetime,'2005/01/03')  union all
	select DT = convert(datetime,'2006/01/02')  union all
	select DT = convert(datetime,'2007/01/01')  union all
	select DT = convert(datetime,'2007/12/31')  union all
	select DT = convert(datetime,'2008/12/29')  union all
	select DT = convert(datetime,'2010/01/04')  union all
	select DT = convert(datetime,'2011/01/03')  union all
	select DT = convert(datetime,'2012/01/02')  union all
	select DT = convert(datetime,'2012/12/31')  union all
	select DT = convert(datetime,'2013/12/30')  union all
	select DT = convert(datetime,'2014/12/29')  union all
	select DT = convert(datetime,'2016/01/04')  union all
	select DT = convert(datetime,'2017/01/02')  union all
	select DT = convert(datetime,'2018/01/01')  union all
	select DT = convert(datetime,'2018/12/31')  union all
	select DT = convert(datetime,'2019/12/30')  union all
	select DT = convert(datetime,'2021/01/04')  union all
	select DT = convert(datetime,'2022/01/03')  union all
	select DT = convert(datetime,'2023/01/02')  union all
	select DT = convert(datetime,'2024/01/01')  union all
	select DT = convert(datetime,'2024/12/30')  union all
	select DT = convert(datetime,'2025/12/29')  union all
	select DT = convert(datetime,'2027/01/04')  union all
	select DT = convert(datetime,'2028/01/03')  union all
	select DT = convert(datetime,'2029/01/01')  union all
	select DT = convert(datetime,'2029/12/31')  union all
	select DT = convert(datetime,'2030/12/30')
	) a