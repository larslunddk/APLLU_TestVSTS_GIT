-- This routine is only usable for SQL 2005, and will revoke the permissions required for running the extra Blocking Tracking
-- tracing functionality added to the SQL Tracing environment. To run this script you will have to login to Query Analyzer 
-- as someone with sufficient rights to deny permissions to objects within the MSDB database.
--
-- Steps for running the script
--
-- 1. Open the script in Query Analyzer as someone with sufficient permissions
-- 2. Change your database to your Dynamics AX database within the Query Analyzer
-- 3. If your Dynamics AX SQL user is different from 'bmssa' you need to change the line below which says select @userid = 'bmssa' 
--	to the correct user id
-- 4. Execute the SQL script and watch for any errors. Successful execution should give the message 1 row(s) affected.
-- 5. When finished with this routine, your database context will be the master database, so be careful to select the correct database if continuing with
--	using the Query Analyzer

declare @numcols int  
declare @failed int 
declare @userid varchar(30) 
declare @curdb varchar(30)
declare @userExists int

select @userid = 'bmssa' 		-- Change the User ID on this line if necessary to match your Dynamics AX SQL connection user ID


select @curdb = db_name()
select @failed = 0

if @curdb = 'master' or @curdb = 'msdb'
begin
	print 'You need to switch to your Dynamics AX database before running this script'
	return
end

begin try
	select @numcols = count(id) from syscolumns (nolock) where id = (select object_id('eeLeadBlockerStatus'))  
	if (@numcols = 0)  
	begin  
	  create table dbo.eeLeadBlockerStatus  
		  (  
		  SearchCount int,  
		  TimeStamp datetime,  
		  SearchFreq int,  
		  MinBlock int,  
		  BlockTrackSetup int,  
		  BlockTrackRunning int  
		  )  
	  exec ('insert eeLeadBlockerStatus  select 0, getdate(),0,0,case when @@version like ''Microsoft SQL Server  2000%'' then 1 else 0 end,0')  

	end  
	else if (@numcols = 4)  
	begin  
	  alter table dbo.eeLeadBlockerStatus add  
		  BlockTrackSetup int DEFAULT 1,   
		  BlockTrackRunning int DEFAULT 0  
	  exec ('update eeLeadBlockerStatus set BlockTrackSetup = case when @@version like ''Microsoft SQL Server  2000%'' then 1 else 0 end, BlockTrackRunning = 0')  

	end  

	use msdb
	exec ('declare @userExists int; select @userExists = count(name) from sysusers (nolock) where name =  ''' + @userid + '''; if @userExists = 0 CREATE USER ' + @userid)
	exec ('grant SELECT ON msdb..sysJobs_view to ' + @userid)
	exec ('grant EXECUTE ON msdb..sp_add_job to ' + @userid)
	exec ('grant EXECUTE ON msdb..sp_add_jobstep to ' + @userid)
	exec ('grant EXECUTE ON msdb..sp_update_job to ' + @userid)
	exec ('grant EXECUTE ON msdb..sp_add_jobschedule to ' + @userid)
	exec ('grant EXECUTE ON msdb..sp_add_jobserver to ' + @userid)
	exec ('grant EXECUTE ON msdb..sp_delete_job to ' + @userid)
	exec ('grant EXECUTE ON msdb..sp_start_job to ' + @userid)
	exec ('grant EXECUTE ON msdb..sp_stop_job to ' + @userid)
	use master
	exec ('grant VIEW SERVER STATE to ' + @userid) 

end try
begin catch
    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    SELECT 
        @ErrorMessage = ERROR_MESSAGE(),
        @ErrorSeverity = ERROR_SEVERITY(),
        @ErrorState = ERROR_STATE();

	print @ErrorMessage + '  Severity='+ltrim(str(@ErrorSeverity)) + '; ErrorState='+ltrim(str(@ErrorState))
	select @failed = 1

end catch

if (@failed = 0)
	exec ('update '+ @curdb + '.dbo.eeLeadBlockerStatus set BlockTrackSetup = 1')  
