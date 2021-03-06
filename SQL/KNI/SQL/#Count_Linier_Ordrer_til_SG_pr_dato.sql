SELECT     'Antal indk.linier til SG',dbo.LP_YEAR_MTH_DATE(PT.DC_EXPECTEDSGORDERDATE) AS SGExpDate, COUNT(*) AS Cnt
FROM PURCHLINE PL
INNER JOIN PURCHTABLE PT ON PT.PurchId = PL.PurchId
WHERE     (PT.DC_EXPECTEDSGORDERDATE >= DATEADD(day, - 1, GETDATE())) 
AND (PT.DC_SGSHIPPED = '19000101')
GROUP BY PT.DC_EXPECTEDSGORDERDATE


SELECT     'Antal indk.ordrer til SG',dbo.LP_YEAR_MTH_DATE(DC_EXPECTEDSGORDERDATE) AS SGExpDate, COUNT(*) AS Cnt
FROM         PURCHTABLE
WHERE     (DC_EXPECTEDSGORDERDATE >= DATEADD(day, - 1, GETDATE())) 
AND (DC_SGSHIPPED = '19000101')
GROUP BY DC_EXPECTEDSGORDERDATE