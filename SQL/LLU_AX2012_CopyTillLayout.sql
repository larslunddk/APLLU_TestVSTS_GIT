--17221 Retailtilllayout
--17202 Retailbuttongrid
--17207 Retailformlayout

Declare @Count   as bigint
select * from [AxDev_OLD].dbo.SYSTEMSEQUENCES 
            where tabid=17202 or tabid=17207 or tabid=17221

delete from [AxDev_OLD].dbo.RETAILTILLLAYOUT 
delete from [AxDev_OLD].dbo.RETAILBUTTONGRID
delete from [AxDev_OLD].dbo.RETAILFORMLAYOUT

insert into                          [AxDev_OLD].dbo.RETAILTILLLAYOUT
            select * from            [AxDev_OL2].dbo.RETAILTILLLAYOUT
insert into                          [AxDev_OLD].dbo.RETAILBUTTONGRID
            select * from            [AxDev_OL2].dbo.RETAILBUTTONGRID
insert into                          [AxDev_OLD].dbo.RETAILFORMLAYOUT
            select * from            [AxDev_OL2].dbo.RETAILFORMLAYOUT

select @Count = count(*) from        [AxDev_OL2].dbo.RETAILTILLLAYOUT
update [AxDev_OLD].dbo.SYSTEMSEQUENCES
            SET    NextVal    = NextVal + @Count
            WHERE ID = -1 AND TABID = 17221 AND Dataareaid = 'dat'

select @Count = count(*) from        [AxDev_OL2].dbo.RETAILBUTTONGRID
update [AxDev_OLD].dbo.SYSTEMSEQUENCES
            SET    NextVal    = NextVal + @Count
            WHERE ID = -1 AND TABID = 17202 AND Dataareaid = 'dat'

select @Count = count(*) from        [AxDev_OL2].dbo.RETAILFORMLAYOUT
update [AxDev_OLD].dbo.SYSTEMSEQUENCES
            SET    NextVal    = NextVal + @Count
            WHERE ID = -1 AND TABID = 17207 AND Dataareaid = 'dat'

select * from [AxDev_OLD].dbo.SYSTEMSEQUENCES 
            where tabid=17202 or tabid=17207 or tabid=17221
