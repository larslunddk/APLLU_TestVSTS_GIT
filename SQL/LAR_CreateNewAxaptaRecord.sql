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