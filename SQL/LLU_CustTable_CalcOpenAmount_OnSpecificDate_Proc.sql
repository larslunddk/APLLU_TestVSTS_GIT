IF OBJECT_ID ( 'dbo.calcCust_OpenAmountPerDateP', 'P' ) IS NOT NULL 
    DROP PROCEDURE dbo.calcCust_OpenAmountPerDate;
GO
CREATE PROCEDURE dbo.calcCust_OpenAmountPerDate @accountnum varchar(20), @currency varchar (10),@calcdate datetime,
 @OpenAmount numeric(28,12) OUTPUT
AS
BEGIN
	drop table #tmp
	select ACCOUNTNUM, CURRENCYCODE, 
	AMOUNTCUR-(CUSTTRANS.settleAmountCur - isnull((select sum(settleAmountCur) from custSettlement
									where custSettlement.transRecId = CUSTTRANS.recId and
										  custSettlement.transDate  > @calcdate),0)) as OpenAmountPerDate
	into #Tmp
	from CUSTTRANS
	where CUSTTRANS.ACCOUNTNUM = @accountnum
	and   CUSTTRANS.CURRENCYCODE = @currency
	and   CUSTTRANS.TRANSDATE <= @calcdate

	return select SUM(OpenAmountPerDate) from #Tmp
 end
 