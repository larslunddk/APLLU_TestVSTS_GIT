use widsql3_cit_udv
declare @nextval int
select @nextval = (select nextval from dbo.systemsequences
	WHERE ID = -1 AND TABID = 0 AND Dataareaid = 'wid')
UPDATE dbo.SystemSequences
			SET    NextVal    = @NextVal 
			WHERE ID = -1 AND TABID = 0 AND Dataareaid = 'mas'
select nextval from dbo.systemsequences WHERE ID = -1 AND TABID = 0 AND Dataareaid = 'mas'