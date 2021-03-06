USE [axdb_develop]
GO
/****** Object:  UserDefinedFunction [dbo].[LP_SalesStatus]    Script Date: 11/09/2008 11:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[LP_InventPostingType](@PostingType int)
				Returns varchar(30) AS
BEGIN
	DECLARE @Out varchar(30)
	if (@PostingType = 0) select @Out = 'none'
	if (@PostingType = 52) select @Out = 'SalesConsump'
	if (@PostingType = 61) select @Out = 'SalesIssue'
	if (@PostingType = 71) select @Out = 'PurchConsump'
	if (@PostingType = 72) select @Out = 'PurchDisc'
	if (@PostingType = 74) select @Out = 'PurchFreight'
	if (@PostingType = 75) select @Out = 'PurchFee'
	if (@PostingType = 76) select @Out = 'PurchPostage'
	if (@PostingType = 77) select @Out = 'PurchOffsetAccount'
	if (@PostingType = 78) select @Out = 'PurchaseInvoiceRoundOff'
	if (@PostingType = 79) select @Out = 'PurchMarkupFreight'
	if (@PostingType = 80) select @Out = 'PurchMarkupCustoms'
	if (@PostingType = 81) select @Out = 'PurchMarkupInsurance'
	if (@PostingType = 82) select @Out = 'PurchPckSlp'
	if (@PostingType = 83) select @Out = 'PurchOffsetAccountPckSlp'
	if (@PostingType = 84) select @Out = 'PurchReceipt'
	if (@PostingType = 85) select @Out = 'PurchStdProfit'
	if (@PostingType = 86) select @Out = 'PurchStdLoss'
	if (@PostingType = 87) select @Out = 'PurchStdOffsetAccount'
	if (@PostingType = 201) select @Out = 'PurchCharge'
	if (@PostingType = 202) select @Out = 'PurchStockValidation'
	if (@PostingType = 91) select @Out = 'InventReceipt'
    if (@PostingType = 92) select @Out = 'InventIssue'
    if (@PostingType = 93) select @Out = 'InventProfit'
    if (@PostingType = 94) select @Out = 'InventLoss'
    if (@PostingType = 95) select @Out = 'InventStdProfit'
    if (@PostingType = 96) select @Out = 'InventStdLoss'
    if (@PostingType = 207) select @Out = 'Std_TransportAlloc'
    if (@PostingType = 208) select @Out = 'Std_HandlingAlloc'
    if (@PostingType = 209) select @Out = 'Std_DutyAlloc'
    if (@PostingType = 210) select @Out = 'Std_PriceDiff'
    if (@PostingType = 211) select @Out = 'Std_PriceDiffOffset'
    if (@Out = '')
		select @Out = cast(@PostingType as nvarchar)
    Return @Out;
END
go
ALTER FUNCTION [dbo].[LP_InventTransPostingType](@PostingType int)
				Returns varchar(30) AS
BEGIN
	DECLARE @Out varchar(30)
	if (@PostingType = 0) select @Out = 'Physical'
	if (@PostingType = 1) select @Out = 'Financial'
	if (@PostingType = 2) select @Out = 'Physical Revenue'
    if (@Out = '')
		select @Out = cast(@PostingType as nvarchar)
    Return @Out;
END

--select PostingType, dbo.lp_InventPostingType(PostingType),postingtypeoffset, dbo.lp_InventPostingType(PostingTypeOffset) from inventtransposting
select top 10 * from InventTrans where Voucher like '%110068' order by itemid
select Voucher,dbo.lp_inventpostingtype(PostingType) as PostingType,account, dbo.lp_inventpostingtype(PostingTypeOffset) as PostingTypeOffset,
	 AccountOffset, dbo.LP_InventTransPostingType(InventTransPostingType) as InventTransPostingType
	from inventTransPosting where voucher like '%110068' 
select top 10 * from LedgerTrans where voucher like '%110068' 