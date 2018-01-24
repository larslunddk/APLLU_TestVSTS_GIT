USE ax30_Develop;
GO
Declare @NewRecId   as INT
declare @count		as INT
SET @Count = (select count(*) from CustTable WHERE Recid  = '99999999')

DECLARE CustTableWithoutRecid CURSOR FOR
    SELECT a.recid
    FROM CustTable AS a
    WHERE Recid  = '99999999'
--SET @NewRecid = 0;
UPDATE dbo.SystemSequences
    SET    @NewRecid  = NextVal
           --,NextVal    = NextVal + @Count
	WHERE ID = -1 AND TABID = 0 AND Dataareaid = 'dat'

OPEN CustTableWithoutRecid;
FETCH NEXT FROM CustTableWithoutRecid;
WHILE @@FETCH_STATUS = 0
   BEGIN
	  SET @NewRecid = @NewRecid+1;
	  UPDATE CustTable
		SET RecId = @NewRecid 
		WHERE CURRENT OF CustTableWithoutRecid;
      FETCH NEXT FROM CustTableWithoutRecid;
   END;


CLOSE CustTableWithoutRecid;
DEALLOCATE CustTableWithoutRecid;
GO
select nextval from dbo.SystemSequences
--select  Recid from CustTable order by recid