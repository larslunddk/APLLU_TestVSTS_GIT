select top 100 recid, * from BATCHJOB where caption like  'workflow%' --and CREATEDBY = 'jewe'

--Exec LLU_ChangeUser 'DK01 - Export vendor data to Readsoft Online'



--declare @BatchJobRecId bigint = 5637452872 --Global - Fix exchange rates for gift card payments
--declare @BatchJobRecId bigint = 5637452876 --Global - Fix exchange rates for gift card payments
declare @BatchJobRecId bigint = 5637452878 --Global - Fix exchange rates for gift card payments
  update [BATCHJOB] set CREATEDBY = 'SA_P_BAT ' where RECID = @BatchJobRecId
  update [BATCH] set EXECUTEDBY = 'SA_P_BAT ', CREATEDBY = 'SA_P_BAT ' where BATCHJOBID = @BatchJobRecId
  update [BATCHCONSTRAINTS] set  CREATEDBY = 'SA_P_BAT' 
	where exists (select 1 from batch where batch.recid = batchconstraints.batchid and batch.BATCHJOBID = @BatchJobRecId)

--set @BatchJobRecId = 5637403335 -- FIN Calculate estimated landed cost
--  update [BATCHJOB] set CREATEDBY = 'SA_P_BAT ' where RECID = @BatchJobRecId
--  update [BATCH] set EXECUTEDBY = 'SA_P_BAT ', CREATEDBY = 'SA_P_BAT ' where BATCHJOBID = @BatchJobRecId
--  update [BATCHCONSTRAINTS] set  CREATEDBY = 'SA_P_BAT ' 
--	where exists (select 1 from batch where batch.recid = batchconstraints.batchid and batch.BATCHJOBID = @BatchJobRecId)

----NO, IS, US - Update employee discounts info subcodes
--set @BatchJobRecId = 5637433336 
--  update [BATCHJOB] set CREATEDBY = 'SA_P_BAT ' where RECID = @BatchJobRecId
--  update [BATCH] set EXECUTEDBY = 'SA_P_BAT ', CREATEDBY = 'SA_P_BAT ' where BATCHJOBID = @BatchJobRecId
--  update [BATCHCONSTRAINTS] set  CREATEDBY = 'SA_P_BAT ' 
--	where exists (select 1 from batch where batch.recid = batchconstraints.batchid and batch.BATCHJOBID = @BatchJobRecId)

--set @BatchJobRecId = 5637433335 
--  update [BATCHJOB] set CREATEDBY = 'SA_P_BAT ' where RECID = @BatchJobRecId
--  update [BATCH] set EXECUTEDBY = 'SA_P_BAT ', CREATEDBY = 'SA_P_BAT ' where BATCHJOBID = @BatchJobRecId
--  update [BATCHCONSTRAINTS] set  CREATEDBY = 'SA_P_BAT ' 
--	where exists (select 1 from batch where batch.recid = batchconstraints.batchid and batch.BATCHJOBID = @BatchJobRecId)
--set @BatchJobRecId = 5637438576 
--  update [BATCHJOB] set CREATEDBY = 'SA_P_BAT ' where RECID = @BatchJobRecId
--  update [BATCH] set EXECUTEDBY = 'SA_P_BAT ', CREATEDBY = 'SA_P_BAT ' where BATCHJOBID = @BatchJobRecId
--  update [BATCHCONSTRAINTS] set  CREATEDBY = 'SA_P_BAT ' 
--	where exists (select 1 from batch where batch.recid = batchconstraints.batchid and batch.BATCHJOBID = @BatchJobRecId)


---------------------------------------------------------------------------------
-- IF MANY jobs - this is easier with a Stored Procedure

/*
select * into batchjob_LLUBackup20170825 from batchJob
select * into batch_LLUBackup20170825 from batch
select * into batchconstraints_LLUBackup20170825 from batchconstraints
*/

CREATE PROCEDURE dbo.LLU_ChangeUser
    @BatchCaption nvarchar(100)
AS
declare @BatchJobRecId bigint; 
declare @newUser nvarchar(30) = 'SA_P_BAT'; 

select @BatchJobRecId = recid from BatchJob where CAPTION = @BatchCaption;
update [BATCHJOB] set CREATEDBY = @newUser where RECID = @BatchJobRecId;
update [BATCH] set EXECUTEDBY = @newUser, CREATEDBY = @newUser where BATCHJOBID = @BatchJobRecId;
update [BATCHCONSTRAINTS] set  CREATEDBY = @newUser
	where exists (select 1 from batch where batch.recid = batchconstraints.batchid and batch.BATCHJOBID = @BatchJobRecId)
Return 0
GO


Exec LLU_ChangeUser 'General batch monitoring'
Exec LLU_ChangeUser 'IS01 - Export vendor data to Readsoft Online'
Exec LLU_ChangeUser 'IS01 - Import invoices from XML'
Exec LLU_ChangeUser 'SE01 - Import invoices from XML'
Exec LLU_ChangeUser 'Export sales invoices to partners AX DE03'
Exec LLU_ChangeUser 'Export sales invoices to partners AX DK01'
Exec LLU_ChangeUser 'Export sales invoices to partners AX FI01'
Exec LLU_ChangeUser 'Export sales invoices to partners AX IS01'
Exec LLU_ChangeUser 'Export sales invoices to partners AX NO01'
Exec LLU_ChangeUser 'Export sales invoices to partners AX SE01'
Exec LLU_ChangeUser 'Export sales invoices to partners AX SE02'
Exec LLU_ChangeUser 'Export sales invoices to partners AX SK01'
Exec LLU_ChangeUser 'RetailAll Purchase Order Import'
Exec LLU_ChangeUser 'Export items to partners AT01'
Exec LLU_ChangeUser 'Export barcodes to partners AT01'
Exec LLU_ChangeUser 'Export sales invoices to partners AT01'
Exec LLU_ChangeUser 'Export sales invoices to partners BE01'
Exec LLU_ChangeUser 'Export sales invoices to partners BE02'
Exec LLU_ChangeUser 'Export sales invoices to partners CH01'
Exec LLU_ChangeUser 'Export sales invoices to partners CY01'
Exec LLU_ChangeUser 'Export sales invoices to partners CZ01'
Exec LLU_ChangeUser 'Export sales invoices to partners DE01'
Exec LLU_ChangeUser 'Export sales invoices to partners DE02'
Exec LLU_ChangeUser 'Export sales invoices to partners DE04'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01002'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01003'
Exec LLU_ChangeUser 'Export sales invoices to partners DE05'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01004'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01005'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01006'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01007'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01008'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01009'
Exec LLU_ChangeUser 'Export sales invoices to partners EE01 Estland'
Exec LLU_ChangeUser 'Export sales invoices to partners ES01'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01011'
Exec LLU_ChangeUser 'Export sales invoices to partners ES02'
Exec LLU_ChangeUser 'Export sales invoices to partners ES03'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01013'
Exec LLU_ChangeUser 'Export sales invoices to partners ES04'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01014'
Exec LLU_ChangeUser 'Export sales invoices to partners ES05'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01015'
Exec LLU_ChangeUser 'Export sales invoices to partners ES06'
Exec LLU_ChangeUser 'Export sales invoices to partners FO01'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01016'
Exec LLU_ChangeUser 'Export sales invoices to partners FR01'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01017'
Exec LLU_ChangeUser 'Export sales invoices to partners FR02'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01018'
Exec LLU_ChangeUser 'Export sales invoices to partners FR04'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01019'
Exec LLU_ChangeUser 'Export sales invoices to partners GB02'
Exec LLU_ChangeUser 'Export sales invoices to partners GB03'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01020'
Exec LLU_ChangeUser 'Export sales invoices to partners GB04'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01021'
Exec LLU_ChangeUser 'Export sales invoices to partners GB05 SC'
Exec LLU_ChangeUser 'Export sales invoices to partners GB06 NI'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01022'
Exec LLU_ChangeUser 'Export sales invoices to partners GR01'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01023'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01024'
Exec LLU_ChangeUser 'Export sales invoices to partners HU01001'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01025'
Exec LLU_ChangeUser 'Export sales invoices to partners HU01002'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01026'
Exec LLU_ChangeUser 'Export sales invoices to partners IE01'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01027'
Exec LLU_ChangeUser 'Export sales invoices to partners IT01'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01028'
Exec LLU_ChangeUser 'Export sales invoices to partners IT02'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01029'
Exec LLU_ChangeUser 'Export sales invoices to partners IT03'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01030'
Exec LLU_ChangeUser 'Export sales invoices to partners JP01'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01031'
Exec LLU_ChangeUser 'Export sales invoices to partners KR01'
Exec LLU_ChangeUser 'Export sales invoices to partners LT01 Litauen'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01032'
Exec LLU_ChangeUser 'Export sales invoices to partners LV01 Letland'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01033'
Exec LLU_ChangeUser 'Export sales invoices to partners MT01'
Exec LLU_ChangeUser 'Export sales invoices to partners NL01'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01034'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01035'
Exec LLU_ChangeUser 'Export sales invoices to partners PL01'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01036'
Exec LLU_ChangeUser 'Export sales invoices to partners PL02'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01037'
Exec LLU_ChangeUser 'Export sales invoices to partners PT01'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01038'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01039'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01040'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01041'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01042'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01043'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01044'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01045'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01046'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01047'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01048'
Exec LLU_ChangeUser 'Export sales invoices to partners GB01052'
Exec LLU_ChangeUser 'Export barcodes to partners BE01'
Exec LLU_ChangeUser 'Export barcodes to partners BE02'
Exec LLU_ChangeUser 'Export barcodes to partners PT01'
Exec LLU_ChangeUser 'Export barcodes to partners PL02'
Exec LLU_ChangeUser 'Export barcodes to partners CH01'
Exec LLU_ChangeUser 'Export barcodes to partners CY01'
Exec LLU_ChangeUser 'Export barcodes to partners CZ01'
Exec LLU_ChangeUser 'Export barcodes to partners DE02'
Exec LLU_ChangeUser 'Export barcodes to partners PL01'
Exec LLU_ChangeUser 'Export barcodes to partners DE04'
Exec LLU_ChangeUser 'Export barcodes to partners NL01'
Exec LLU_ChangeUser 'Export barcodes to partners MT01'
Exec LLU_ChangeUser 'Export barcodes to partners LV01 Letland'
Exec LLU_ChangeUser 'Export barcodes to partners DE05'
Exec LLU_ChangeUser 'Export barcodes to partners LT01 Litauen'
Exec LLU_ChangeUser 'Export barcodes to partners KR01'
Exec LLU_ChangeUser 'Export barcodes to partners EE01 Estland'
Exec LLU_ChangeUser 'Export barcodes to partners JP01'
Exec LLU_ChangeUser 'Export barcodes to partners ES01'
Exec LLU_ChangeUser 'Export barcodes to partners IT03'
Exec LLU_ChangeUser 'Export barcodes to partners ES02'
Exec LLU_ChangeUser 'Export barcodes to partners IT02'
Exec LLU_ChangeUser 'Export barcodes to partners ES03'
Exec LLU_ChangeUser 'Export barcodes to partners IT01'
Exec LLU_ChangeUser 'Export barcodes to partners ES04'
Exec LLU_ChangeUser 'Export barcodes to partners IE01'
Exec LLU_ChangeUser 'Export barcodes to partners ES05'
Exec LLU_ChangeUser 'Export barcodes to partners ES06'
Exec LLU_ChangeUser 'Export barcodes to partners HU01'
Exec LLU_ChangeUser 'Export barcodes to partners FO01'
Exec LLU_ChangeUser 'Export barcodes to partners FR01'
Exec LLU_ChangeUser 'Export barcodes to partners GR01'
Exec LLU_ChangeUser 'Export barcodes to partners FR02'
Exec LLU_ChangeUser 'Export barcodes to partners GB06 NI1'
Exec LLU_ChangeUser 'Export barcodes to partners FR04'
Exec LLU_ChangeUser 'Export barcodes to partners GB05 SC'
Exec LLU_ChangeUser 'Export barcodes to partners GB02'
Exec LLU_ChangeUser 'Export barcodes to partners GB04'
Exec LLU_ChangeUser 'Export barcodes to partners GB03'
Exec LLU_ChangeUser 'Export items to partners BE01'
Exec LLU_ChangeUser 'Export items to partners BE02'
Exec LLU_ChangeUser 'Export items to partners PT01'
Exec LLU_ChangeUser 'Export items to partners PL02'
Exec LLU_ChangeUser 'Export items to partners CH01'
Exec LLU_ChangeUser 'Export items to partners PL01'
Exec LLU_ChangeUser 'Export items to partners CY01'
Exec LLU_ChangeUser 'Export items to partners NL01'
Exec LLU_ChangeUser 'Export items to partners MT01'
Exec LLU_ChangeUser 'Export items to partners CZ01'
Exec LLU_ChangeUser 'Export items to partners LV01 Letland'
Exec LLU_ChangeUser 'Export items to partners DE02'
Exec LLU_ChangeUser 'Export items to partners LT01 Litauen'
Exec LLU_ChangeUser 'Export items to partners DE04'
Exec LLU_ChangeUser 'Export items to partners DE05'
Exec LLU_ChangeUser 'Export items to partners KR01'
Exec LLU_ChangeUser 'Export items to partners JP01'
Exec LLU_ChangeUser 'Export items to partners EE01 Estland'
Exec LLU_ChangeUser 'Export items to partners IT03'
Exec LLU_ChangeUser 'Export items to partners IT02'
Exec LLU_ChangeUser 'Export items to partners ES01'
Exec LLU_ChangeUser 'Export items to partners IT01'
Exec LLU_ChangeUser 'Export items to partners ES02'
Exec LLU_ChangeUser 'Export items to partners ES03'
Exec LLU_ChangeUser 'Export items to partners IE01'
Exec LLU_ChangeUser 'Export items to partners ES04'
Exec LLU_ChangeUser 'Export items to partners ES05'
Exec LLU_ChangeUser 'Export items to partners HU01'
Exec LLU_ChangeUser 'Export items to partners ES06'
Exec LLU_ChangeUser 'Export items to partners GR01'
Exec LLU_ChangeUser 'Export items to partners GB06 NI'
Exec LLU_ChangeUser 'Export items to partners FO01'
Exec LLU_ChangeUser 'Export items to partners GB05 SC'
Exec LLU_ChangeUser 'Export items to partners FR01'
Exec LLU_ChangeUser 'Export items to partners GB04'
Exec LLU_ChangeUser 'Export items to partners FR02'
Exec LLU_ChangeUser 'Export items to partners GB03'
Exec LLU_ChangeUser 'Export items to partners FR04'
Exec LLU_ChangeUser 'Export items to partners GB02'
Exec LLU_ChangeUser 'SE02 - Import invoices from XML'
Exec LLU_ChangeUser 'Export sales invoices to partners AX DE01'
Exec LLU_ChangeUser 'Export sales invoices to partners AX US01'
Exec LLU_ChangeUser 'FIN: Internal /donations orders invoice'
Exec LLU_ChangeUser 'Export items to partners GB01 And Barcodes'
Exec LLU_ChangeUser 'RET - Post inventory GROUP'
Exec LLU_ChangeUser 'FIN - Customer aging snapshot GROUP'
Exec LLU_ChangeUser 'RET - Retail assortment job GROUP'
*/