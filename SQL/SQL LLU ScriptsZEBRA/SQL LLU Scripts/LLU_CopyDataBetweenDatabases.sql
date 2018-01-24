-- THIS set of snippets copy data from one database to another.

------- ON SENDING SERVER
--Create backup database
select * into [LLU_Temp].dbo.ZEBPartnerExportSetup From [SUPPORT_AX2012].dbo.ZEBPartnerExportSetup
select * into [LLU_Temp].dbo.ZEBPartnerExportFTP From [SUPPORT_AX2012].dbo.ZEBPartnerExportFTP
select * into [LLU_Temp].dbo.ZEBPartnerImportSetup From [SUPPORT_AX2012].dbo.ZEBPartnerImportSetup

--Backup the database into a BAK file and move bak file to receiving server

------- ON RECEIVING server

--Verify content
select * from [ZebraTST4_AX2012].dbo.ZEBPartnerExportSetup
select * from [ZebraTST4_AX2012].dbo.ZEBPartnerExportFTP
select * from [ZebraTST4_AX2012].dbo.ZEBPartnerImportSetup

--Insert content
insert into [ZebraTST_AX2012].dbo.ZEBPartnerExportSetup select * From [LLU_Temp].dbo.ZEBPartnerExportSetup
insert into [ZebraTST_AX2012].dbo.ZEBPartnerExportFTP select * From [LLU_Temp].dbo.ZEBPartnerExportFTP
insert into [ZebraTST_AX2012].dbo.ZEBPartnerImportSetup select * From [LLU_Temp].dbo.ZEBPartnerImportSetup
