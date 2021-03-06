if exists (select * from sysobjects where id = object_id(N'[bmssa].[ACCESSRIGHTSLIST]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[ACCESSRIGHTSLIST]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[ADDRESS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[ADDRESS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[ADDRESSFORMATHEADING]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[ADDRESSFORMATHEADING]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[ADDRESSFORMATLINES]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[ADDRESSFORMATLINES]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[BANKACCOUNTSTATEMENT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[BANKACCOUNTSTATEMENT]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[BANKACCOUNTTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[BANKACCOUNTTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[BANKACCOUNTTRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[BANKACCOUNTTRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[BANKCHEQUELAYOUT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[BANKCHEQUELAYOUT]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[BANKCHEQUEPAYMENTTRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[BANKCHEQUEPAYMENTTRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[BANKCHEQUETABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[BANKCHEQUETABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[BANKDEPOSIT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[BANKDEPOSIT]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[BANKGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[BANKGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[BANKPARAMETERS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[BANKPARAMETERS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[BANKTRANSACTIONTYPEGROUPHEADER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[BANKTRANSACTIONTYPEGROUPHEADER]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[BANKTRANSTYPE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[BANKTRANSTYPE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[BANKTRANSTYPEGROUPDETAILS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[BANKTRANSTYPEGROUPDETAILS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[BATCH]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[BATCH]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[BATCHGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[BATCHGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[BATCHJOURNALLINE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[BATCHJOURNALLINE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[BATCHJOURNALNAME]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[BATCHJOURNALNAME]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[BATCHJOURNALTYPE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[BATCHJOURNALTYPE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[BATCHJOURNALTYPEJOB]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[BATCHJOURNALTYPEJOB]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[BMDBTRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[BMDBTRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[BMPERFDETAIL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[BMPERFDETAIL]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[BMPERFREFERENCE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[BMPERFREFERENCE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[BMPERFRESULT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[BMPERFRESULT]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[BMPERFTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[BMPERFTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[BOM]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[BOM]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[BOMCALCTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[BOMCALCTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[BOMCALCTRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[BOMCALCTRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[BOMCONFIGROUTE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[BOMCONFIGROUTE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[BOMCONFIGRULE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[BOMCONFIGRULE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[BOMCOSTGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[BOMCOSTGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[BOMCOSTPROFIT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[BOMCOSTPROFIT]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[BOMPARAMETERS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[BOMPARAMETERS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[BOMPARMREPORTFINISH]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[BOMPARMREPORTFINISH]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[BOMSCRAP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[BOMSCRAP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[BOMTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[BOMTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[BOMVERSION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[BOMVERSION]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[BUDGETMODEL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[BUDGETMODEL]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[BUSINESSSTATISTICSDATA]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[BUSINESSSTATISTICSDATA]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[BUSINESSSTATISTICSDEF]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[BUSINESSSTATISTICSDEF]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CACADMINSALESTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CACADMINSALESTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CACALLOCCENTER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CACALLOCCENTER]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CACBABCOMPSUM]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CACBABCOMPSUM]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CACBABGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CACBABGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CACBABMAINSUM]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CACBABMAINSUM]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CACCENTER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CACCENTER]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CACCOSTCLASSIFICATION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CACCOSTCLASSIFICATION]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CACDISACCOUNT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CACDISACCOUNT]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CACDISALLOCVERSION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CACDISALLOCVERSION]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CACDISTTMPEDSSUM]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CACDISTTMPEDSSUM]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CACDIVISION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CACDIVISION]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CACHIERCENTER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CACHIERCENTER]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CACHIERCENTERMODEL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CACHIERCENTERMODEL]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CACLEDGER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CACLEDGER]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CACPERFLIST]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CACPERFLIST]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CACPERFLISTCENTER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CACPERFLISTCENTER]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CACPURPOSE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CACPURPOSE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CACREFERENCELIST]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CACREFERENCELIST]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CACREFLISTDEFACCOUNT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CACREFLISTDEFACCOUNT]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CACREFLISTDEFALLCENTER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CACREFLISTDEFALLCENTER]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CACREFLISTDEFCENTER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CACREFLISTDEFCENTER]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CACTEMPALLOCATION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CACTEMPALLOCATION]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CACTEMPCLASSIFICATION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CACTEMPCLASSIFICATION]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CASHDISC]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CASHDISC]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CCADOCOMMAND]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CCADOCOMMAND]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CCADOCONNECTION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CCADOCONNECTION]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CCSELECTIONLINE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CCSELECTIONLINE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CCSELECTIONTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CCSELECTIONTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CCSELECTIONTEMPLATE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CCSELECTIONTEMPLATE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[COMPANYDOMAINLIST]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[COMPANYDOMAINLIST]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[COMPANYINFO]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[COMPANYINFO]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CONFIGCHOICE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CONFIGCHOICE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CONFIGGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CONFIGGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CONFIGTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CONFIGTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CONTACTPERSON]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CONTACTPERSON]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[COUNTRY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[COUNTRY]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[COUNTY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[COUNTY]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CURRENCY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CURRENCY]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CUSTBANKACCOUNT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CUSTBANKACCOUNT]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CUSTCOLLECTIONLETTERJOUR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CUSTCOLLECTIONLETTERJOUR]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CUSTCOLLECTIONLETTERLINE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CUSTCOLLECTIONLETTERLINE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CUSTCOLLECTIONLETTERTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CUSTCOLLECTIONLETTERTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CUSTCOLLECTIONLETTERTRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CUSTCOLLECTIONLETTERTRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CUSTCONFIRMJOUR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CUSTCONFIRMJOUR]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CUSTCONFIRMTRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CUSTCONFIRMTRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CUSTGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CUSTGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CUSTINTEREST]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CUSTINTEREST]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CUSTINTERESTFEE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CUSTINTERESTFEE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CUSTINTERESTJOUR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CUSTINTERESTJOUR]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CUSTINTERESTTRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CUSTINTERESTTRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CUSTINVOICEJOUR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CUSTINVOICEJOUR]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CUSTINVOICELINE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CUSTINVOICELINE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CUSTINVOICETRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CUSTINVOICETRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CUSTLEDGER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CUSTLEDGER]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CUSTLEDGERACCOUNTS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CUSTLEDGERACCOUNTS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CUSTPACKINGSLIPJOUR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CUSTPACKINGSLIPJOUR]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CUSTPACKINGSLIPTRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CUSTPACKINGSLIPTRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CUSTPARAMETERS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CUSTPARAMETERS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CUSTPAYMMANFEE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CUSTPAYMMANFEE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CUSTPAYMMANFEEHIST]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CUSTPAYMMANFEEHIST]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CUSTPAYMMANFILE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CUSTPAYMMANFILE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CUSTPAYMMANPOSTREQ]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CUSTPAYMMANPOSTREQ]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CUSTPAYMMANSTEPPOSTING]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CUSTPAYMMANSTEPPOSTING]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CUSTPAYMMANSTEPTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CUSTPAYMMANSTEPTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CUSTPAYMMANTRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CUSTPAYMMANTRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CUSTPAYMMANTRANSHIST]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CUSTPAYMMANTRANSHIST]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CUSTPAYMMETHODVAL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CUSTPAYMMETHODVAL]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CUSTPAYMMODETABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CUSTPAYMMODETABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CUSTPICKINGLISTJOUR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CUSTPICKINGLISTJOUR]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CUSTPICKINGLISTTRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CUSTPICKINGLISTTRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CUSTQUOTATIONJOUR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CUSTQUOTATIONJOUR]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CUSTQUOTATIONTRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CUSTQUOTATIONTRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CUSTSETTLEMENT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CUSTSETTLEMENT]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CUSTSTATISTICSGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CUSTSTATISTICSGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CUSTTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CUSTTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CUSTTRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CUSTTRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CUSTTRANSOPEN]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CUSTTRANSOPEN]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CUSTVENDEXTERNALITEM]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CUSTVENDEXTERNALITEM]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[CUSTVENDITEMGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[CUSTVENDITEMGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[DATAAREA]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[DATAAREA]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[DATABASELOG]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[DATABASELOG]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[DELPROJJOURNALTRANSWEB]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[DELPROJJOURNALTRANSWEB]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[DESTINATIONCODE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[DESTINATIONCODE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[DIMENSIONS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[DIMENSIONS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[DLVMODE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[DLVMODE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[DLVTERM]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[DLVTERM]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[DOCUFIELD]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[DOCUFIELD]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[DOCUPARAMETERS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[DOCUPARAMETERS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[DOCUREF]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[DOCUREF]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[DOCUTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[DOCUTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[DOCUTYPE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[DOCUTYPE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[DOCUVALUE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[DOCUVALUE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[DOMAININFO]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[DOMAININFO]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[ECPCUSTSIGNUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[ECPCUSTSIGNUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[ECPPARAMETERS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[ECPPARAMETERS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[ECPPRESENTATION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[ECPPRESENTATION]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[EMPLTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[EMPLTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[EMPLTASK]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[EMPLTASK]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[EMPLWORKTASK]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[EMPLWORKTASK]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[EUSALESLIST]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[EUSALESLIST]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[EXCHRATES]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[EXCHRATES]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[FORECASTINVENT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[FORECASTINVENT]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[FORECASTITEMALLOCATION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[FORECASTITEMALLOCATION]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[FORECASTITEMALLOCATIONLINE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[FORECASTITEMALLOCATIONLINE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[FORECASTMODEL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[FORECASTMODEL]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[FORECASTPURCH]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[FORECASTPURCH]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[FORECASTSALES]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[FORECASTSALES]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[FORMLETTERREMARKS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[FORMLETTERREMARKS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[GANTTLINE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[GANTTLINE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[GANTTTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[GANTTTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMAPPLICANTINTERVIEW]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMAPPLICANTINTERVIEW]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMAPPLICANTROUTING]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMAPPLICANTROUTING]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMAPPLICANTTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMAPPLICANTTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMAPPLICATION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMAPPLICATION]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMBENEFITTYPE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMBENEFITTYPE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMBRANCHCODE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMBRANCHCODE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMCOMPANYCONTACTBRANCHCODE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMCOMPANYCONTACTBRANCHCODE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMCOMPANYCONTACTGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMCOMPANYCONTACTGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMCOMPANYCONTACTPRODUCTTYPE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMCOMPANYCONTACTPRODUCTTYPE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMCOMPANYCONTACTTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMCOMPANYCONTACTTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMCOURSEATTENDEE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMCOURSEATTENDEE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMCOURSEINSTRUCTOR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMCOURSEINSTRUCTOR]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMCOURSELOCATION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMCOURSELOCATION]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMCOURSEROOM]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMCOURSEROOM]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMCOURSEROOMGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMCOURSEROOMGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMCOURSETABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMCOURSETABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMCOURSETEMPLATE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMCOURSETEMPLATE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMCOURSETEMPLATEINSTRUCTOR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMCOURSETEMPLATEINSTRUCTOR]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMCOURSETEMPLATEROOM]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMCOURSETEMPLATEROOM]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMCOURSETYPE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMCOURSETYPE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMCOURSETYPECOLLECTION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMCOURSETYPECOLLECTION]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMDEVELOPMENTPLANTYPE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMDEVELOPMENTPLANTYPE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMEDUCATIONCENTER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMEDUCATIONCENTER]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMEDUCATIONDEGREE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMEDUCATIONDEGREE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMEDUCATIONGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMEDUCATIONGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMEDUCATIONGROUPTYPE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMEDUCATIONGROUPTYPE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMEDUCATIONTYPE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMEDUCATIONTYPE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMEMPLOYEEBENEFIT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMEMPLOYEEBENEFIT]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMEMPLOYEECONTACT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMEMPLOYEECONTACT]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMEMPLOYEECOUNTTYPE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMEMPLOYEECOUNTTYPE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMJOB]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMJOB]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMJOBRESPONSIBILITY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMJOBRESPONSIBILITY]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMJOBSKILLPROFILE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMJOBSKILLPROFILE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMJOBTASK]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMJOBTASK]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMLANGUAGECODE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMLANGUAGECODE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMLOANTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMLOANTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMLOANTYPE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMLOANTYPE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMMEDIA]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMMEDIA]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMMEDIATYPE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMMEDIATYPE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMORGANIZATION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMORGANIZATION]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMPARAMETERS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMPARAMETERS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMPOSITION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMPOSITION]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMPOSITIONRESPONSIBILITY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMPOSITIONRESPONSIBILITY]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMPOSITIONSKILLPROFILE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMPOSITIONSKILLPROFILE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMPOSITIONTASK]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMPOSITIONTASK]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMPRODUCTGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMPRODUCTGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMPRODUCTTYPE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMPRODUCTTYPE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMREASONCODE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMREASONCODE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMRECRUITINGLASTNEWS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMRECRUITINGLASTNEWS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMRECRUITINGLINE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMRECRUITINGLINE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMRECRUITINGLINEEDUCATIONREQ]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMRECRUITINGLINEEDUCATIONREQ]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMRECRUITINGLINELANGUAGEREQ]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMRECRUITINGLINELANGUAGEREQ]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMRECRUITINGLINEPOSITION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMRECRUITINGLINEPOSITION]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMRECRUITINGLINESKILLREQ]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMRECRUITINGLINESKILLREQ]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMRECRUITINGMEDIA]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMRECRUITINGMEDIA]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMRECRUITINGTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMRECRUITINGTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMRESPONSIBILITY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMRESPONSIBILITY]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMREVENUECODE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMREVENUECODE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMSKILL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMSKILL]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMSKILLTYPE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMSKILLTYPE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMTASK]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMTASK]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMVIRTUALNETWORKDEVELOPME8062]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMVIRTUALNETWORKDEVELOPME8062]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMVIRTUALNETWORKDEVELOPME8063]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMVIRTUALNETWORKDEVELOPME8063]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMVIRTUALNETWORKEDUCATION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMVIRTUALNETWORKEDUCATION]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMVIRTUALNETWORKGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMVIRTUALNETWORKGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMVIRTUALNETWORKGROUPRELATION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMVIRTUALNETWORKGROUPRELATION]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMVIRTUALNETWORKHISTORY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMVIRTUALNETWORKHISTORY]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMVIRTUALNETWORKLANGUAGESKILL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMVIRTUALNETWORKLANGUAGESKILL]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMVIRTUALNETWORKLOAN]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMVIRTUALNETWORKLOAN]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMVIRTUALNETWORKPARAMETERS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMVIRTUALNETWORKPARAMETERS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMVIRTUALNETWORKPRIVATEINFO]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMVIRTUALNETWORKPRIVATEINFO]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMVIRTUALNETWORKQUALIFICATION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMVIRTUALNETWORKQUALIFICATION]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMVIRTUALNETWORKRELATIONLINE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMVIRTUALNETWORKRELATIONLINE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMVIRTUALNETWORKSKILL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMVIRTUALNETWORKSKILL]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[HRMVIRTUALNETWORKTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[HRMVIRTUALNETWORKTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[INTRASTAT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[INTRASTAT]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[INTRASTATITEMCODE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[INTRASTATITEMCODE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[INTRASTATPARAMETERS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[INTRASTATPARAMETERS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[INTRASTATPORT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[INTRASTATPORT]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[INTRASTATSTATPROC]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[INTRASTATSTATPROC]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[INTRASTATTRANSACTIONCODE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[INTRASTATTRANSACTIONCODE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[INTRASTATTRANSPORTMODE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[INTRASTATTRANSPORTMODE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[INVENTBATCH]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[INVENTBATCH]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[INVENTBUYERGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[INVENTBUYERGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[INVENTCLOSING]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[INVENTCLOSING]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[INVENTCOUNTGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[INVENTCOUNTGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[INVENTCOUNTJOUR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[INVENTCOUNTJOUR]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[INVENTDIM]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[INVENTDIM]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[INVENTDIMGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[INVENTDIMGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[INVENTDIMSETUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[INVENTDIMSETUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[INVENTDIMSETUPGRID]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[INVENTDIMSETUPGRID]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[INVENTITEMGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[INVENTITEMGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[INVENTITEMLOCATION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[INVENTITEMLOCATION]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[INVENTJOURNALNAME]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[INVENTJOURNALNAME]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[INVENTJOURNALTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[INVENTJOURNALTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[INVENTJOURNALTRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[INVENTJOURNALTRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[INVENTJOURNALVOUCHER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[INVENTJOURNALVOUCHER]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[INVENTLOCATION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[INVENTLOCATION]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[INVENTMODELGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[INVENTMODELGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[INVENTNUMGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[INVENTNUMGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[INVENTPARAMETERS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[INVENTPARAMETERS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[INVENTPARMQUARANTINEORDER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[INVENTPARMQUARANTINEORDER]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[INVENTPOSTING]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[INVENTPOSTING]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[INVENTPRODUCTGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[INVENTPRODUCTGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[INVENTPRODUCTGROUPBOM]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[INVENTPRODUCTGROUPBOM]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[INVENTPRODUCTGROUPITEM]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[INVENTPRODUCTGROUPITEM]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[INVENTQUARANTINEORDER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[INVENTQUARANTINEORDER]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[INVENTSETTLEMENT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[INVENTSETTLEMENT]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[INVENTSUM]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[INVENTSUM]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[INVENTTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[INVENTTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[INVENTTABLEMODULE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[INVENTTABLEMODULE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[INVENTTRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[INVENTTRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[INVENTTRANSPOSTING]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[INVENTTRANSPOSTING]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[INVENTTXT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[INVENTTXT]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[JMGABSENCECALENDAR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[JMGABSENCECALENDAR]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[JMGASSISTANCE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[JMGASSISTANCE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[JMGBULLETINBOARD]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[JMGBULLETINBOARD]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[JMGBUNDLESLIZE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[JMGBUNDLESLIZE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[JMGEMPLOYEE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[JMGEMPLOYEE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[JMGFLEXCORRECTION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[JMGFLEXCORRECTION]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[JMGGROUPAPPROVE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[JMGGROUPAPPROVE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[JMGGROUPCALC]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[JMGGROUPCALC]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[JMGGROUPSIGNINGLINE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[JMGGROUPSIGNINGLINE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[JMGGROUPSIGNINGTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[JMGGROUPSIGNINGTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[JMGIPCACTIVITY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[JMGIPCACTIVITY]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[JMGIPCCATEGORY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[JMGIPCCATEGORY]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[JMGOVERTIMESLIZE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[JMGOVERTIMESLIZE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[JMGPARAMETERS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[JMGPARAMETERS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[JMGPAYADDTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[JMGPAYADDTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[JMGPAYADDTRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[JMGPAYADDTRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[JMGPAYAGREEMENTLINE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[JMGPAYAGREEMENTLINE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[JMGPAYAGREEMENTOVERRIDE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[JMGPAYAGREEMENTOVERRIDE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[JMGPAYAGREEMENTOVERRIDELINE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[JMGPAYAGREEMENTOVERRIDELINE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[JMGPAYAGREEMENTTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[JMGPAYAGREEMENTTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[JMGPAYCOUNTSUM]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[JMGPAYCOUNTSUM]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[JMGPAYCOUNTTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[JMGPAYCOUNTTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[JMGPAYEMPLOYEE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[JMGPAYEMPLOYEE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[JMGPAYEVENTS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[JMGPAYEVENTS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[JMGPAYTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[JMGPAYTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[JMGPROFILECALENDAR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[JMGPROFILECALENDAR]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[JMGPROFILEDAY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[JMGPROFILEDAY]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[JMGPROFILEGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[JMGPROFILEGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[JMGPROFILEOVERRIDE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[JMGPROFILEOVERRIDE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[JMGPROFILEOVERRIDESPEC]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[JMGPROFILEOVERRIDESPEC]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[JMGPROFILERELATION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[JMGPROFILERELATION]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[JMGPROFILESPEC]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[JMGPROFILESPEC]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[JMGPROFILETABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[JMGPROFILETABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[JMGSTAMPJOURNALTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[JMGSTAMPJOURNALTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[JMGSTAMPJOURNALTRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[JMGSTAMPJOURNALTRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[JMGSTAMPTRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[JMGSTAMPTRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMACTION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMACTION]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMACTIONAUTO]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMACTIONAUTO]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMACTIONGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMACTIONGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMACTIONPLANLINE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMACTIONPLANLINE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMACTIONPLANSPLIT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMACTIONPLANSPLIT]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMACTIONPLANTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMACTIONPLANTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMACTIONRESPONSETYPE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMACTIONRESPONSETYPE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMACTIONTYPE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMACTIONTYPE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMACTIONTYPERESPONSETYPE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMACTIONTYPERESPONSETYPE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMACTIONTYPETEMPLATE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMACTIONTYPETEMPLATE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMACTIONTYPETEMPLATELINE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMACTIONTYPETEMPLATELINE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMANSWER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMANSWER]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMANSWERCOLLECTION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMANSWERCOLLECTION]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMBUSINESSPROCESSMANAGEMEN8254]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMBUSINESSPROCESSMANAGEMEN8254]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMCOLLECTION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMCOLLECTION]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMCOLLECTIONQUESTION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMCOLLECTIONQUESTION]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMCOLLECTIONTEMPLATE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMCOLLECTIONTEMPLATE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMCOLLECTIONTYPE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMCOLLECTIONTYPE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMCONNECTIONDEFAULTRANGELINE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMCONNECTIONDEFAULTRANGELINE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMCONNECTIONDEFAULTRANGETABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMCONNECTIONDEFAULTRANGETABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMCONNECTIONJOURNAL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMCONNECTIONJOURNAL]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMCONNECTIONTYPE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMCONNECTIONTYPE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMCONNECTIONTYPEDATALINKLINE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMCONNECTIONTYPEDATALINKLINE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMCONNECTIONTYPEDATALINKTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMCONNECTIONTYPEDATALINKTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMGAMEPLAN]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMGAMEPLAN]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMGAMEPLANSWOT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMGAMEPLANSWOT]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMGAMEPLANTEMPLATE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMGAMEPLANTEMPLATE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMGAMEPLANTEMPLATEACTIONLINE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMGAMEPLANTEMPLATEACTIONLINE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMGAMEPLANTEMPLATEJOURNALLINE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMGAMEPLANTEMPLATEJOURNALLINE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMGAMEPLANTEMPLATETABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMGAMEPLANTEMPLATETABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMGAMEPLANTEXT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMGAMEPLANTEXT]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMGAMEPLANTYPE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMGAMEPLANTYPE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMJOURNAL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMJOURNAL]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMJOURNALATTACHMENTFILETYPE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMJOURNALATTACHMENTFILETYPE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMJOURNALATTACHMENTTABLETYPE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMJOURNALATTACHMENTTABLETYPE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMJOURNALATTACHMENTTYPE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMJOURNALATTACHMENTTYPE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMJOURNALPARAMETERS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMJOURNALPARAMETERS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMKNOWLEDGEANALOGMETERSETU8109]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMKNOWLEDGEANALOGMETERSETU8109]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMKNOWLEDGEANALOGMETERSETUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMKNOWLEDGEANALOGMETERSETUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMKNOWLEDGEBUDGET]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMKNOWLEDGEBUDGET]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMKNOWLEDGECOCKPITGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMKNOWLEDGECOCKPITGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMKNOWLEDGECOCKPITGROUPPERSONS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMKNOWLEDGECOCKPITGROUPPERSONS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMKNOWLEDGECOCKPITLINE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMKNOWLEDGECOCKPITLINE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMKNOWLEDGECOCKPITTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMKNOWLEDGECOCKPITTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMKNOWLEDGECOLLECTORPARAMETERS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMKNOWLEDGECOLLECTORPARAMETERS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMKNOWLEDGEFOCUSGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMKNOWLEDGEFOCUSGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMKNOWLEDGEJOURNALIMPORTTYPE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMKNOWLEDGEJOURNALIMPORTTYPE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMKNOWLEDGEJOURNALNAME]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMKNOWLEDGEJOURNALNAME]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMKNOWLEDGEJOURNALTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMKNOWLEDGEJOURNALTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMKNOWLEDGEJOURNALTRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMKNOWLEDGEJOURNALTRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMKNOWLEDGEPERIODSETUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMKNOWLEDGEPERIODSETUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMKNOWLEDGEREPORTANALOGMETER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMKNOWLEDGEREPORTANALOGMETER]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMKNOWLEDGEREPORTLINE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMKNOWLEDGEREPORTLINE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMKNOWLEDGEREPORTTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMKNOWLEDGEREPORTTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMKNOWLEDGETABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMKNOWLEDGETABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMKNOWLEDGETABLEINDICATOR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMKNOWLEDGETABLEINDICATOR]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMKNOWLEDGETABLEINDICATORDATES]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMKNOWLEDGETABLEINDICATORDATES]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMKNOWLEDGETABLEINDICATORN8123]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMKNOWLEDGETABLEINDICATORN8123]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMKNOWLEDGETABLEINDICATORTRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMKNOWLEDGETABLEINDICATORTRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMKNOWLEDGETRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMKNOWLEDGETRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMPACKAGE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMPACKAGE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMPACKAGESTRUCTURE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMPACKAGESTRUCTURE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMPARAMETERS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMPARAMETERS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMQUESTION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMQUESTION]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMQUESTIONRESULTGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMQUESTIONRESULTGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMQUESTIONRESULTGROUPTEXT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMQUESTIONRESULTGROUPTEXT]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMQUESTIONTYPE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMQUESTIONTYPE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMSTRUCTURE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMSTRUCTURE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMSTRUCTURECOLLECTION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMSTRUCTURECOLLECTION]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMSTRUCTURECOLLECTIONRIGHTS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMSTRUCTURECOLLECTIONRIGHTS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMVIRTUALNETWORKANSWERGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMVIRTUALNETWORKANSWERGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMVIRTUALNETWORKANSWERLINE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMVIRTUALNETWORKANSWERLINE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[KMVIRTUALNETWORKANSWERTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[KMVIRTUALNETWORKANSWERTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[LANGUAGETABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[LANGUAGETABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[LANGUAGETXT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[LANGUAGETXT]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[LEDGERACCOUNTCOV]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[LEDGERACCOUNTCOV]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[LEDGERALLOCATEKEY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[LEDGERALLOCATEKEY]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[LEDGERALLOCATETRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[LEDGERALLOCATETRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[LEDGERALLOCATION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[LEDGERALLOCATION]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[LEDGERBALANCECONTROL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[LEDGERBALANCECONTROL]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[LEDGERBALANCES]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[LEDGERBALANCES]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[LEDGERBALANCESDIM]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[LEDGERBALANCESDIM]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[LEDGERBALCOLUMNS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[LEDGERBALCOLUMNS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[LEDGERBALHEADER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[LEDGERBALHEADER]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[LEDGERBUDGET]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[LEDGERBUDGET]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[LEDGERBUDSETTLEMENT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[LEDGERBUDSETTLEMENT]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[LEDGERCLOSINGSHEET]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[LEDGERCLOSINGSHEET]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[LEDGERCLOSINGTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[LEDGERCLOSINGTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[LEDGERCLOSINGTRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[LEDGERCLOSINGTRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[LEDGERCONTROLCURRENCYCODE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[LEDGERCONTROLCURRENCYCODE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[LEDGERCONTROLDIMENSION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[LEDGERCONTROLDIMENSION]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[LEDGERCONTROLPOSTING]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[LEDGERCONTROLPOSTING]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[LEDGERCONTROLUSER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[LEDGERCONTROLUSER]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[LEDGERCOV]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[LEDGERCOV]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[LEDGERCURRENCYREQ]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[LEDGERCURRENCYREQ]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[LEDGERINTERCOMPANY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[LEDGERINTERCOMPANY]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[LEDGERJOURNALCONTROL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[LEDGERJOURNALCONTROL]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[LEDGERJOURNALNAME]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[LEDGERJOURNALNAME]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[LEDGERJOURNALTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[LEDGERJOURNALTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[LEDGERJOURNALTRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[LEDGERJOURNALTRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[LEDGERJOURNALTXT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[LEDGERJOURNALTXT]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[LEDGERJOURNALVOUCHERCHANGED]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[LEDGERJOURNALVOUCHERCHANGED]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[LEDGERKEYACCOUNTS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[LEDGERKEYACCOUNTS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[LEDGERKEYTRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[LEDGERKEYTRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[LEDGERLIQUIDITY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[LEDGERLIQUIDITY]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[LEDGERPARAMETERS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[LEDGERPARAMETERS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[LEDGERPERIOD]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[LEDGERPERIOD]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[LEDGERPERIODCODE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[LEDGERPERIODCODE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[LEDGERSYSTEMACCOUNTS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[LEDGERSYSTEMACCOUNTS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[LEDGERTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[LEDGERTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[LEDGERTABLEALTERNATIVE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[LEDGERTABLEALTERNATIVE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[LEDGERTABLEALTERNATIVETRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[LEDGERTABLEALTERNATIVETRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[LEDGERTABLEINTERVAL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[LEDGERTABLEINTERVAL]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[LEDGERTRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[LEDGERTRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[LINEOFBUSINESS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[LINEOFBUSINESS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[MARKUPAUTOLINE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[MARKUPAUTOLINE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[MARKUPAUTOTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[MARKUPAUTOTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[MARKUPGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[MARKUPGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[MARKUPTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[MARKUPTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[MARKUPTRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[MARKUPTRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[NUMBERSEQUENCEGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[NUMBERSEQUENCEGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[NUMBERSEQUENCEGROUPREF]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[NUMBERSEQUENCEGROUPREF]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[NUMBERSEQUENCEHISTORY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[NUMBERSEQUENCEHISTORY]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[NUMBERSEQUENCELIST]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[NUMBERSEQUENCELIST]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[NUMBERSEQUENCEREFERENCE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[NUMBERSEQUENCEREFERENCE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[NUMBERSEQUENCETABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[NUMBERSEQUENCETABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[NUMBERSEQUENCETTS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[NUMBERSEQUENCETTS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[OLAPAMOUNT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[OLAPAMOUNT]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[OLAPAXAPTATIMEBYDAY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[OLAPAXAPTATIMEBYDAY]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[OLAPCALC]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[OLAPCALC]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[OLAPCUBE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[OLAPCUBE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[OLAPCUBEDATASOURCES]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[OLAPCUBEDATASOURCES]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[OLAPCUBERELATIONS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[OLAPCUBERELATIONS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[OLAPDATASOURCEFIELDS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[OLAPDATASOURCEFIELDS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[OLAPDATASOURCERANGES]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[OLAPDATASOURCERANGES]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[OLAPDATASOURCERELATIONS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[OLAPDATASOURCERELATIONS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[OLAPDATASOURCES]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[OLAPDATASOURCES]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[OLAPDIM]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[OLAPDIM]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[OLAPENUMS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[OLAPENUMS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[OLAPLEV]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[OLAPLEV]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[OLAPMEAS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[OLAPMEAS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[OLAPQUERIES]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[OLAPQUERIES]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[OLAPSETUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[OLAPSETUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[OLAPSETUPSERVERS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[OLAPSETUPSERVERS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[OLAPTIMEBYDAY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[OLAPTIMEBYDAY]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[OLAPTIMELEV]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[OLAPTIMELEV]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[OLAPTIMELEVEL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[OLAPTIMELEVEL]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PAYMDAY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PAYMDAY]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PAYMDAYLINE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PAYMDAYLINE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PAYMENT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PAYMENT]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PERSONTITLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PERSONTITLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PRICEDISCADMNAME]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PRICEDISCADMNAME]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PRICEDISCADMTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PRICEDISCADMTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PRICEDISCADMTRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PRICEDISCADMTRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PRICEDISCGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PRICEDISCGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PRICEDISCTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PRICEDISCTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PRICEPARAMETERS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PRICEPARAMETERS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PRINTJOBHEADER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PRINTJOBHEADER]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PRINTJOBPAGES]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PRINTJOBPAGES]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PRODBOM]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PRODBOM]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PRODCALCTRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PRODCALCTRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PRODGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PRODGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PRODJOURNALBOM]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PRODJOURNALBOM]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PRODJOURNALNAME]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PRODJOURNALNAME]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PRODJOURNALPROD]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PRODJOURNALPROD]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PRODJOURNALROUTE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PRODJOURNALROUTE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PRODJOURNALTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PRODJOURNALTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PRODJOURNALVOUCHER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PRODJOURNALVOUCHER]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PRODPARAMETERS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PRODPARAMETERS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PRODPARMBOMCALC]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PRODPARMBOMCALC]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PRODPARMCOSTESTIMATION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PRODPARMCOSTESTIMATION]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PRODPARMHISTORICALCOST]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PRODPARMHISTORICALCOST]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PRODPARMRELEASE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PRODPARMRELEASE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PRODPARMREPORTFINISHED]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PRODPARMREPORTFINISHED]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PRODPARMSCHEDULING]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PRODPARMSCHEDULING]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PRODPARMSTARTUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PRODPARMSTARTUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PRODPARMSTATUSDECREASE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PRODPARMSTATUSDECREASE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PRODPOOL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PRODPOOL]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PRODROUTE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PRODROUTE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PRODROUTEJOB]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PRODROUTEJOB]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PRODROUTEJOBJOUR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PRODROUTEJOBJOUR]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PRODROUTETRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PRODROUTETRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PRODTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PRODTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PRODTABLEJOUR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PRODTABLEJOUR]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJACTIVITY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJACTIVITY]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJALLOCATEKEY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJALLOCATEKEY]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJALLOCATETRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJALLOCATETRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJBUDGETCOST]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJBUDGETCOST]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJBUDGETEMPL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJBUDGETEMPL]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJBUDGETREVENUE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJBUDGETREVENUE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJCATEGORY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJCATEGORY]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJCATEGORYEMPL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJCATEGORYEMPL]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJCATEGORYGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJCATEGORYGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJCONTROL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJCONTROL]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJCONTROLCATEGORY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJCONTROLCATEGORY]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJCONTROLCOSTGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJCONTROLCOSTGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJCONTROLPERIOD]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJCONTROLPERIOD]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJCONTROLPERIODCOSTGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJCONTROLPERIODCOSTGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJCONTROLPERIODTRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJCONTROLPERIODTRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJCOSTPRICE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJCOSTPRICE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJCOSTTRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJCOSTTRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJEMPLTRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJEMPLTRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJINVENTTRANSPOSTING]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJINVENTTRANSPOSTING]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJINVOICECOST]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJINVOICECOST]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJINVOICECURRENCY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJINVOICECURRENCY]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJINVOICEEMPL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJINVOICEEMPL]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJINVOICEITEM]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJINVOICEITEM]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJINVOICEJOUR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJINVOICEJOUR]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJINVOICEONACC]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJINVOICEONACC]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJINVOICEPARMTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJINVOICEPARMTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJINVOICEREVENUE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJINVOICEREVENUE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJINVOICESTATUS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJINVOICESTATUS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJINVOICETABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJINVOICETABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJITEMREQ]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJITEMREQ]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJJOURNALNAME]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJJOURNALNAME]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJJOURNALSTATUSHISTORY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJJOURNALSTATUSHISTORY]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJJOURNALSTATUSLINE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJJOURNALSTATUSLINE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJJOURNALSTATUSTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJJOURNALSTATUSTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJJOURNALTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJJOURNALTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJJOURNALTRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJJOURNALTRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJJOURNALVOUCHER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJJOURNALVOUCHER]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJONACCTRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJONACCTRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJPARAMETERS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJPARAMETERS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJPERIOD]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJPERIOD]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJPERIODEMPL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJPERIODEMPL]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJPERIODLINE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJPERIODLINE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJPOSTING]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJPOSTING]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJPROPOSALCOST]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJPROPOSALCOST]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJPROPOSALEMPL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJPROPOSALEMPL]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJPROPOSALITEM]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJPROPOSALITEM]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJPROPOSALJOUR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJPROPOSALJOUR]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJPROPOSALONACC]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJPROPOSALONACC]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJPROPOSALREVENUE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJPROPOSALREVENUE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJREGISTRATIONPROPOSAL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJREGISTRATIONPROPOSAL]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJREVENUETRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJREVENUETRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJSALESPRICE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJSALESPRICE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJSORTING]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJSORTING]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJTABLESTATUSSETUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJTABLESTATUSSETUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PROJTRANSPOSTING]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PROJTRANSPOSTING]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PURCHJOURNALAUTOSUMMARY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PURCHJOURNALAUTOSUMMARY]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PURCHLINE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PURCHLINE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PURCHLINEDELETE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PURCHLINEDELETE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PURCHPARAMETERS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PURCHPARAMETERS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PURCHPARMLINE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PURCHPARMLINE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PURCHPARMTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PURCHPARMTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PURCHPOOL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PURCHPOOL]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PURCHSUMMARYPARAMETERS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PURCHSUMMARYPARAMETERS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PURCHTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PURCHTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[PURCHTABLEDELETE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[PURCHTABLEDELETE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[REQGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[REQGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[REQLOG]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[REQLOG]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[REQPARAMETERS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[REQPARAMETERS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[REQPLAN]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[REQPLAN]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[REQPLANFORECAST]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[REQPLANFORECAST]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[REQPLANSCHED]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[REQPLANSCHED]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[REQPO]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[REQPO]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[REQREDUCEKEY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[REQREDUCEKEY]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[REQREDUCELINE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[REQREDUCELINE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[REQROUTE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[REQROUTE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[REQROUTEJOB]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[REQROUTEJOB]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[REQSAFETYKEY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[REQSAFETYKEY]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[REQSAFETYLINE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[REQSAFETYLINE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[REQTRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[REQTRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[REQTRANSCOV]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[REQTRANSCOV]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[RETURNACTIONDEFAULTS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[RETURNACTIONDEFAULTS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[ROUTE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[ROUTE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[ROUTECOSTCATEGORY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[ROUTECOSTCATEGORY]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[ROUTEGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[ROUTEGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[ROUTEJOBSETUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[ROUTEJOBSETUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[ROUTEOPR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[ROUTEOPR]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[ROUTEOPRTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[ROUTEOPRTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[ROUTEPARAMETERS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[ROUTEPARAMETERS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[ROUTETABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[ROUTETABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[ROUTEVERSION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[ROUTEVERSION]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SALESBASKET]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SALESBASKET]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SALESBASKETLINE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SALESBASKETLINE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SALESJOURNALAUTOSUMMARY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SALESJOURNALAUTOSUMMARY]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SALESLINE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SALESLINE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SALESLINEDELETE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SALESLINEDELETE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SALESORIGIN]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SALESORIGIN]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SALESPARAMETERS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SALESPARAMETERS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SALESPARMLINE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SALESPARMLINE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SALESPARMTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SALESPARMTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SALESPICKINGLISTJOURNALLINE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SALESPICKINGLISTJOURNALLINE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SALESPICKINGLISTJOURNALTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SALESPICKINGLISTJOURNALTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SALESPOOL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SALESPOOL]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SALESSHIPPINGSTAT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SALESSHIPPINGSTAT]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SALESSUMMARYPARAMETERS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SALESSUMMARYPARAMETERS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SALESTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SALESTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SALESTABLEDELETE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SALESTABLEDELETE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SALESTABLELINKS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SALESTABLELINKS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMACTIVITIES]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMACTIVITIES]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMACTIVITYPHASEGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMACTIVITYPHASEGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMACTIVITYPLANGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMACTIVITYPLANGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMACTIVITYTYPEGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMACTIVITYTYPEGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMBUSRELCHAINGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMBUSRELCHAINGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMBUSRELSALESDISTRICTGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMBUSRELSALESDISTRICTGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMBUSRELSECTORTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMBUSRELSECTORTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMBUSRELSEGMENTGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMBUSRELSEGMENTGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMBUSRELSTATUSGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMBUSRELSTATUSGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMBUSRELSUBSEGMENTGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMBUSRELSUBSEGMENTGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMBUSRELTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMBUSRELTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMBUSRELTYPEGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMBUSRELTYPEGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMBUSRELTYPEUPGRADE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMBUSRELTYPEUPGRADE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMBUSSECTORGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMBUSSECTORGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMCHARACTERGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMCHARACTERGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMCONTACTGREETINGSGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMCONTACTGREETINGSGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMCONTACTINTEREST]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMCONTACTINTEREST]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMCONTACTINTROGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMCONTACTINTROGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMCONTACTPERSONDETAILS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMCONTACTPERSONDETAILS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMCONTACTTITLEGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMCONTACTTITLEGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMDECISIONGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMDECISIONGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMDELETEDACTIVITIES]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMDELETEDACTIVITIES]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMFUNCTIONGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMFUNCTIONGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMIMPORTBUSSECTORFILEFIELDS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMIMPORTBUSSECTORFILEFIELDS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMIMPORTBUSSECTORJOURNAL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMIMPORTBUSSECTORJOURNAL]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMIMPORTCONTACTPERSONFILE8271]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMIMPORTCONTACTPERSONFILE8271]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMIMPORTCONTACTPERSONJOURNAL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMIMPORTCONTACTPERSONJOURNAL]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMIMPORTFILEFORMAT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMIMPORTFILEFORMAT]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMIMPORTRECORDGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMIMPORTRECORDGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMIMPORTRELATIONJOURNAL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMIMPORTRELATIONJOURNAL]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMIMPORTRELATIONJOURNALFI8276]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMIMPORTRELATIONJOURNALFI8276]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMINTERESTGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMINTERESTGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMLOYALTYGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMLOYALTYGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMMAILINGCATEGORYGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMMAILINGCATEGORYGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMMAILINGGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMMAILINGGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMMAILINGHISTORY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMMAILINGHISTORY]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMMAILINGMERGEFILE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMMAILINGMERGEFILE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMMAILINGS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMMAILINGS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMPARAMETERSTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMPARAMETERSTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMQUOTATIONCOMPETITORGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMQUOTATIONCOMPETITORGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMQUOTATIONCOMPETITORS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMQUOTATIONCOMPETITORS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMQUOTATIONDOCUCONCLUSION8282]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMQUOTATIONDOCUCONCLUSION8282]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMQUOTATIONDOCUINTROGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMQUOTATIONDOCUINTROGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMQUOTATIONDOCUTITLEGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMQUOTATIONDOCUTITLEGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMQUOTATIONLINE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMQUOTATIONLINE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMQUOTATIONPHASEGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMQUOTATIONPHASEGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMQUOTATIONPRICESIM]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMQUOTATIONPRICESIM]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMQUOTATIONPROBABILITYGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMQUOTATIONPROBABILITYGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMQUOTATIONPROGNOSISGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMQUOTATIONPROGNOSISGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMQUOTATIONREASONGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMQUOTATIONREASONGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMQUOTATIONRELATIONS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMQUOTATIONRELATIONS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMQUOTATIONTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMQUOTATIONTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMQUOTATIONTYPEGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMQUOTATIONTYPEGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMRELATIONTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMRELATIONTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMREPORTACTIVITYTYPEGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMREPORTACTIVITYTYPEGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMREPORTQUOTATIONREASONGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMREPORTQUOTATIONREASONGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMREPORTSALESDISTRICTGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMREPORTSALESDISTRICTGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMRESPONSIBILITIES]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMRESPONSIBILITIES]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMRESPONSIBILITYGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMRESPONSIBILITYGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMSALESMANAGEMENTGRAPHOPTIONS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMSALESMANAGEMENTGRAPHOPTIONS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMSALESTARGET]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMSALESTARGET]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMSALESUNIT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMSALESUNIT]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMSALESUNITMEMBERS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMSALESUNITMEMBERS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMTMPUPGRADETABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMTMPUPGRADETABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SMMTRANSLOG]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SMMTRANSLOG]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SPECTRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SPECTRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SQLDESCRIBE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SQLDESCRIBE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SQLDICTIONARY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SQLDICTIONARY]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SQLPARAMETERS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SQLPARAMETERS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SQLSCANDICTIONARY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SQLSCANDICTIONARY]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SQLSTATISTICS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SQLSTATISTICS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SQLSTORAGE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SQLSTORAGE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SQLSYSTEMVARIABLES]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SQLSYSTEMVARIABLES]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[STATE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[STATE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[STATREPINTERVAL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[STATREPINTERVAL]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[STATREPINTERVALLINE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[STATREPINTERVALLINE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SUPPITEMGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SUPPITEMGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SUPPITEMTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SUPPITEMTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SYSAPPLOBJECTARCHIVE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SYSAPPLOBJECTARCHIVE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SYSCONFIG]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SYSCONFIG]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SYSCOUNTTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SYSCOUNTTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SYSDATABASELOG]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SYSDATABASELOG]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SYSDOCCAPTUREFORM]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SYSDOCCAPTUREFORM]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SYSDOCCAPTUREFORMSTEP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SYSDOCCAPTUREFORMSTEP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SYSEXPIMPFIELDS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SYSEXPIMPFIELDS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SYSEXPIMPGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SYSEXPIMPGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SYSEXPIMPTABLES]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SYSEXPIMPTABLES]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SYSIMAGETABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SYSIMAGETABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SYSINETCSS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SYSINETCSS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SYSINETPUBLISHSETUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SYSINETPUBLISHSETUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SYSINETTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SYSINETTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SYSINETTHEMETABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SYSINETTHEMETABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SYSLABELLOG]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SYSLABELLOG]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SYSLASTVALUE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SYSLASTVALUE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SYSPARAMETERS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SYSPARAMETERS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SYSPASSWORDPARAMETERS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SYSPASSWORDPARAMETERS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SYSRENAMEDELEMENTS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SYSRENAMEDELEMENTS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SYSSECURITYFORMSETUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SYSSECURITYFORMSETUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SYSSORTORDER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SYSSORTORDER]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SYSTEMSEQUENCES]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SYSTEMSEQUENCES]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SYSUSERINFO]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SYSUSERINFO]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SYSUSERLOG]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SYSUSERLOG]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SYSUTILAPPROVE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SYSUTILAPPROVE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[SYSUTILMANAGEMENT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[SYSUTILMANAGEMENT]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[TABLECOLLECTIONLIST]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[TABLECOLLECTIONLIST]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[TAX1099FIELDS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[TAX1099FIELDS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[TAX1099FORMLETTER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[TAX1099FORMLETTER]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[TAX1099REPORTS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[TAX1099REPORTS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[TAXAUTHORITYADDRESS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[TAXAUTHORITYADDRESS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[TAXCOLLECTLIMIT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[TAXCOLLECTLIMIT]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[TAXDATA]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[TAXDATA]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[TAXGROUPDATA]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[TAXGROUPDATA]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[TAXGROUPHEADING]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[TAXGROUPHEADING]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[TAXITEMGROUPHEADING]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[TAXITEMGROUPHEADING]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[TAXLEDGERACCOUNTGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[TAXLEDGERACCOUNTGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[TAXONITEM]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[TAXONITEM]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[TAXPARAMETERS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[TAXPARAMETERS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[TAXPERIODHEAD]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[TAXPERIODHEAD]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[TAXREPORTCOLLECTION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[TAXREPORTCOLLECTION]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[TAXREPORTPERIOD]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[TAXREPORTPERIOD]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[TAXREPORTVOUCHER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[TAXREPORTVOUCHER]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[TAXTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[TAXTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[TAXTRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[TAXTRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[TAXWORKREGULATION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[TAXWORKREGULATION]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[TRANSACTIONLOG]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[TRANSACTIONLOG]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[TRANSACTTXT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[TRANSACTTXT]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[UNIT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[UNIT]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[UNITCONVERT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[UNITCONVERT]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[UNITPARAMETERS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[UNITPARAMETERS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[USERGROUPINFO]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[USERGROUPINFO]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[USERGROUPLIST]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[USERGROUPLIST]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[USERINFO]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[USERINFO]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[VENDBANKACCOUNT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[VENDBANKACCOUNT]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[VENDGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[VENDGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[VENDINVOICEJOUR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[VENDINVOICEJOUR]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[VENDINVOICETAX1099]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[VENDINVOICETAX1099]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[VENDINVOICETRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[VENDINVOICETRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[VENDLEDGER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[VENDLEDGER]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[VENDLEDGERACCOUNTS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[VENDLEDGERACCOUNTS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[VENDPACKINGSLIPJOUR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[VENDPACKINGSLIPJOUR]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[VENDPACKINGSLIPTRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[VENDPACKINGSLIPTRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[VENDPARAMETERS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[VENDPARAMETERS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[VENDPAYMENTMODESPEC]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[VENDPAYMENTMODESPEC]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[VENDPAYMENTMODETABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[VENDPAYMENTMODETABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[VENDPAYMMETHODVAL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[VENDPAYMMETHODVAL]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[VENDPURCHORDERJOUR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[VENDPURCHORDERJOUR]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[VENDPURCHORDERTRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[VENDPURCHORDERTRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[VENDRECEIPTSLISTJOUR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[VENDRECEIPTSLISTJOUR]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[VENDRECEIPTSLISTTRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[VENDRECEIPTSLISTTRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[VENDSETTLEMENT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[VENDSETTLEMENT]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[VENDTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[VENDTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[VENDTRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[VENDTRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[VENDTRANSOPEN]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[VENDTRANSOPEN]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[VIRTUALDATAAREALIST]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[VIRTUALDATAAREALIST]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[WEBAPPLICATIONTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[WEBAPPLICATIONTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[WEBSITETABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[WEBSITETABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[WMSAISLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[WMSAISLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[WMSBILLOFLADING]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[WMSBILLOFLADING]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[WMSBILLOFLADINGCARRIER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[WMSBILLOFLADINGCARRIER]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[WMSBILLOFLADINGORDER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[WMSBILLOFLADINGORDER]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[WMSBLOCKINGCAUSE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[WMSBLOCKINGCAUSE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[WMSCOUNTINGJOURNAL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[WMSCOUNTINGJOURNAL]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[WMSFORKLIFT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[WMSFORKLIFT]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[WMSJOURNALNAME]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[WMSJOURNALNAME]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[WMSJOURNALTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[WMSJOURNALTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[WMSJOURNALTRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[WMSJOURNALTRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[WMSLOCATION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[WMSLOCATION]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[WMSLOCATIONSUM]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[WMSLOCATIONSUM]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[WMSORDER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[WMSORDER]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[WMSORDERTRANS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[WMSORDERTRANS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[WMSPALLET]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[WMSPALLET]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[WMSPALLETTYPE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[WMSPALLETTYPE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[WMSPALLETTYPEGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[WMSPALLETTYPEGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[WMSPALLETTYPEGROUPMEMBER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[WMSPALLETTYPEGROUPMEMBER]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[WMSPARAMETERS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[WMSPARAMETERS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[WMSPICKINGROUTE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[WMSPICKINGROUTE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[WMSSHIPMENT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[WMSSHIPMENT]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[WMSSTOREAREA]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[WMSSTOREAREA]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[WMSSTOREZONE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[WMSSTOREZONE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[WMSSTOREZONEAREA]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[WMSSTOREZONEAREA]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[WMSTRANSPORT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[WMSTRANSPORT]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[WORKCALENDARDATE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[WORKCALENDARDATE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[WORKCALENDARDATELINE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[WORKCALENDARDATELINE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[WORKCALENDARTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[WORKCALENDARTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[WORKTIMELINE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[WORKTIMELINE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[WORKTIMETABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[WORKTIMETABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[WRKCTRCAPRES]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[WRKCTRCAPRES]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[WRKCTRDATECALENDAR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[WRKCTRDATECALENDAR]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[WRKCTRPARAMETERS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[WRKCTRPARAMETERS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[WRKCTRPROPERTY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[WRKCTRPROPERTY]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[WRKCTRPROPERTYLINE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[WRKCTRPROPERTYLINE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[WRKCTRTABLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[WRKCTRTABLE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[WRKCTRTASKGROUP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[WRKCTRTASKGROUP]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[WRKCTRTASKGROUPLINE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[WRKCTRTASKGROUPLINE]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[XREFNAMES]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[XREFNAMES]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[XREFPATHS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[XREFPATHS]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[XREFREFERENCES]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[XREFREFERENCES]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[XREFTABLERELATION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[XREFTABLERELATION]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[XREFTYPEHIERARCHY]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[XREFTYPEHIERARCHY]
GO

if exists (select * from sysobjects where id = object_id(N'[bmssa].[ZIPCODE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [bmssa].[ZIPCODE]
GO

