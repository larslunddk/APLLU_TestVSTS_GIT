USE [msdb]
GO

/****** Object:  Job [LLU_15minUpdateJob(00:00-23:59 15min)]    Script Date: 10.09.2014 18:09:37 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 10.09.2014 18:09:37 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'LLU_15minUpdateJob(00:00-23:59 15min)', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Updates missing fields on PurchTable,PurchLine (e.g. barcodes from vendor barcodes of item) - as an interim solution only.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'PREMIUMGROUP\PX01501', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Update Contract enddate]    Script Date: 10.09.2014 18:09:37 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Update Contract enddate', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'update AP_VENDCONTRACTTABLE set ENDDATE = ''20270927''
where ENDDATE = ''19000101''', 
		@database_name=N'AxProd', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Update Cross docking warehouses]    Script Date: 10.09.2014 18:09:37 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Update Cross docking warehouses', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'-- Workaround for Issue 869 Updating crossdocking 
update REQTRANS set REQTRANS.AP_CROSSDOCKINGINVENTLOCATIONID = REQITEMTABLE.AP_CROSSDOCKINGINVENTLOCATIONID 
from REQTRANS 
inner join REQITEMTABLE on REQITEMTABLE.ITEMID = REQTRANS.ITEMID and REQITEMTABLE.COVINVENTDIMID = REQTRANS.COVINVENTDIMID 
where REQTRANS.REFTYPE = 33 and REQTRANS.AP_CROSSDOCKINGINVENTLOCATIONID <> REQITEMTABLE.AP_CROSSDOCKINGINVENTLOCATIONID 

update REQPO set REQPO.AP_CROSSDOCKINGINVENTLOCATIONID = REQITEMTABLE.AP_CROSSDOCKINGINVENTLOCATIONID 
from REQPO 
inner join REQITEMTABLE on REQITEMTABLE.ITEMID = REQPO.ITEMID and REQITEMTABLE.COVINVENTDIMID = REQPO.COVINVENTDIMID 
where REQPO.REFTYPE = 33 and REQPO.AP_CROSSDOCKINGINVENTLOCATIONID <> REQITEMTABLE.AP_CROSSDOCKINGINVENTLOCATIONID ', 
		@database_name=N'AxProd', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Update PurchHeader ownership model from items]    Script Date: 10.09.2014 18:09:37 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Update PurchHeader ownership model from items', 
		@step_id=3, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'update PurchTable set AP_ITEMOWNERSHIPMODEL = (case ITEMGROUPID when ''Eigenkauf'' then 0 when ''Konsign'' then 3 end)
	from PurchTable
	join PURCHLINE on
	PurchLine.PURCHID = PURCHTABLE.PURCHID
	JOIN INVENTITEMGROUPITEM ON
	INVENTITEMGROUPITEM.ITEMDATAAREAID = PURCHLINE.DATAAREAID
	and INVENTITEMGROUPITEM.itemid = PURCHLINE.itemid
	join VENDTABLE on
	VENDTABLE.ACCOUNTNUM = Purchtable.INVOICEACCOUNT
	join DIRPARTYTABLE on  DIRPARTYTABLE.RECID = VENDTABLE.PARTY
	where ((INVENTITEMGROUPITEM.ITEMGROUPID=''Eigenkauf'' and PURCHTABLE.AP_ITEMOWNERSHIPMODEL<>0) or
		(INVENTITEMGROUPITEM.ITEMGROUPID=''Konsign'' and PURCHTABLE.AP_ITEMOWNERSHIPMODEL<>3))', 
		@database_name=N'AxProd', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Execute AxProd_UpdPurchBarcodes]    Script Date: 10.09.2014 18:09:37 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Execute AxProd_UpdPurchBarcodes', 
		@step_id=4, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXECUTE dbo.AxProd_UpdPurchBarcodes', 
		@database_name=N'AxProd', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Every night from 11am to 6am', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=4, 
		@freq_subday_interval=15, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140903, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'242517ee-ab61-48f5-b4bb-3ffbe5f57f9f'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO


