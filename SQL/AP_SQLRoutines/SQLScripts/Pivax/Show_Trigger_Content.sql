use demo_ed
SELECT c.text 
	FROM 	   sysobjects o
	INNER JOIN syscomments c
	ON 	   o.id = c.id
	WHERE 	   o.type = 'TR' and o.name = 'CITP_SQLANM_Ins'

		