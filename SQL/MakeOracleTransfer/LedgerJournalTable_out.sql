use AXKNI_MOVE
UPDATE AXKNI_MOVE.dbo.TMP_LEDGERJOURNALTABLE
set
 JOURNALNUM = dbo.LP_STR(JOURNALNUM)
 ,NAME = dbo.LP_STR(NAME)
 ,VOUCHERSERIES = dbo.LP_STR(VOUCHERSERIES)
 ,LOG = dbo.LP_STR(LOG)
 ,USERBLOCKID = dbo.LP_STR(USERBLOCKID)
 ,OFFSETACCOUNT = dbo.LP_STR(OFFSETACCOUNT)
 ,REJECTEDBY = dbo.LP_STR(REJECTEDBY)
 ,REPORTEDASREADYBY = dbo.LP_STR(REPORTEDASREADYBY)
 ,APPROVEDBY = dbo.LP_STR(APPROVEDBY)
 ,JOURNALNAME = dbo.LP_STR(JOURNALNAME)
 ,INUSEBY = dbo.LP_STR(INUSEBY)
 ,GROUPBLOCKID = dbo.LP_STR(GROUPBLOCKID)
 ,DIMENSION = dbo.LP_STR(DIMENSION)
 ,DIMENSION2_ = dbo.LP_STR(DIMENSION2_)
 ,DIMENSION3_ = dbo.LP_STR(DIMENSION3_)
 ,ORIGINALJOURNALNUM = dbo.LP_STR(ORIGINALJOURNALNUM)
 ,CURRENCYCODE = dbo.LP_STR(CURRENCYCODE)
 ,DOCUMENTNUM = dbo.LP_STR(DOCUMENTNUM)
 ,ORIGINALCOMPANY = dbo.LP_STR(ORIGINALCOMPANY)
 ,BANKACCOUNTID = dbo.LP_STR(BANKACCOUNTID)
 ,MODIFIEDBY = dbo.LP_STR(MODIFIEDBY)
 ,CREATEDBY = dbo.LP_STR(CREATEDBY)
 ,DATAAREAID = dbo.LP_STR(DATAAREAID)
GO
DROP VIEW Tmp_ViewLEDGERJOURNALTABLE
DROP VIEW Tmp_ViewLEDGERJOURNALTABLE_ORA
drop table dbo.TMP_LEDGERJOURNALTABLE
GO
select * into AX40_KNI_DRIFT.dbo.TMP_LEDGERJOURNALTABLE
FROM OPENQUERY(S2AX40TEST, 'SELECT 
 JOURNALNUM
 ,NAME
 ,VOUCHERSERIES
 ,LOG
 ,TO_CHAR(JOURNALTYPE) as JOURNALTYPE
 ,TO_CHAR(SYSTEMBLOCKED) as SYSTEMBLOCKED
 ,USERBLOCKID
 ,OFFSETACCOUNT
 ,POSTEDDATE
 ,REJECTEDBY
 ,REPORTEDASREADYBY
 ,APPROVEDBY
 ,JOURNALNAME
 ,TO_CHAR(POSTED) as POSTED
 ,TO_CHAR(OFFSETACCOUNTTYPE) as OFFSETACCOUNTTYPE
 ,INUSEBY
 ,GROUPBLOCKID
 ,DIMENSION
 ,DIMENSION2_
 ,DIMENSION3_
 ,ORIGINALJOURNALNUM
 ,CURRENCYCODE
 ,TO_CHAR(FIXEDEXCHRATE) as FIXEDEXCHRATE
 ,TO_CHAR(DETAILSUMMARYPOSTING) as DETAILSUMMARYPOSTING
 ,DOCUMENTNUM
 ,TO_CHAR(EXCHRATESECONDARY) as EXCHRATESECONDARY
 ,TO_CHAR(EXCHRATE) as EXCHRATE
 ,TO_CHAR(EUROTRIANGULATION) as EUROTRIANGULATION
 ,TO_CHAR(FIXEDOFFSETACCOUNT) as FIXEDOFFSETACCOUNT
 ,TO_CHAR(JOURNALTOTALCREDIT) as JOURNALTOTALCREDIT
 ,TO_CHAR(JOURNALTOTALDEBIT) as JOURNALTOTALDEBIT
 ,TO_CHAR(JOURNALTOTALOFFSETBALANCE) as JOURNALTOTALOFFSETBALANCE
 ,TO_CHAR(REMOVELINEAFTERPOSTING) as REMOVELINEAFTERPOSTING
 ,TO_CHAR(CURRENTOPERATIONSTAX) as CURRENTOPERATIONSTAX
 ,TO_CHAR(LEDGERJOURNALINCLTAX) as LEDGERJOURNALINCLTAX
 ,ORIGINALCOMPANY
 ,TO_CHAR(SESSIONID) as SESSIONID
 ,TO_CHAR(SESSIONLOGINTIME) as SESSIONLOGINTIME
 ,SESSIONLOGINDATE
 ,TO_CHAR(BANKREMITTANCETYPE) as BANKREMITTANCETYPE
 ,BANKACCOUNTID
 ,TO_CHAR(PROTESTSETTLEDBILL) as PROTESTSETTLEDBILL
 ,TO_CHAR(CUSTVENDNEGINSTPROTESTPROCESS) as CUSTVENDNEGINSTPROTESTPROCESS
 ,TO_CHAR(VOUCHERALLOCATEDATPOSTING) as VOUCHERALLOCATEDATPOSTING
 ,TO_CHAR(NUMOFLINES) as NUMOFLINES
 ,TO_CHAR(LINESLIMITBEFOREDISTRIBUTION) as LINESLIMITBEFOREDISTRIBUTION
 ,TO_CHAR(DC4IMPORT) as DC4IMPORT
 ,MODIFIEDDATE
 ,TO_CHAR(MODIFIEDTIME) as MODIFIEDTIME
 ,MODIFIEDBY
 ,CREATEDDATE
 ,TO_CHAR(CREATEDTIME) as CREATEDTIME
 ,CREATEDBY
 ,DATAAREAID
 ,TO_CHAR(RECVERSION) as RECVERSION
 ,TO_CHAR(RECID) as RECID
 FROM dbo.LEDGERJOURNALTABLE WHERE SUBSTR(NLS_LOWER(DATAAREAID),1,7) = ''kni''')
 
GO
CREATE VIEW TMP_ViewLEDGERJOURNALTABLE AS
 select 
 JOURNALNUM
 ,NAME
 ,VOUCHERSERIES
 ,LOG
 ,JOURNALTYPE
 ,SYSTEMBLOCKED
 ,USERBLOCKID
 ,OFFSETACCOUNT
 ,POSTEDDATE
 ,REJECTEDBY
 ,REPORTEDASREADYBY
 ,APPROVEDBY
 ,JOURNALNAME
 ,POSTED
 ,OFFSETACCOUNTTYPE
 ,INUSEBY
 ,GROUPBLOCKID
 ,DIMENSION
 ,DIMENSION2_
 ,DIMENSION3_
 ,ORIGINALJOURNALNUM
 ,CURRENCYCODE
 ,FIXEDEXCHRATE
 ,DETAILSUMMARYPOSTING
 ,DOCUMENTNUM
 ,EXCHRATESECONDARY
 ,EXCHRATE
 ,EUROTRIANGULATION
 ,FIXEDOFFSETACCOUNT
 ,JOURNALTOTALCREDIT
 ,JOURNALTOTALDEBIT
 ,JOURNALTOTALOFFSETBALANCE
 ,REMOVELINEAFTERPOSTING
 ,CURRENTOPERATIONSTAX
 ,LEDGERJOURNALINCLTAX
 ,ORIGINALCOMPANY
 ,SESSIONID
 ,SESSIONLOGINTIME
 ,SESSIONLOGINDATE
 ,BANKREMITTANCETYPE
 ,BANKACCOUNTID
 ,PROTESTSETTLEDBILL
 ,CUSTVENDNEGINSTPROTESTPROCESS
 ,VOUCHERALLOCATEDATPOSTING
 ,NUMOFLINES
 ,LINESLIMITBEFOREDISTRIBUTION
 ,DC4IMPORT
 ,MODIFIEDDATE
 ,MODIFIEDTIME
 ,MODIFIEDBY
 ,CREATEDDATE
 ,CREATEDTIME
 ,CREATEDBY
 ,DATAAREAID
 ,RECVERSION
 ,RECID
 from dbo.LEDGERJOURNALTABLE
GO
 
CREATE VIEW TMP_ViewLEDGERJOURNALTABLE_ORA AS
select
 JOURNALNUM
 ,NAME
 ,VOUCHERSERIES
 ,LOG
 ,CAST(JOURNALTYPE as int) AS JOURNALTYPE
 ,CAST(SYSTEMBLOCKED as int) AS SYSTEMBLOCKED
 ,USERBLOCKID
 ,OFFSETACCOUNT
 ,POSTEDDATE
 ,REJECTEDBY
 ,REPORTEDASREADYBY
 ,APPROVEDBY
 ,JOURNALNAME
 ,CAST(POSTED as int) AS POSTED
 ,CAST(OFFSETACCOUNTTYPE as int) AS OFFSETACCOUNTTYPE
 ,INUSEBY
 ,GROUPBLOCKID
 ,DIMENSION
 ,DIMENSION2_
 ,DIMENSION3_
 ,ORIGINALJOURNALNUM
 ,CURRENCYCODE
 ,CAST(FIXEDEXCHRATE as int) AS FIXEDEXCHRATE
 ,CAST(DETAILSUMMARYPOSTING as int) AS DETAILSUMMARYPOSTING
 ,DOCUMENTNUM
 ,CAST(EXCHRATESECONDARY as real) AS EXCHRATESECONDARY
 ,CAST(EXCHRATE as real) AS EXCHRATE
 ,CAST(EUROTRIANGULATION as int) AS EUROTRIANGULATION
 ,CAST(FIXEDOFFSETACCOUNT as int) AS FIXEDOFFSETACCOUNT
 ,CAST(JOURNALTOTALCREDIT as real) AS JOURNALTOTALCREDIT
 ,CAST(JOURNALTOTALDEBIT as real) AS JOURNALTOTALDEBIT
 ,CAST(JOURNALTOTALOFFSETBALANCE as real) AS JOURNALTOTALOFFSETBALANCE
 ,CAST(REMOVELINEAFTERPOSTING as int) AS REMOVELINEAFTERPOSTING
 ,CAST(CURRENTOPERATIONSTAX as int) AS CURRENTOPERATIONSTAX
 ,CAST(LEDGERJOURNALINCLTAX as int) AS LEDGERJOURNALINCLTAX
 ,ORIGINALCOMPANY
 ,CAST(SESSIONID as int) AS SESSIONID
 ,CAST(SESSIONLOGINTIME as int) AS SESSIONLOGINTIME
 ,SESSIONLOGINDATE
 ,CAST(BANKREMITTANCETYPE as int) AS BANKREMITTANCETYPE
 ,BANKACCOUNTID
 ,CAST(PROTESTSETTLEDBILL as int) AS PROTESTSETTLEDBILL
 ,CAST(CUSTVENDNEGINSTPROTESTPROCESS as int) AS CUSTVENDNEGINSTPROTESTPROCESS
 ,CAST(VOUCHERALLOCATEDATPOSTING as int) AS VOUCHERALLOCATEDATPOSTING
 ,CAST(NUMOFLINES as int) AS NUMOFLINES
 ,CAST(LINESLIMITBEFOREDISTRIBUTION as int) AS LINESLIMITBEFOREDISTRIBUTION
 ,CAST(DC4IMPORT as int) AS DC4IMPORT
 ,MODIFIEDDATE
 ,CAST(MODIFIEDTIME as int) AS MODIFIEDTIME
 ,MODIFIEDBY
 ,CREATEDDATE
 ,CAST(CREATEDTIME as int) AS CREATEDTIME
 ,CREATEDBY
 ,DATAAREAID
 ,CAST(RECVERSION as int) AS RECVERSION
 ,CAST(RECID as bigint) AS RECID
from dbo.TMP_LEDGERJOURNALTABLE
GO
delete from TMP_ViewLEDGERJOURNALTABLE where dataareaid = 'KNI'
insert into TMP_ViewLEDGERJOURNALTABLE select * from TMP_ViewLEDGERJOURNALTABLE_ORA