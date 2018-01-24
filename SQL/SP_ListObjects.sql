
USE master
GO
CREATE PROCEDURE dbo.sp_ListObjects
    @DBIntra varchar(100) = NULL,
    @DBExtra varchar(100) = NULL,
    @DBUltra bit = 0
AS

SET NOCOUNT ON

DECLARE @Return int
DECLARE @Retain int
DECLARE @Status int

SET @Status = 0

DECLARE @TPre varchar(10)

DECLARE @TDo3 tinyint
DECLARE @TDo4 tinyint

SET @TPre = ''

SET @TDo3 = LEN(@TPre)
SET @TDo4 = LEN(@TPre) + 1

DECLARE @icrdate datetime

DECLARE @itype char(2)

SET @itype = 'I'

IF @DBIntra IS NULL AND @DBExtra IS NULL

    BEGIN

    IF @DBUltra = 0 SET @DBIntra = 'V|P|FN|IF|TF|TR'

    ELSE            SET @DBIntra = 'U|K|F|C|D|' + RTRIM(@itype)

    END

   SELECT        O.type     AS Type
        , ISNULL(T.name,'') AS Parent
        ,        O.name     AS Object
        , ISNULL(CONVERT(varchar(30),O.crdate,120),'') AS Creation
     FROM sysobjects AS O
LEFT JOIN sysobjects AS T
       ON O.parent_obj = T.id
    WHERE ISNULL(OBJECTPROPERTY(O.id,'IsMSShipped'),1) = 0
      AND O.name NOT LIKE '%dtproper%'
      AND O.name NOT LIKE 'dt[_]%'
      AND (@DBIntra IS NULL OR CHARINDEX('|'+RTRIM(O.type)+'|','|'+(@DBIntra)+'|') > 0)
      AND (@DBExtra IS NULL OR CHARINDEX('|'+RTRIM(O.type)+'|','|'+(@DBExtra)+'|') = 0)

    UNION ALL

   SELECT        @itype     AS Type
        , ISNULL(O.name,'') AS Parent
        ,        I.name     AS Object
        , ISNULL(CONVERT(varchar(30),@icrdate,120),'') AS Creation
     FROM sysobjects AS O
     JOIN sysindexes AS I
       ON O.id = I.id
    WHERE ISNULL(OBJECTPROPERTY(O.id,'IsMSShipped'),1) = 0
      AND RTRIM(O.type) = 'U'
      AND LEFT(O.name,@TDo3) = @TPre
      AND O.name NOT LIKE '%dtproper%'
      AND O.name NOT LIKE 'dt[_]%'
      AND I.indid BETWEEN 1 AND 254
      AND LEFT(I.name,8) <> '_WA_Sys_'
      AND (@DBIntra IS NULL OR CHARINDEX('|'+RTRIM(@itype)+'|','|'+(@DBIntra)+'|') > 0)
      AND (@DBExtra IS NULL OR CHARINDEX('|'+RTRIM(@itype)+'|','|'+(@DBExtra)+'|') = 0)

 ORDER BY Type, Parent, Object

SET @Retain = @@ERROR IF @Status = 0 SET @Status = @Retain

SET NOCOUNT OFF

RETURN (@Status)

GO



