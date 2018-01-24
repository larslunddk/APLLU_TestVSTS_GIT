use widsql3_cit_1

select count(*) A from inventdim
        where exists (select recid from inventdim b where b.InventDimIdNew = InventDim.InventDimId)
        and dataareaid = 'wid' 
 

select count(*) B from inventdim
        where configid = '' and inventserialid = '' and palletposition = ''
        and dataareaid = 'wid'
 

select count(*) C from inventdim
         where configid <> '' or inventserialid<>'' or palletposition <> ''
         and dataareaid = 'wid'
 

begin tran

delete from inventdim
         where configid <> '' or inventserialid<>'' or palletposition <> ''
         and dataareaid = 'wid';

select count(*) E from inventdim;

select count(*) F from inventdim
         where configid <> '' or inventserialid<>'' or palletposition <> ''
         and dataareaid = 'wid';

rollback tran

--commit tran
