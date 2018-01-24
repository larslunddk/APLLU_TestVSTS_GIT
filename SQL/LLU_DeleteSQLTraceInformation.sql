--delete from 
select count(*) From dbo.SYSTRACETABLESQLEXECPLAN
	where exists (select * from SysTraceTableSQL 
					where SysTraceTableSQL.recid = SYSTRACETABLESQLEXECPLAN.TraceRecId
					and   SysTraceTableSQL.CreatedDate <= '20080601')

select count(*) From SysTraceTableSQLTabRef
	where exists (select * from SysTraceTableSQL 
					where SysTraceTableSQL.recid = SysTraceTableSQLTabRef.TraceRecId
					and   SysTraceTableSQL.CreatedDate <= '20080601')

select count(*) from SysTraceTableSQL 
					where SysTraceTableSQL.CreatedDate <= '20080601'