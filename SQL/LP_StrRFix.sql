/****** Object:  UserDefinedFunction [dbo].[LP_STRLFIX]    Script Date: 01/13/2009 09:37:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


alter function [dbo].[LP_StrRFix]
    (
    @Str    varchar(50),@Len int
    )
returns        varchar(50)
as
begin

return right(replicate(' ',@len)+@Str,@len)

end

GO


