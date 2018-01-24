UPDATE company SET Industry_Type = substring(sic_code,1,2) + ' ' + substring(Industry_Type,1,22)
go