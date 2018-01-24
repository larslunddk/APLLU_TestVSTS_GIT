use widsql3_cit_1
SET NOCOUNT ON
Exec dbo.LogProgressInfo ' Step8 påbegyndt  ','Step8',1
exec dropview 'InventTableShadowView'
exec dropview 'InventTableModuleShadowView'
exec dropview 'InventItemLocationShadowView'
exec dropview 'UnitConvertShadowView'
exec dropview 'InventTableModule_TmpView'
exec droptable 'inventtableshadow'
exec droptable 'inventtablemoduleshadow'
exec droptable 'inventItemLocationshadow'
exec droptable 'UnitConvertshadow'

exec dropview 'InventItemLocation_TmpView'
exec dropview 'InventItemLocationShadow_Tmp1'

exec dropview 'InventTableShadow_Tmp1'
exec dropview 'nventTableModuleShadow_Tmp1'
exec dropview 'InventItemLocationShadow_Tmp1'

dbcc shrinkfile(2,1000) -- (2=logfile) sæt logfile i 1 GB

Exec dbo.LogProgressInfo ' Step8 afsluttet  ','Step8',2



