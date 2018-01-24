set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[LP_YEAR_MTH_DAY]
    (
    @Date    datetime
    )
returns        varchar(10)
as
begin
declare @YearMthDay varchar(10)
Select
    --Format to form YYYY-MM
    @YearMthDay =
    convert(varchar(4),year(@Date))+'-'+
    right('00'+convert(varchar(2),datepart(mm,@Date)),2)+'-'+
	right('00'+convert(varchar(2),datepart(dd,@Date)),2)


return @YearMthDay

end