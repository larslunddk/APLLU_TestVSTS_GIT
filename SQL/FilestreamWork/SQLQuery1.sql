select COUNT(*) from Archive.dbo.Records

USE Archive
GO 
EXEC sp_fulltext_database  'enable'

-- Create the Catalog (if does not exist) 
GO 
EXEC sp_fulltext_catalog   'MyCatalog','create'
use Archive
EXEC sp_fulltext_catalog   'MyCatalog', 'stop'
EXEC sp_fulltext_catalog   'MyCatalog', 'start_incremental'
CREATE FULLTEXT INDEX ON Archive.dbo.Records
(directory, [filename], Doc TYPE COLUMN Extension)
KEY INDEX UQ__Records__3214EC067F60ED59
ON MyCatalog
WITH CHANGE_TRACKING AUTO;
--EXEC sp_fulltext_catalog 'Cat_Desc', 'start_full'



-- Add a Full Text Index on a Table 
USE DatabaseName
GO 
EXEC sp_fulltext_table     'Records', 'create', 'MyCatalog', 'pk_products' 









EXEC sp_fulltext_table     'Categories', 'create', 'MyCatalog', 'pk_categories' 
-- Add a Column to the Full Text Index 

EXEC sp_fulltext_column    'Products', 'ProductName', 'add' 
EXEC sp_fulltext_column    'Categories', 'Description', 'add' 

-- Activate the Index 
EXEC sp_fulltext_table     'Products','activate' 
EXEC sp_fulltext_table     'Categories','activate' 

-- Start Full Population 

EXEC sp_fulltext_catalog   'MyCatalog', 'start_full' 

-- Usage in T-SQL (CONTAINS and FREETEXT Predicates) 
-- Using the Index in T-SQL
USE Northwind 
GO 
SELECT ProductId, ProductName, UnitPrice 
FROM Products 
WHERE CONTAINS( 
                ProductName, ' "sasquatch " OR "stout" ' 
                ) 
GO 
USE Northwind 
GO 
SELECT CategoryName 
FROM Categories 
FREETEXT ( 
           Description, 'sweetest candy bread and dry meat' 
           ) 
GO 