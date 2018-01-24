DROP DATABASE TestCheckdbBug;
-- Create the test database
CREATE DATABASE TestCheckdbBug;
GO
USE TestCheckdbBug;
GO
CREATE TABLE test (c1 INT, c2 CHAR (5000));
INSERT INTO test VALUES (1, 'a');
GO

-- Start the transaction
BEGIN TRANSACTION;
GO
UPDATE test SET c2 = 'b' WHERE c1=1
GO
CHECKPOINT
GO
SHUTDOWN WITH NOWAIT;

-- Now the transaction is open in a shutdown database
USE TestCheckdbBug
SELECT state_desc FROM sys.databases WHERE name='TestCheckdbBug';
GO
ALTER DATABASE emergencydemo SET EMERGENCY;