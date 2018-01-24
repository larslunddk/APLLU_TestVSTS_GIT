use ax30_develop
go
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID (N'dbo.MaxHoursOnTRS', N'FN') IS NOT NULL
    DROP FUNCTION dbo.MaxHoursOnTRS;
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION dbo.MaxHoursOnTRS
(
	-- Add the parameters for the function here
	@TRS Varchar(10)
)
RETURNS  varchar(10)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Empl Varchar(10)
	DECLARE @TimeUsed real
	DECLARE TimePerUser CURSOR FAST_FORWARD FOR
		SELECT     top 1 TR_REPORTTIME.USERID, SUM(TR_REPORTTIME.TOTALTIME) AS Expr1
			FROM         dbo.TR_REPORTTIME INNER JOIN
							TR_EMPLTABLE ON TR_REPORTTIME.USERID = TR_EMPLTABLE.TR_EMPLID
			WHERE     (TR_EMPLTABLE.TR_DEPT <> '63') AND (TR_REPORTTIME.TRS = @TRS) --'49638')
			GROUP BY TR_REPORTTIME.USERID, TR_REPORTTIME.TRS	
			order by Expr1 DESC	
	OPEN TimePerUser
	FETCH NEXT FROM TimePerUser INTO @Empl, @TimeUsed;
	CLOSE TimePerUser
	DEALLOCATE TimePerUser
	-- Return the result of the function
	RETURN @Empl

END
GO
--select dbo.MaxHoursOnTRS('49000') AS MaxHoursOnTRS

