use demo_ed
drop table SQL_ANM
CREATE TABLE SQL_ANM
	(ANM_SeqNum		int IDENTITY(1,1),
	Table_Name 		varchar(60),
	Record_Identifier	float(53),  --is equal to 8 bytes in a binary(8) used in pivotal
	ActionCode		Varchar(1),
	LogDateTime		datetime DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT ANM_SeqNum_PK PRIMARY KEY (ANM_SeqNum)
	)
GO
IF EXISTS (SELECT name FROM sysobjects
        WHERE name = 'CITP_SQLANM_Company_Ins' AND type = 'TR')
	DROP TRIGGER CITP_SQLANM_Company_Ins 
GO
IF EXISTS (SELECT name FROM sysobjects
        WHERE name = 'CITP_SQLANM_Company_Upd' AND type = 'TR')
	DROP TRIGGER CITP_SQLANM_Company_Upd
GO
IF EXISTS (SELECT name FROM sysobjects
        WHERE name = 'CITP_SQLANM_Company_Del' AND type = 'TR')
	DROP TRIGGER CITP_SQLANM_Company_Del
GO
IF EXISTS (SELECT name FROM sysobjects
        WHERE name = 'CITP_SQLANM_Contact_Ins' AND type = 'TR')
	DROP TRIGGER CITP_SQLANM_Contact_Ins 
GO

CREATE TRIGGER CITP_SQLANM_Company_Ins ON [Company] FOR INSERT AS
	--DECLARE @RecIdentifier float(53)  --is equal to 8 bytes in a binary(8) used in pivotal
	DECLARE @RecIdentifier int -- This is not good enough.. This should be float(53) to be able to contain biiig binaries
	DECLARE @RecIdentBin   binary(8)
	SELECT @RecIdentBin = company_Id from inserted
	SET @RecIdentifier  = CAST(@RecIdentBin AS int)
	INSERT SQL_ANM (Table_Name, Record_Identifier, ActionCode)
	VALUES ('Company', @RecIdentifier, 'I')
GO
CREATE TRIGGER CITP_SQLANM_Company_Del ON [Company] FOR DELETE AS
	--DECLARE @RecIdentifier float(53)  --is equal to 8 bytes in a binary(8) used in pivotal
	DECLARE @RecIdentifier int
	DECLARE @RecIdentBin   binary(8)
	SELECT @RecIdentBin = company_Id from deleted
	SET @RecIdentifier  = CAST(@RecIdentBin AS int)
	INSERT SQL_ANM (Table_Name, Record_Identifier, ActionCode)
	VALUES ('Company', @RecIdentifier, 'D')
GO
CREATE TRIGGER CITP_SQLANM_Company_Upd ON [Company] FOR UPDATE AS
	--DECLARE @RecIdentifier float(53)  --is equal to 8 bytes in a binary(8) used in pivotal
	DECLARE @RecIdentifier int
	DECLARE @RecIdentBin   binary(8)
	SELECT @RecIdentBin = company_Id from inserted
	SET @RecIdentifier  = CAST(@RecIdentBin AS int)

	--Check if a record of this type allready exists (e.g. with multible updates)
	-- we could also make a check wether a certain record was e.g. a Dun&Bratstreet lead, not to be syncronized
	IF NOT EXISTS (SELECT ANM_SeqNum FROM SQL_ANM
	        WHERE Table_Name = 'company' AND Record_Identifier = @RecIdentifier)
	BEGIN
	  -- Update only if certain fields has been updated.
	  IF UPDATE(Company_Name) OR UPDATE(Address_1) OR UPDATE(Address_2) OR UPDATE(Address_3) OR UPDATE(Country)
	  BEGIN
		INSERT SQL_ANM (Table_Name, Record_Identifier, ActionCode)
		VALUES ('Company', @RecIdentifier, 'U')
	  END
	END
GO
