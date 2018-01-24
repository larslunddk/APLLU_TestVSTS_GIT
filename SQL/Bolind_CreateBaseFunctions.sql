
/****** Object:  UserDefinedFunction [dbo].[LP_YEAR_WEEK]    Script Date: 11/19/2009 09:49:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

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


/****** Object:  UserDefinedFunction [dbo].[LP_YEAR_MTH]    Script Date: 11/19/2009 09:49:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[LP_YEAR_MTH]
    (
    @Date    datetime
    )
returns        varchar(10)
as
begin
declare @YearMth varchar(10)
Select
    --Format to form YYYY-MM
    @YearMth =
    convert(varchar(4),year(@Date))+'-'+
    right('00'+convert(varchar(2),datepart(mm,@Date)),2)


return @YearMth

end

GO


/****** Object:  UserDefinedFunction [dbo].[LP_Str2Dec]    Script Date: 11/19/2009 09:50:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create function [dbo].[LP_Str2Dec]
    (
    @Amount    varchar(20)
    )
returns        numeric(28,12)
as
begin
declare @RetAmount as numeric(28,12)
select @Amount = replace(@Amount,',','.')
select @RetAmount = cast(@Amount as numeric(28,12))
return @RetAmount

end


GO


/****** Object:  UserDefinedFunction [dbo].[LP_StrRFix]    Script Date: 11/19/2009 09:50:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE function [dbo].[LP_StrRFix]
    (
    @Str    varchar(50),@Len int
    )
returns        varchar(50)
as
begin

return right(replicate(' ',@len)+@Str,@len)

end

GO

/****** Object:  UserDefinedFunction [dbo].[LP_MTHNAME]    Script Date: 11/19/2009 09:50:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[LP_MTHNAME]
(
	@transdate	datetime
)
RETURNS varchar(20)
AS
BEGIN
	-- Return the result of the function
	RETURN right('00'+cast(datepart(mm,@transdate) as varchar(2)),2)+' '+DATENAME(month, @transdate) 

END


GO

/****** Object:  UserDefinedFunction [dbo].[LP_INT]    Script Date: 11/19/2009 09:50:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[LP_INT]
    (
    @Amount    real
    )
returns        varchar(15)
as
begin
declare @LPReal int
declare @LPInt varchar(15)

select @LPReal = cast(@Amount as INT)
Select @LPInt = cast(@LPReal as varchar)
return @LPINt

end


GO


/****** Object:  UserDefinedFunction [dbo].[LP_DECIMAL]    Script Date: 11/19/2009 09:57:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[LP_DECIMAL]
    (
    @Amount    real
    )
returns        varchar(15)
as
begin
declare @LPReal		Int
declare @LPDecimal	varchar(10)
select @LPReal = cast(@Amount as INT)
Select @LPDecimal = cast(@LPReal as varchar)+','+
				 right('00'+cast(ABS(CAST(100*(@Amount-@LPREal) as INT)) as varchar),2)
return @LPDecimal

end

GO




