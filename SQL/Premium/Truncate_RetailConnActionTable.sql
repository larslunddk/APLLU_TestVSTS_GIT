select 'Before [RETAILCONNPREACTIONTABLE]' as x1, count(*) from [dbo].[RETAILCONNPREACTIONTABLE]
select 'Before [RETAILCONNACTIONTABLE]' as x1, count(*) from [dbo].[RETAILCONNACTIONTABLE]

DROP TABLE [RETAILCONNPREACTIONTABLE_backup]
DROP TABLE [RETAILCONNACTIONTABLE_Backup]

select * into [RETAILCONNPREACTIONTABLE_backup] from [RETAILCONNPREACTIONTABLE]
select * into [RETAILCONNACTIONTABLE_Backup] from [RETAILCONNACTIONTABLE]

TRUNCATE TABLE [RETAILCONNPREACTIONTABLE]
TRUNCATE TABLE [RETAILCONNACTIONTABLE]

select 'After [RETAILCONNPREACTIONTABLE]' as x1, count(*) from [dbo].[RETAILCONNPREACTIONTABLE]
select 'After [RETAILCONNACTIONTABLE]' as x1, count(*) from [dbo].[RETAILCONNACTIONTABLE]
