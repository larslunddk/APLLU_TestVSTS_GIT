select top 100 * from information_schema.columns col
where not exists (select 1 from [sisAXSQLDB1\test].[ax40_kni_copy].[information_schema].[columns] test_col
							where  test_col.table_name = col.table_name and
								test_col.column_name = col.column_name)
								
