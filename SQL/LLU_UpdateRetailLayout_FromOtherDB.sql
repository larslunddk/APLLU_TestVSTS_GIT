--17221 Retailtilllayout
--17202 Retailbuttongrid
--17207 Retailformlayout

Declare @Count   as bigint
select * from [AxDev_NEW].dbo.SYSTEMSEQUENCES 
            where tabid=17202 or tabid=17207 or tabid=17221
begin tran
delete from [AxDev_NEW].dbo.RETAILTILLLAYOUT 
delete from [AxDev_NEW].dbo.RETAILBUTTONGRID
delete from [AxDev_NEW].dbo.RETAILFORMLAYOUT

insert into                          [AxDev_NEW].dbo.RETAILTILLLAYOUT
            select * from            [AxDev_OLD].dbo.RETAILTILLLAYOUT
insert into                          [AxDev_NEW].dbo.RETAILBUTTONGRID
            select * from            [AxDev_OLD].dbo.RETAILBUTTONGRID
insert into                          [AxDev_NEW].dbo.RETAILFORMLAYOUT
            select * from            [AxDev_OLD].dbo.RETAILFORMLAYOUT

select @Count = count(*) from        [AxDev_OLD].dbo.RETAILTILLLAYOUT
update [AxDev_NEW].dbo.SYSTEMSEQUENCES
            SET    NextVal    = NextVal + @Count
            WHERE ID = -1 AND TABID = 17221 AND Dataareaid = 'dat'

select @Count = count(*) from        [AxDev_OLD].dbo.RETAILBUTTONGRID
update [AxDev_NEW].dbo.SYSTEMSEQUENCES
            SET    NextVal    = NextVal + @Count
            WHERE ID = -1 AND TABID = 17202 AND Dataareaid = 'dat'

select @Count = count(*) from        [AxDev_OLD].dbo.RETAILFORMLAYOUT
update [AxDev_NEW].dbo.SYSTEMSEQUENCES
            SET    NextVal    = NextVal + @Count
            WHERE ID = -1 AND TABID = 17207 AND Dataareaid = 'dat'
commit tran
select * from [AxDev_NEW].dbo.SYSTEMSEQUENCES 
            where tabid=17202 or tabid=17207 or tabid=17221
