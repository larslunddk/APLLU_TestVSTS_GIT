-- =============================================
-- Create procedure basic template
-- =============================================
-- creating the store procedure

IF EXISTS (SELECT name 
	   FROM   sysobjects 
	   WHERE  name = N'PCS_TRS_PCSResponsible' 
	   AND 	  type = 'P')
    DROP PROCEDURE PCS_TRS_PCSResponsible
GO

CREATE PROCEDURE PCS_TRS_PCSResponsible 
	@TRS varchar(49)
AS
	select top 1 TR_REPORTTIME.USERID, SUM(TR_REPORTTIME.TOTALTIME) AS SumTotalTime , TRS,
			(select PCS_TRSREPORT.PCS_USER_DESC from PCS_TRSREPORT where PCS_TRSID = @TRS)
			from TR_REPORTTIME 
			where TR_REPORTTIME.TRS = @TRS
			and exists (select TR_DEPT from TR_EMPLTABLE where TR_EMPLTABLE.TR_EMPLID = TR_REPORTTIME.USERID and TR_EMPLTABLE.TR_DEPT <> '63' and TR_EMPLTABLE.TR_DEPT <> '99')
			group by TRS, TR_REPORTTIME.USERID
			order by SumTotalTime DESC
GO

-- =============================================
-- example to execute the store procedure
-- =============================================
Use ax30_develop
EXECUTE PCS_TRS_PCSResponsible '38387'
GO

