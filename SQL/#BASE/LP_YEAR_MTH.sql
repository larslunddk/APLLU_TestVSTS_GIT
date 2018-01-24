set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[LP_YEAR_MTH]
    (
    @Date    datetime
    )
returns        varchar(10)
as
/*
Function LP_YEAR_MTH
in format YYYY-MM for the date passed.
*/
begin
declare @YearMth varchar(10)
Select
    --Format to form YYYY-MM
    @YearMth =
    convert(varchar(4),year(@Date))+'-'+
    right('00'+convert(varchar(2),datepart(mm,@Date)),2)


return @YearMth

end