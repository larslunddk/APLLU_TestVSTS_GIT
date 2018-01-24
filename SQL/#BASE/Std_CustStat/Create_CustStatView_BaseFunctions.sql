SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------------------------------------------------------------------------------
create function [dbo].[LP_YEAR_WEEK]
    (
    @Date    datetime
    )
returns        varchar(10)
as
/*
Function LP_YEAR_WEEK
returns the ISO 8601 Year Week Day of Week
in format YYYY-W01-D for the date passed.
*/
begin

declare @YearWeekDayOfWeek    varchar(10)

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
    when    NextYrStart <= @date
    then    NextYrStart
    when    CurrYrStart <= @date
    then    CurrYrStart
    else    PriorYrStart
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
    Jan4    =
    dateadd(dd,3,dateadd(yy,datediff(yy,0,@date),0))
) aaa
) aa
) a

return @YearWeekDayOfWeek

end
GO
--------------------------------------------------------------------------------------------------
CREATE function [dbo].[LP_App_FiscalYrMth]
    (
    @Date    Datetime
    )
returns        varchar(15)
as
begin
declare @FirstMth	Int
declare @FiscalYr	Int
declare @FiscalMth	Int
declare @FiscalYrMth varchar(7)

select @FirstMth = 8
select @FiscalYr = datepart(yyyy,@Date)
select @FiscalMth = datepart(mm,@Date) - 7
if (datepart(mm,@Date) < @FirstMth)
begin
	select @FiscalYr = @FiscalYr - 1
	select @FiscalMth = datepart(mm,@Date) + 6
end

select @FiscalYrMth = cast(@FiscalYr as varchar) + '-' +
					 right('00'+cast(@FiscalMth as varchar),2)
return @FiscalYrMth

end
GO
--------------------------------------------------------------------------------------------------
CREATE function [dbo].[LP_App_FiscalYr]
    (
    @Date    Datetime
    )
returns        varchar(15)
as
begin
return dbo.LP_App_FiscalYrMth(@Date)
end
GO


