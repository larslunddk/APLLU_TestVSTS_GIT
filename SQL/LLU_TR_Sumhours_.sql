-- ================================================
-- Template generated from Template Explorer using:
-- Create Scalar Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID (N'dbo.HoursWk', N'FN') IS NOT NULL
    DROP FUNCTION dbo.HoursWk;
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION dbo.HoursWk
(
	-- Add the parameters for the function here
	@WkDate datetime, @Dept varchar(2)
)
RETURNS real
AS
BEGIN
	-- Declare the return variable here
	DECLARE @hourssum real

	-- Add the T-SQL statements to compute the return value here
	
	select @hourssum = 
	(
	SELECT     SUM(TR_REPORTTIME.TOTALTIME) AS Expr1
	FROM         TR_REPORTTIME INNER JOIN
                      TR_EMPLTABLE ON TR_REPORTTIME.USERID = TR_EMPLTABLE.TR_EMPLID
				WHERE      (TR_EMPLTABLE.TR_DEPT = @Dept AND TR_ReportTime.startdate BETWEEN @WkDate AND @WkDate+7)
	)
	-- Return the result of the function
	RETURN @hourssum

END
GO
select dbo.HoursWk(CONVERT(DATETIME,'10/01/2007',101),'62') AS HoursWk