IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES 
					WHERE SPECIFIC_SCHEMA = N'dbo' AND SPECIFIC_NAME = N'LP_DropProcedure')
   DROP PROCEDURE dbo.LP_DropProcedure
GO
CREATE PROCEDURE dbo.LP_DropProcedure @ProcedureName Varchar(50) AS
BEGIN
	Declare @SQLString varchar(4000)
	IF object_id(N'dbo.'+@ProcedureName, 'PROCEDURE') IS NOT NULL
	BEGIN
		select @SQLString = 'DROP PROCEDURE dbo.'+@ProcedureName
		EXECUTE(@SQLString)
	END
END
GO

exec dbo.LP_DropProcedure 'LP_DropView'
GO
CREATE PROCEDURE dbo.LP_DropView @ViewName Varchar(50) AS
	Declare @SQLString varchar(4000)
	IF object_id(N'dbo.'+@ViewName, 'V') IS NOT NULL
	BEGIN
		select @SQLString = 'DROP VIEW dbo.'+@ViewName
		EXECUTE(@SQLString)
	END
GO

exec dbo.LP_DropProcedure 'LP_DropFunction'
GO
CREATE PROCEDURE dbo.LP_DropFunction @FunctionName Varchar(50) AS
	Declare @SQLString varchar(4000)
	IF  OBJECT_ID(@FunctionName) IS NOT NULL --EXISTS (SELECT * FROM sys.objects 
													--WHERE object_id = OBJECT_ID('dbo.'+@FunctionName)
													-- AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))        
	BEGIN
		select @SQLString = 'DROP FUNCTION dbo.'+@FunctionName
		EXECUTE(@SQLString)
	END
GO

exec dbo.LP_DropProcedure 'LP_DropTable'
GO
CREATE PROCEDURE dbo.LP_DropTable @TableName Varchar(50) AS
	Declare @SQLString varchar(4000)
	IF object_id(N'dbo.'+@TableName, 'U') IS NOT NULL
	BEGIN
		select @SQLString = 'DROP Table dbo.'+@TableName
		EXECUTE(@SQLString)
	END
GO

exec dbo.LP_DropFunction 'AP_DateTime2Time'
GO
CREATE FUNCTION dbo.LP_DateTime2Time (@SQLDate datetime)
	RETURNS int AS
BEGIN
	Declare @RetTime	int
	select @RetTime =(datepart(hh,@SQLDate)*3600)+
	(datepart(mi,@SQLDate)*60)+
	(datepart(s,@SQLDate))
	Return @RetTime;
END
GO

Exec LP_DropFunction 'AP_CombineFields'
GO
-- Concatenate 2 fields. If Fld1 is blank, only blank is returned. Can be used in views etc.
CREATE FUNCTION LP_CombineFields (@Fld1 varchar(100), @Fld2 varchar(100))
				Returns varchar(100) AS
BEGIN
    DECLARE @OutFld varchar(100)
    SELECT @OutFld = CASE WHEN @Fld1 <> '' THEN @Fld1 + ' ' + @Fld2 ELSE @Fld1 END;
    Return @OutFld;
END
GO

Exec LP_DropFunction 'AP_MakeDate'
GO
CREATE function [dbo].[LP_MakeDate](@Year int, @Month int, @Day int)
  returns datetime
AS
BEGIN
  declare @d datetime;
  set @d = dateadd(year,(@Year - 1753),'1/1/1753');
  set @d = dateadd(month,@Month - 1,@d);
  return dateadd(day,@Day - 1,@d)
END
GO

Exec LP_DropFunction 'AP_StatusIssue'
GO
CREATE FUNCTION LP_StatusIssue (@StatusIssue int)
				Returns varchar(30) AS
BEGIN
	DECLARE @Out varchar(30)
	if (@StatusIssue = 0) select @Out = 'none'
	if (@StatusIssue = 1) select @Out = 'Sold'
	if (@StatusIssue = 2) select @Out = 'Deducted'
	if (@StatusIssue = 3) select @Out = 'Picked'
	if (@StatusIssue = 4) select @Out = 'Resv.Physical'
	if (@StatusIssue = 5) select @Out = 'Resv.Ordered'
	if (@StatusIssue = 6) select @Out = 'OnOrder'
	if (@StatusIssue = 7) select @Out = 'QuotationIssue'
    Return @Out;
END
GO
Exec LP_DropFunction 'AP_StatusReceipt'
GO
CREATE FUNCTION LP_StatusReceipt(@StatusReceipt int)
				Returns varchar(30) AS
BEGIN
	DECLARE @Out varchar(30)
	if (@StatusReceipt = 0) select @Out = 'none'
	if (@StatusReceipt = 1) select @Out = 'Purchased'
	if (@StatusReceipt = 2) select @Out = 'Received'
	if (@StatusReceipt = 3) select @Out = 'Registered'
	if (@StatusReceipt = 4) select @Out = 'Arrived'
	if (@StatusReceipt = 5) select @Out = 'Ordered'
	if (@StatusReceipt = 6) select @Out = 'QuotationReceipt'
    Return @Out;
END
GO
Exec LP_DropFunction 'AP_PurchStatus'
GO
CREATE FUNCTION LP_PurchStatus(@PurchStatus int)
				Returns varchar(30) AS
BEGIN
	DECLARE @Out varchar(30)
	if (@PurchStatus = 0) select @Out = 'none'
	if (@PurchStatus = 1) select @Out = 'BackOrder'
	if (@PurchStatus = 2) select @Out = 'Received'
	if (@PurchStatus = 3) select @Out = 'Invoiced'
	if (@PurchStatus = 4) select @Out = 'Cancelled'
    Return @Out;
END
GO
Exec LP_DropFunction 'AP_InvTransType'
GO
CREATE FUNCTION AP_InvTransType (@InvTransTypeInt int)
				RETURNS nvarchar(40)
AS
BEGIN
	DECLARE @InvTransTypeTxt nvarchar(40)
	SET @InvTransTypeTxt=(CASE @InvTransTypeInt when 0 then 'Sales' when 3 then 'purch' when 4 then 'inventtransaction' when 5 then 'inventlossprofit' when 6 then 'inventtransfer' when 13 then 'inventcounting' when 21 then 'TransferOrderShip' when 22 then 'TransferOrderReceive' when 150 then 'Statement' end)
	RETURN @InvTransTypeTxt
END
Exec LP_DropFunction 'AP_SalesStatus'
GO
CREATE FUNCTION LP_SalesStatus(@SalesStatus int)
				Returns varchar(30) AS
BEGIN
	DECLARE @Out varchar(30)
	if (@SalesStatus = 0) select @Out = 'none'
	if (@SalesStatus = 1) select @Out = 'BackOrder'
	if (@SalesStatus = 2) select @Out = 'Delivered'
	if (@SalesStatus = 3) select @Out = 'Invoiced'
	if (@SalesStatus = 4) select @Out = 'Cancelled'
    Return @Out;
END
GO

Exec LP_DropFunction 'AP_AddressType'
GO
CREATE  FUNCTION [dbo].[AP_AddressType] (@AddrType int)
				Returns varchar(30) AS
BEGIN
	DECLARE @Out varchar(30)
	if (@AddrType = 0) select @Out = '0 none'
	if (@AddrType = 1) select @Out = '1 Invoice'
	if (@AddrType = 2) select @Out = '2 Delivery'
	if (@AddrType = 3) select @Out = '3 AltDelivery'
	if (@AddrType = 4) select @Out = '4 SWIFT'
	if (@AddrType = 5) select @Out = '5 Payment'
	if (@AddrType = 6) select @Out = '6 Service'
	if (@AddrType = 7) select @Out = '7 Home'
	if (@AddrType = 8) select @Out = '8 Other'
	if (@AddrType = 9) select @Out = '9 Business'
	if (@AddrType = 10) select @Out = '10 RemitTo'
	if (@AddrType = 11) select @Out = '11 ShipCarrierThirdPartyShipping'
	if (@AddrType = 100) select @Out = '100 DEL_BKDRemitTo'
    Return @Out;
END
GO

Exec LP_DropFunction 'AP_Cur2MST'
GO
CREATE function [dbo].[LP_Cur2MST]
    (
    @Amount    real, 
	@Dataarea varchar(10), 
	@CalcDate datetime, 
	@MainCompany Varchar(10) = 'DK'
    )
returns        real
as
begin
	declare @CurRate		real
	declare @ExchRateDate	datetime
	declare @MSTAmount		real

    select @ExchRateDate = dbo.LP_MakeDate(Year(@CalcDate),1,1)
	select @CurRate = (select top 1 ExchRate from ExchRates 
							where fromdate < @ExchRateDate  
							and   currencycode = (SELECT     CURRENCYCODE
														FROM         COMPANYINFO
														WHERE     (DATAAREAID = @Dataarea)) 
							and dataareaid = @MainCompany order by fromdate desc)
	select @MSTAmount = @Amount * (@CurRate  / 100)
	return @MSTAmount
end
go







/*
exec dbo.LP_DropProcedure 'LP_LogProgressInfo'
GO
CREATE PROCEDURE dbo.LP_LogProgressInfo @InfoLine Varchar(100), @Jobcode varchar(50) = 'Empty', @StartEnd int = 0, @SessionId int = 999 AS
	select CONVERT(char(30), getdate())+' '+@InfoLine  
	IF  EXISTS (SELECT * FROM sys.objects 
					WHERE object_id = OBJECT_ID(N'[bmssa].[LP_LogTable]') AND type in (N'U')) 
	BEGIN
		Declare @RELATEDFROMDATE	as DateTime
		Declare @RELATEDFROMTIME	as int

		Declare @NewRecId   as int
		UPDATE bmssa.SystemSequences SET @NewRecid  = NextVal, NextVal    = NextVal + 1
			WHERE ID = -1 AND TABID = 0 AND Dataareaid = 'DAT';
		IF (@StartEnd = 2 /*End*/)
		BEGIN
			SELECT @RELATEDFROMDATE = (SELECT     TOP (1) LOGDATE
										FROM     bmssa.LP_LOGTABLE
										WHERE    (JOBCODE = @JobCode) AND (STARTEND = 1)
										ORDER BY JOBCODE, LOGDATE DESC, LOGTIME DESC);
			SELECT @RELATEDFROMTIME = (SELECT     TOP (1) LOGTIME
										FROM     bmssa.LP_LOGTABLE
										WHERE    (JOBCODE = @JobCode) AND (STARTEND = 1)
										ORDER BY JOBCODE, LOGDATE DESC, LOGTIME DESC);
		END ELSE
		BEGIN
			SELECT @RELATEDFROMDATE = '19000101';
			SELECT @RELATEDFROMTIME = 0;
		END
		INSERT INTO bmssa.LP_LOGTABLE
                      (TXT, LOGDATE, LOGTIME, RELATEDFROMDATE, RELATEDFROMTIME, JOBCODE, STARTEND, SESSIONID, DATAAREAID, RECID,MODIFIEDTIME,MODIFIEDBY)
		VALUES     (@InfoLine,getdate(),dbo.LP_DateTime2Time(getdate()),
					@RELATEDFROMDATE,@RELATEDFROMTIME,
					@JobCode,@StartEnd,@SessionId,'DAT',@NewRecId, dbo.LP_DateTime2Time(getdate()),User_Name())
	END
GO
-- TABLE LP_LOGTABLE must be created in Axapta with fields TXT, DateFrom, TimeFrom, DateTo, TimeTo, StartEnd INT, Jobcode STR 20, SessionId

Exec dbo.LP_LogProgressInfo 'LP_BASE_SP Stores procedures created','Step1',0
GO
*/