select PurchId, AP_ActionCode from [AXGIT3].dbo.PurchPurchaseOrderHeader where AP_ActionCode<>''
select PurchId, AP_ActionCode from [AXGit3_2014_08_06].dbo.PurchPurchaseOrderHeader where AP_ActionCode<>''

select count(*) from [AXGIT3].dbo.PurchPurchaseOrderHeader
select count(*) from [AXGit3_2014_08_06].dbo.PurchPurchaseOrderHeader


select PaymentSchemaName,recid,* from [AXGIT3].dbo.CustVendAifPaymTable
select AP_MismatchPrice,AP_MismatchQty,AP_OverrideReceiveNow,AP_ProductReceiptQty,recid,* from [AXGit3_2014_08_06].dbo.VendInvoiceInfoLine

update [AXGIT3].dbo.AP_EuroDelkredereTrans 
	set [AXGIT3].dbo.AP_EuroDelkredereTrans.VendInvoiceJourRefRecId = PT2.VendInvoiceJourRefRecId,
		[AXGIT3].dbo.AP_EuroDelkredereTrans.VendAccount = PT2.VendAccount,
		[AXGIT3].dbo.AP_EuroDelkredereTrans.CashDiscLine = PT2.CashDiscLine,
		[AXGIT3].dbo.AP_EuroDelkredereTrans.LedgerJournalId = PT2.LedgerJournalId
--select count(*) 
	from [AXGIT3].dbo.AP_EuroDelkredereTrans as PT1 join [AXGit3_2014_08_06].dbo.AP_EuroDelkredereTrans as PT2 
	on PT1.RECID = PT2.RECID


	select count(*) from [AXGit3_2014_08_06].dbo.CustVendAifPaymTable where PaymentSchemaName<>''
	select count(*) from [AXGit3].dbo.CustVendAifPaymTable where PaymentSchemaName<>''