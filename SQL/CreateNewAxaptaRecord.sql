CREATE PROCEDURE dbo.GetNewRecIDSetPerDataAreaId
(
    @ID          INT,
    @TabID       INT,
    @DataAreaID  NVARCHAR(3),
    @Count       INT,
    @RecId       BIGINT OUT
)  AS
BEGIN
    SET NOCOUNT ON          
    UPDATE dbo.SystemSequences
    SET    @RecId     = NextVal,
           NextVal    = NextVal + @Count
    WHERE  
           ID         = @ID
    AND    TabID      = @TabID
    AND    DATAAREAID = @DataAreaID; 
    SET NOCOUNT OFF          
           RETURN(1)    
END
GO

CREATE PROCEDURE dbo.GetNewRecIDSet
(
    @ID          INT,
    @TabID       INT,
    @DataAreaID  NVARCHAR(3),
    @Count       INT,
	@RecId		 BIGINT OUT
) AS
BEGIN
    --DECLARE      @RecId BIGINT
    SET NOCOUNT ON          
        EXEC dbo.GetNewRecIDSetPerDataAreaId @ID, @TabId, @DataAreaId, @Count, @RecId OUTPUT
 
        IF @RecId is NULL
        BEGIN
            EXEC dbo.GetNewRecIDSetPerDataAreaId @ID, @TabId, 'dat', @Count, @RecId OUTPUT
            IF @RecId is NULL
            BEGIN
               SET @RecId = -1
            END
        END
        SELECT @RecId

END
GO




--EXEC dbo.GetNewRecIDSEt <ID>, <TABLEID>, <DATAAREAID>, <ANTAL NUMRE DER ØNSKES TRUKKET>--
--f. eks.
--EXEC dbo.GetNewRecIDSet -1,160,'dat',100

use ax30_DevelopLLU
DECLARE @NRecId       BIGINT

EXEC dbo.GetNewRecIDSet -1,0,'dat',7,@NRecId                 --CustTable TableId=77
select @nrecid

INSERT INTO CustTable (AccountNum, Name, CustGroup, Currency, LanguageId,DataareaId, RecId)
	values ('LLU001','Lars Lund 001', 'DK1', 'DKK', 'DA', 'dat', @NRecId)
INSERT INTO CustTable (AccountNum, Name, CustGroup, Currency, LanguageId,DataareaId, RecId)
	values ('LLU002','Lars Lund 002', 'DK1', 'DKK', 'DA', 'dat', @NRecId+1)
INSERT INTO CustTable (AccountNum, Name, CustGroup, Currency, LanguageId,DataareaId, RecId)
	values ('LLU003','Lars Lund 003', 'DK1', 'DKK', 'DA', 'dat', @NRecId+2)
INSERT INTO CustTable (AccountNum, Name, CustGroup, Currency, LanguageId,DataareaId, RecId)
	values ('LLU004','Lars Lund 004', 'DK1', 'DKK', 'DA', 'dat', @NRecId+3)
INSERT INTO CustTable (AccountNum, Name, CustGroup, Currency, LanguageId,DataareaId, RecId)
	values ('LLU005','Lars Lund 005', 'DK1', 'DKK', 'DA', 'dat', @NRecId+4)
INSERT INTO CustTable (AccountNum, Name, CustGroup, Currency, LanguageId,DataareaId, RecId)
	values ('LLU006','Lars Lund 006', 'DK1', 'DKK', 'DA', 'dat', @NRecId+5)
INSERT INTO CustTable (AccountNum, Name, CustGroup, Currency, LanguageId,DataareaId, RecId)
	values ('LLU007','Lars Lund 007', 'DK1', 'DKK', 'DA', 'dat', @NRecId+6)
