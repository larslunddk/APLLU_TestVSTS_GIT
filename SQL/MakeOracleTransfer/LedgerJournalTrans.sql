INSERT INTO [AXKNITEST].[dbo].[LEDGERJOURNALTRANS]
           ([JOURNALNUM]
           ,[LINENUM]
           ,[ACCOUNTTYPE]
           ,[ACCOUNTNUM]
           ,[COMPANY]
           ,[TXT]
           ,[AMOUNTCURDEBIT]
           ,[CURRENCYCODE]
           ,[EXCHRATE]
           ,[TAXGROUP]
           ,[QTY]
           ,[DIMENSION]
           ,[DIMENSION2_]
           ,[DIMENSION3_]
           ,[BANKNEGINSTRECIPIENTNAME]
           ,[POSTDATEDCHECK_MY]
           ,[PRICE]
           ,[DEL_CORRECTIVEREASON]
           ,[DEL_CORRECTEDINVOICEID]
           ,[INTERCODIMENSION]
           ,[INTERCODIMENSION2_]
           ,[INTERCODIMENSION3_]
           ,[SETTLEVOUCHER]
           ,[POSTINGPROFILE]
           ,[VOUCHER]
           ,[AMOUNTCURCREDIT]
           ,[PAYMENTSTATUS]
           ,[CASHDISCAMOUNT]
           ,[VENDTRANSID]
           ,[CUSTTRANSID]
           ,[REMAINAMOUNT]
           ,[TAXCODE]
           ,[OFFSETACCOUNT]
           ,[BANKDEPOSITVOUCHER]
           ,[PAYMREFERENCE]
           ,[BANKDEPOSITNUM]
           ,[PAYMSPEC]
           ,[PAYMMODE]
           ,[OFFSETACCOUNTTYPE]
           ,[BANKTRANSTYPE]
           ,[OFFSETCOMPANY]
           ,[OFFSETTXT]
           ,[PAYMENTNOTES]
           ,[FOREIGNVOUCHER]
           ,[FOREIGNCOMPANY]
           ,[DEL_FOREIGNTAX]
           ,[TRANSFERRED]
           ,[CANCEL]
           ,[NOEDIT]
           ,[INVISIBLE]
           ,[TRANSDATE]
           ,[TRANSACTIONTYPE]
           ,[DOCUMENTDATE]
           ,[DOCUMENTNUM]
           ,[APPROVED]
           ,[APPROVEDBY]
           ,[PAYMID]
           ,[FREQVALUE]
           ,[FREQCODE]
           ,[DUE]
           ,[DATECASHDISC]
           ,[TRANSFERREDBY]
           ,[LOADINGDATE]
           ,[FILECREATED]
           ,[PAYMENTACCOUNT]
           ,[INVOICE]
           ,[TRANSFERREDTO]
           ,[TRANSFER]
           ,[LASTTRANSFERRED]
           ,[TRANSFERREDON]
           ,[PURCHLEDGERPOSTING]
           ,[BANKCHEQUENUM]
           ,[PAYMENT]
           ,[CASHDISCCODE]
           ,[EXCHRATESECOND]
           ,[TRIANGULATION]
           ,[TAXITEMGROUP]
           ,[VATNUMJOURNAL]
           ,[LISTCODE]
           ,[FURTHERPOSTINGTYPE]
           ,[PURCHIDRANGE]
           ,[POOLRECID]
           ,[PREPAYMENT]
           ,[IMPORTDATE]
           ,[DEL_OCRLINE]
           ,[BANKCENTRALBANKPURPOSECODE]
           ,[BANKCENTRALBANKPURPOSETEXT]
           ,[CUSTVENDBANKACCOUNTID]
           ,[PAYMENTSEQUENCENUM]
           ,[ASSETTRANSTYPE]
           ,[DEL_ASSETTOFROMRECID]
           ,[ASSETBUDGETMODEL]
           ,[ASSETID]
           ,[ASSETBUDGETPOSTINGSTATUS]
           ,[ASSETDEPRECIATIONTIME]
           ,[ASSETREFASSETID]
           ,[PROJTAXGROUPSALES]
           ,[PROJTAXITEMGROUPSALES]
           ,[ERRORCODEPAYMENT]
           ,[FURTHERPOSTINGRECID]
           ,[TAXDIRECTIONCONTROL]
           ,[RESERVETRANSID]
           ,[DEL_ASSETSECTION179TRANS]
           ,[ASSETREVALUATIONAMOUNT]
           ,[ASSETREVALUATIONTRANS]
           ,[ASSETCONSUMPTIONQTY]
           ,[ASSETBOOKID]
           ,[CUSTVENDNEGINSTPROTESTREASON]
           ,[BANKREMITTANCETYPE]
           ,[BANKREMITTANCEFILEID]
           ,[BANKACCOUNTID]
           ,[BANKPROMISSORYNOTENUM]
           ,[PROJEMPLID]
           ,[DEL_PAYMITEMCODEID]
           ,[BANKBILLOFEXCHANGENUM]
           ,[NEGINSTID]
           ,[TAXWITHHOLDGROUP]
           ,[DC_CONTRACTID]
           ,[DC_CONTRACTVERSION]
           ,[DC_VENDAPPROVEID]
           ,[MODIFIEDDATE]
           ,[MODIFIEDTIME]
           ,[MODIFIEDBY]
           ,[CREATEDDATE]
           ,[CREATEDTIME]
           ,[CREATEDBY]
           ,[DATAAREAID]
           ,[RECVERSION]
           ,[RECID])
     VALUES
           (<JOURNALNUM, nvarchar(10),>
           ,<LINENUM, numeric,>
           ,<ACCOUNTTYPE, int,>
           ,<ACCOUNTNUM, nvarchar(20),>
           ,<COMPANY, nvarchar(3),>
           ,<TXT, nvarchar(60),>
           ,<AMOUNTCURDEBIT, numeric,>
           ,<CURRENCYCODE, nvarchar(3),>
           ,<EXCHRATE, numeric,>
           ,<TAXGROUP, nvarchar(10),>
           ,<QTY, numeric,>
           ,<DIMENSION, nvarchar(10),>
           ,<DIMENSION2_, nvarchar(10),>
           ,<DIMENSION3_, nvarchar(10),>
           ,<BANKNEGINSTRECIPIENTNAME, nvarchar(60),>
           ,<POSTDATEDCHECK_MY, int,>
           ,<PRICE, numeric,>
           ,<DEL_CORRECTIVEREASON, ntext,>
           ,<DEL_CORRECTEDINVOICEID, nvarchar(20),>
           ,<INTERCODIMENSION, nvarchar(10),>
           ,<INTERCODIMENSION2_, nvarchar(10),>
           ,<INTERCODIMENSION3_, nvarchar(10),>
           ,<SETTLEVOUCHER, int,>
           ,<POSTINGPROFILE, nvarchar(10),>
           ,<VOUCHER, nvarchar(20),>
           ,<AMOUNTCURCREDIT, numeric,>
           ,<PAYMENTSTATUS, int,>
           ,<CASHDISCAMOUNT, numeric,>
           ,<VENDTRANSID, bigint,>
           ,<CUSTTRANSID, bigint,>
           ,<REMAINAMOUNT, numeric,>
           ,<TAXCODE, nvarchar(10),>
           ,<OFFSETACCOUNT, nvarchar(20),>
           ,<BANKDEPOSITVOUCHER, int,>
           ,<PAYMREFERENCE, nvarchar(20),>
           ,<BANKDEPOSITNUM, nvarchar(20),>
           ,<PAYMSPEC, nvarchar(10),>
           ,<PAYMMODE, nvarchar(10),>
           ,<OFFSETACCOUNTTYPE, int,>
           ,<BANKTRANSTYPE, nvarchar(10),>
           ,<OFFSETCOMPANY, nvarchar(3),>
           ,<OFFSETTXT, nvarchar(60),>
           ,<PAYMENTNOTES, nvarchar(1000),>
           ,<FOREIGNVOUCHER, nvarchar(20),>
           ,<FOREIGNCOMPANY, nvarchar(3),>
           ,<DEL_FOREIGNTAX, int,>
           ,<TRANSFERRED, int,>
           ,<CANCEL, int,>
           ,<NOEDIT, int,>
           ,<INVISIBLE, int,>
           ,<TRANSDATE, datetime,>
           ,<TRANSACTIONTYPE, int,>
           ,<DOCUMENTDATE, datetime,>
           ,<DOCUMENTNUM, nvarchar(20),>
           ,<APPROVED, int,>
           ,<APPROVEDBY, nvarchar(10),>
           ,<PAYMID, nvarchar(200),>
           ,<FREQVALUE, int,>
           ,<FREQCODE, int,>
           ,<DUE, datetime,>
           ,<DATECASHDISC, datetime,>
           ,<TRANSFERREDBY, nvarchar(5),>
           ,<LOADINGDATE, datetime,>
           ,<FILECREATED, datetime,>
           ,<PAYMENTACCOUNT, nvarchar(20),>
           ,<INVOICE, nvarchar(20),>
           ,<TRANSFERREDTO, nvarchar(10),>
           ,<TRANSFER, int,>
           ,<LASTTRANSFERRED, datetime,>
           ,<TRANSFERREDON, datetime,>
           ,<PURCHLEDGERPOSTING, int,>
           ,<BANKCHEQUENUM, nvarchar(20),>
           ,<PAYMENT, nvarchar(10),>
           ,<CASHDISCCODE, nvarchar(10),>
           ,<EXCHRATESECOND, numeric,>
           ,<TRIANGULATION, int,>
           ,<TAXITEMGROUP, nvarchar(10),>
           ,<VATNUMJOURNAL, nvarchar(20),>
           ,<LISTCODE, int,>
           ,<FURTHERPOSTINGTYPE, int,>
           ,<PURCHIDRANGE, nvarchar(250),>
           ,<POOLRECID, bigint,>
           ,<PREPAYMENT, int,>
           ,<IMPORTDATE, datetime,>
           ,<DEL_OCRLINE, nvarchar(60),>
           ,<BANKCENTRALBANKPURPOSECODE, nvarchar(10),>
           ,<BANKCENTRALBANKPURPOSETEXT, nvarchar(140),>
           ,<CUSTVENDBANKACCOUNTID, nvarchar(10),>
           ,<PAYMENTSEQUENCENUM, int,>
           ,<ASSETTRANSTYPE, int,>
           ,<DEL_ASSETTOFROMRECID, bigint,>
           ,<ASSETBUDGETMODEL, nvarchar(10),>
           ,<ASSETID, nvarchar(20),>
           ,<ASSETBUDGETPOSTINGSTATUS, int,>
           ,<ASSETDEPRECIATIONTIME, numeric,>
           ,<ASSETREFASSETID, nvarchar(20),>
           ,<PROJTAXGROUPSALES, nvarchar(10),>
           ,<PROJTAXITEMGROUPSALES, nvarchar(10),>
           ,<ERRORCODEPAYMENT, nvarchar(30),>
           ,<FURTHERPOSTINGRECID, bigint,>
           ,<TAXDIRECTIONCONTROL, int,>
           ,<RESERVETRANSID, bigint,>
           ,<DEL_ASSETSECTION179TRANS, int,>
           ,<ASSETREVALUATIONAMOUNT, numeric,>
           ,<ASSETREVALUATIONTRANS, int,>
           ,<ASSETCONSUMPTIONQTY, numeric,>
           ,<ASSETBOOKID, nvarchar(10),>
           ,<CUSTVENDNEGINSTPROTESTREASON, int,>
           ,<BANKREMITTANCETYPE, int,>
           ,<BANKREMITTANCEFILEID, nvarchar(10),>
           ,<BANKACCOUNTID, nvarchar(10),>
           ,<BANKPROMISSORYNOTENUM, nvarchar(20),>
           ,<PROJEMPLID, nvarchar(10),>
           ,<DEL_PAYMITEMCODEID, nvarchar(2),>
           ,<BANKBILLOFEXCHANGENUM, nvarchar(20),>
           ,<NEGINSTID, nvarchar(20),>
           ,<TAXWITHHOLDGROUP, nvarchar(10),>
           ,<DC_CONTRACTID, nvarchar(10),>
           ,<DC_CONTRACTVERSION, int,>
           ,<DC_VENDAPPROVEID, nvarchar(10),>
           ,<MODIFIEDDATE, datetime,>
           ,<MODIFIEDTIME, int,>
           ,<MODIFIEDBY, nvarchar(5),>
           ,<CREATEDDATE, datetime,>
           ,<CREATEDTIME, int,>
           ,<CREATEDBY, nvarchar(5),>
           ,<DATAAREAID, nvarchar(3),>
           ,<RECVERSION, int,>
           ,<RECID, bigint,>)