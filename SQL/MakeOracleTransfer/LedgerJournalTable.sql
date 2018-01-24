INSERT INTO [AXKNITEST].[dbo].[LEDGERJOURNALTABLE]
           ([JOURNALNUM]
           ,[NAME]
           ,[VOUCHERSERIES]
           ,[LOG]
           ,[JOURNALTYPE]
           ,[SYSTEMBLOCKED]
           ,[USERBLOCKID]
           ,[OFFSETACCOUNT]
           ,[POSTEDDATE]
           ,[REJECTEDBY]
           ,[REPORTEDASREADYBY]
           ,[APPROVEDBY]
           ,[JOURNALNAME]
           ,[POSTED]
           ,[OFFSETACCOUNTTYPE]
           ,[INUSEBY]
           ,[GROUPBLOCKID]
           ,[DIMENSION]
           ,[DIMENSION2_]
           ,[DIMENSION3_]
           ,[ORIGINALJOURNALNUM]
           ,[CURRENCYCODE]
           ,[FIXEDEXCHRATE]
           ,[DETAILSUMMARYPOSTING]
           ,[DOCUMENTNUM]
           ,[EXCHRATESECONDARY]
           ,[EXCHRATE]
           ,[EUROTRIANGULATION]
           ,[FIXEDOFFSETACCOUNT]
           ,[JOURNALTOTALCREDIT]
           ,[JOURNALTOTALDEBIT]
           ,[JOURNALTOTALOFFSETBALANCE]
           ,[REMOVELINEAFTERPOSTING]
           ,[CURRENTOPERATIONSTAX]
           ,[LEDGERJOURNALINCLTAX]
           ,[ORIGINALCOMPANY]
           ,[SESSIONID]
           ,[SESSIONLOGINTIME]
           ,[SESSIONLOGINDATE]
           ,[BANKREMITTANCETYPE]
           ,[BANKACCOUNTID]
           ,[PROTESTSETTLEDBILL]
           ,[CUSTVENDNEGINSTPROTESTPROCESS]
           ,[VOUCHERALLOCATEDATPOSTING]
           ,[NUMOFLINES]
           ,[LINESLIMITBEFOREDISTRIBUTION]
           ,[DC4IMPORT]
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
           ,<NAME, nvarchar(60),>
           ,<VOUCHERSERIES, nvarchar(10),>
           ,<LOG, nvarchar(255),>
           ,<JOURNALTYPE, int,>
           ,<SYSTEMBLOCKED, int,>
           ,<USERBLOCKID, nvarchar(5),>
           ,<OFFSETACCOUNT, nvarchar(20),>
           ,<POSTEDDATE, datetime,>
           ,<REJECTEDBY, nvarchar(5),>
           ,<REPORTEDASREADYBY, nvarchar(5),>
           ,<APPROVEDBY, nvarchar(10),>
           ,<JOURNALNAME, nvarchar(10),>
           ,<POSTED, int,>
           ,<OFFSETACCOUNTTYPE, int,>
           ,<INUSEBY, nvarchar(5),>
           ,<GROUPBLOCKID, nvarchar(10),>
           ,<DIMENSION, nvarchar(10),>
           ,<DIMENSION2_, nvarchar(10),>
           ,<DIMENSION3_, nvarchar(10),>
           ,<ORIGINALJOURNALNUM, nvarchar(10),>
           ,<CURRENCYCODE, nvarchar(3),>
           ,<FIXEDEXCHRATE, int,>
           ,<DETAILSUMMARYPOSTING, int,>
           ,<DOCUMENTNUM, nvarchar(20),>
           ,<EXCHRATESECONDARY, numeric,>
           ,<EXCHRATE, numeric,>
           ,<EUROTRIANGULATION, int,>
           ,<FIXEDOFFSETACCOUNT, int,>
           ,<JOURNALTOTALCREDIT, numeric,>
           ,<JOURNALTOTALDEBIT, numeric,>
           ,<JOURNALTOTALOFFSETBALANCE, numeric,>
           ,<REMOVELINEAFTERPOSTING, int,>
           ,<CURRENTOPERATIONSTAX, int,>
           ,<LEDGERJOURNALINCLTAX, int,>
           ,<ORIGINALCOMPANY, nvarchar(3),>
           ,<SESSIONID, int,>
           ,<SESSIONLOGINTIME, int,>
           ,<SESSIONLOGINDATE, datetime,>
           ,<BANKREMITTANCETYPE, int,>
           ,<BANKACCOUNTID, nvarchar(10),>
           ,<PROTESTSETTLEDBILL, int,>
           ,<CUSTVENDNEGINSTPROTESTPROCESS, int,>
           ,<VOUCHERALLOCATEDATPOSTING, int,>
           ,<NUMOFLINES, int,>
           ,<LINESLIMITBEFOREDISTRIBUTION, int,>
           ,<DC4IMPORT, int,>
           ,<MODIFIEDDATE, datetime,>
           ,<MODIFIEDTIME, int,>
           ,<MODIFIEDBY, nvarchar(5),>
           ,<CREATEDDATE, datetime,>
           ,<CREATEDTIME, int,>
           ,<CREATEDBY, nvarchar(5),>
           ,<DATAAREAID, nvarchar(3),>
           ,<RECVERSION, int,>
           ,<RECID, bigint,>)