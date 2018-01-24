declare @tableNum as bigint
declare @maxRecId as bigint

begin tran
insert into                          [AxProd].[dbo].[RETAILLANGUAGETEXT]
            select * from            [KP-DBQ01].[AxGIT3].[dbo].[RETAILLANGUAGETEXT]

select @tableNum = TableId from SQLDICTIONARY where fieldid=0 and name = 'RETAILLANGUAGETEXT'

select @maxRecId = max(recid) from [AxProd].[dbo].[RETAILLANGUAGETEXT]
if (exists(select 1 from [AxProd].dbo.SYSTEMSEQUENCES WHERE ID = -1 AND TABID = @tableNum AND Dataareaid = 'dat'))
	update [AxProd].dbo.SYSTEMSEQUENCES 
            SET    NextVal    = @maxRecId + 1
            WHERE ID = -1 AND TABID = @tableNum AND Dataareaid = 'dat';
else
	insert into [AxProd].[dbo].SYSTEMSEQUENCES VALUES(-1,@maxRecId + 1, 1,9223372036854775807,0,'SEQNO',@Tablenum,'dat',1,-1);

select * from [AxProd].[dbo].[RETAILLANGUAGETEXT]
select * from [AxProd].dbo.SYSTEMSEQUENCES where tabid = @Tablenum
rollback tran
--commit tran

--select * from SQLDICTIONARY where fieldid=0 and name = 'RETAILLANGUAGETEXT'
--select * from [AxProd].dbo.SYSTEMSEQUENCES -- where tabid = 17213