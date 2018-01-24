use widsql3_cit_udv
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

Exec dbo.LogProgressInfo ' Step8 afsluttet  ','Step8',2



