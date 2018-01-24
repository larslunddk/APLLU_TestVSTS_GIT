USE [SUPPORT_AX2012]
GO

/****** Object:  View [dbo].[HFM]    Script Date: 09-02-2016 14:41:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

drop view [dbo].[HFM]
go
CREATE VIEW [dbo].[HFM]
AS
SELECT     dbo.SUBLEDGERVOUCHERGENERALJOURNALENTRY.VOUCHERDATAAREAID AS [Legal entity], dbo.SUBLEDGERVOUCHERGENERALJOURNALENTRY.VOUCHER AS Voucher, dbo.GENERALJOURNALACCOUNTENTRY.TEXT AS Description, 
                  dbo.GENERALJOURNALACCOUNTENTRY.POSTINGTYPE AS [Posting type], dbo.GENERALJOURNALENTRY.ACCOUNTINGDATE AS [Accounting date], dbo.GENERALJOURNALENTRY.CREATEDDATETIME AS [Created date], 
                  dbo.GENERALJOURNALENTRY.CREATEDBY AS [Created by], dbo.GENERALJOURNALACCOUNTENTRY.TRANSACTIONCURRENCYCODE AS Currency, dbo.LEDGER.ACCOUNTINGCURRENCY AS [Legal entity currency], 
                  (CASE WHEN dbo.GENERALJOURNALACCOUNTENTRY.ACCOUNTINGCURRENCYAMOUNT = 0 OR
                  dbo.GENERALJOURNALACCOUNTENTRY.TRANSACTIONCURRENCYAMOUNT = 0 THEN 0 ELSE dbo.GENERALJOURNALACCOUNTENTRY.ACCOUNTINGCURRENCYAMOUNT / dbo.GENERALJOURNALACCOUNTENTRY.TRANSACTIONCURRENCYAMOUNT * 100 END) 
                  AS [Exchange rate], dbo.GENERALJOURNALACCOUNTENTRY.TRANSACTIONCURRENCYAMOUNT AS [Amount transaction currency], dbo.GENERALJOURNALACCOUNTENTRY.ACCOUNTINGCURRENCYAMOUNT AS [Amount accounting currency], 
                  DIM1.DISPLAYVALUE AS Account, DIM2.DISPLAYVALUE AS Stores, DIM3.DISPLAYVALUE AS Department, DIM4.DISPLAYVALUE AS Cost, DIM5.DISPLAYVALUE AS Project, DIM6.DISPLAYVALUE AS [Bank account], DIM7.DISPLAYVALUE AS Site, 
				  DIM8.DISPLAYVALUE AS ICDim, 
                  dbo.GENERALJOURNALENTRY.POSTINGLAYER AS [Posting layer]
FROM        dbo.LEDGERENTRYJOURNAL FULL OUTER JOIN
                  dbo.GENERALJOURNALACCOUNTENTRY INNER JOIN
                  dbo.GENERALJOURNALENTRY ON dbo.GENERALJOURNALENTRY.RECID = dbo.GENERALJOURNALACCOUNTENTRY.GENERALJOURNALENTRY INNER JOIN
                  dbo.SUBLEDGERVOUCHERGENERALJOURNALENTRY ON dbo.SUBLEDGERVOUCHERGENERALJOURNALENTRY.GENERALJOURNALENTRY = dbo.GENERALJOURNALENTRY.RECID INNER JOIN
                  dbo.LEDGER ON dbo.SUBLEDGERVOUCHERGENERALJOURNALENTRY.VOUCHERDATAAREAID = dbo.LEDGER.NAME LEFT OUTER JOIN

                      (SELECT     dbo.DIMENSIONATTRIBUTELEVELVALUEVIEW.VALUECOMBINATIONRECID, dbo.DIMENSIONATTRIBUTELEVELVALUEVIEW.DISPLAYVALUE
                       FROM        dbo.DIMENSIONATTRIBUTELEVELVALUEVIEW INNER JOIN
                                         dbo.DIMENSIONATTRIBUTE ON dbo.DIMENSIONATTRIBUTELEVELVALUEVIEW.DIMENSIONATTRIBUTE = dbo.DIMENSIONATTRIBUTE.RECID
                       WHERE     (dbo.DIMENSIONATTRIBUTE.NAME = 'MainAccount')) AS DIM1 ON dbo.GENERALJOURNALACCOUNTENTRY.LEDGERDIMENSION = DIM1.VALUECOMBINATIONRECID LEFT OUTER JOIN

                      (SELECT     DIMENSIONATTRIBUTELEVELVALUEVIEW_1.VALUECOMBINATIONRECID, DIMENSIONATTRIBUTELEVELVALUEVIEW_1.DISPLAYVALUE
                       FROM        dbo.DIMENSIONATTRIBUTELEVELVALUEVIEW AS DIMENSIONATTRIBUTELEVELVALUEVIEW_1 INNER JOIN
                                         dbo.DIMENSIONATTRIBUTE AS DIMENSIONATTRIBUTE_1 ON DIMENSIONATTRIBUTELEVELVALUEVIEW_1.DIMENSIONATTRIBUTE = DIMENSIONATTRIBUTE_1.RECID
                       WHERE     (DIMENSIONATTRIBUTE_1.NAME = 'Stores')) AS DIM2 ON dbo.GENERALJOURNALACCOUNTENTRY.LEDGERDIMENSION = DIM2.VALUECOMBINATIONRECID LEFT OUTER JOIN

                      (SELECT     DIMENSIONATTRIBUTELEVELVALUEVIEW_2.VALUECOMBINATIONRECID, DIMENSIONATTRIBUTELEVELVALUEVIEW_2.DISPLAYVALUE
                       FROM        dbo.DIMENSIONATTRIBUTELEVELVALUEVIEW AS DIMENSIONATTRIBUTELEVELVALUEVIEW_2 INNER JOIN
                                         dbo.DIMENSIONATTRIBUTE AS DIMENSIONATTRIBUTE_2 ON DIMENSIONATTRIBUTELEVELVALUEVIEW_2.DIMENSIONATTRIBUTE = DIMENSIONATTRIBUTE_2.RECID
                       WHERE     (DIMENSIONATTRIBUTE_2.NAME = 'Department')) AS DIM3 ON dbo.GENERALJOURNALACCOUNTENTRY.LEDGERDIMENSION = DIM3.VALUECOMBINATIONRECID LEFT OUTER JOIN

                      (SELECT     DIMENSIONATTRIBUTELEVELVALUEVIEW_3.VALUECOMBINATIONRECID, DIMENSIONATTRIBUTELEVELVALUEVIEW_3.DISPLAYVALUE
                       FROM        dbo.DIMENSIONATTRIBUTELEVELVALUEVIEW AS DIMENSIONATTRIBUTELEVELVALUEVIEW_3 INNER JOIN
                                         dbo.DIMENSIONATTRIBUTE AS DIMENSIONATTRIBUTE_3 ON DIMENSIONATTRIBUTELEVELVALUEVIEW_3.DIMENSIONATTRIBUTE = DIMENSIONATTRIBUTE_3.RECID
                       WHERE     (DIMENSIONATTRIBUTE_3.NAME = 'Cost')) AS DIM4 ON dbo.GENERALJOURNALACCOUNTENTRY.LEDGERDIMENSION = DIM4.VALUECOMBINATIONRECID LEFT OUTER JOIN

                      (SELECT     DIMENSIONATTRIBUTELEVELVALUEVIEW_4.VALUECOMBINATIONRECID, DIMENSIONATTRIBUTELEVELVALUEVIEW_4.DISPLAYVALUE
                       FROM        dbo.DIMENSIONATTRIBUTELEVELVALUEVIEW AS DIMENSIONATTRIBUTELEVELVALUEVIEW_4 INNER JOIN
                                         dbo.DIMENSIONATTRIBUTE AS DIMENSIONATTRIBUTE_4 ON DIMENSIONATTRIBUTELEVELVALUEVIEW_4.DIMENSIONATTRIBUTE = DIMENSIONATTRIBUTE_4.RECID
                       WHERE     (DIMENSIONATTRIBUTE_4.NAME = 'Project')) AS DIM5 ON dbo.GENERALJOURNALACCOUNTENTRY.LEDGERDIMENSION = DIM5.VALUECOMBINATIONRECID LEFT OUTER JOIN

                      (SELECT     DIMENSIONATTRIBUTELEVELVALUEVIEW_5.VALUECOMBINATIONRECID, DIMENSIONATTRIBUTELEVELVALUEVIEW_5.DISPLAYVALUE
                       FROM        dbo.DIMENSIONATTRIBUTELEVELVALUEVIEW AS DIMENSIONATTRIBUTELEVELVALUEVIEW_5 INNER JOIN
                                         dbo.DIMENSIONATTRIBUTE AS DIMENSIONATTRIBUTE_5 ON DIMENSIONATTRIBUTELEVELVALUEVIEW_5.DIMENSIONATTRIBUTE = DIMENSIONATTRIBUTE_5.RECID
                       WHERE     (DIMENSIONATTRIBUTE_5.NAME = 'BankAccount')) AS DIM6 ON dbo.GENERALJOURNALACCOUNTENTRY.LEDGERDIMENSION = DIM6.VALUECOMBINATIONRECID LEFT OUTER JOIN

                      (SELECT     DIMENSIONATTRIBUTELEVELVALUEVIEW_6.VALUECOMBINATIONRECID, DIMENSIONATTRIBUTELEVELVALUEVIEW_6.DISPLAYVALUE
                       FROM        dbo.DIMENSIONATTRIBUTELEVELVALUEVIEW AS DIMENSIONATTRIBUTELEVELVALUEVIEW_6 INNER JOIN
                                         dbo.DIMENSIONATTRIBUTE AS DIMENSIONATTRIBUTE_6 ON DIMENSIONATTRIBUTELEVELVALUEVIEW_6.DIMENSIONATTRIBUTE = DIMENSIONATTRIBUTE_6.RECID
                       WHERE     (DIMENSIONATTRIBUTE_6.NAME = 'Site')) AS DIM7 ON dbo.GENERALJOURNALACCOUNTENTRY.LEDGERDIMENSION = DIM7.VALUECOMBINATIONRECID left OUTER JOIN

                      (SELECT     DIMENSIONATTRIBUTELEVELVALUEVIEW_7.VALUECOMBINATIONRECID, DIMENSIONATTRIBUTELEVELVALUEVIEW_7.DISPLAYVALUE
                       FROM        dbo.DIMENSIONATTRIBUTELEVELVALUEVIEW AS DIMENSIONATTRIBUTELEVELVALUEVIEW_7 INNER JOIN
                                         dbo.DIMENSIONATTRIBUTE AS DIMENSIONATTRIBUTE_7 ON DIMENSIONATTRIBUTELEVELVALUEVIEW_7.DIMENSIONATTRIBUTE = DIMENSIONATTRIBUTE_7.RECID
                       WHERE     (DIMENSIONATTRIBUTE_7.NAME = 'ICP')) AS DIM8 ON dbo.GENERALJOURNALACCOUNTENTRY.LEDGERDIMENSION = DIM8.VALUECOMBINATIONRECID left OUTER JOIN

                  dbo.LEDGERENTRY ON dbo.LEDGERENTRY.GENERALJOURNALACCOUNTENTRY = dbo.GENERALJOURNALACCOUNTENTRY.RECID ON dbo.LEDGERENTRYJOURNAL.RECID = dbo.GENERALJOURNALENTRY.LEDGERENTRYJOURNAL FULL OUTER JOIN
                  dbo.LEDGERENTRYJOURNALIZING ON dbo.GENERALJOURNALACCOUNTENTRY.RECID = dbo.LEDGERENTRYJOURNALIZING.GENERALJOURNALACCOUNTENTRY


GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "LEDGERENTRYJOURNALIZING"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 381
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GENERALJOURNALACCOUNTENTRY"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 338
               Right = 378
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GENERALJOURNALENTRY"
            Begin Extent = 
               Top = 343
               Left = 48
               Bottom = 506
               Right = 410
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SUBLEDGERVOUCHERGENERALJOURNALENTRY"
            Begin Extent = 
               Top = 511
               Left = 48
               Bottom = 674
               Right = 313
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LEDGERENTRY"
            Begin Extent = 
               Top = 679
               Left = 48
               Bottom = 842
               Right = 381
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LEDGERENTRYJOURNAL"
            Begin Extent = 
               Top = 847
               Left = 48
               Bottom = 1010
               Right = 392
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DIM1"
            Begin Extent = 
               Top = 1015
               Left = 48
               Bot' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'HFM'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'tom = 1134
               Right = 329
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DIM2"
            Begin Extent = 
               Top = 1134
               Left = 48
               Bottom = 1253
               Right = 329
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DIM3"
            Begin Extent = 
               Top = 1253
               Left = 48
               Bottom = 1372
               Right = 329
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DIM4"
            Begin Extent = 
               Top = 1372
               Left = 48
               Bottom = 1491
               Right = 329
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DIM5"
            Begin Extent = 
               Top = 1491
               Left = 48
               Bottom = 1610
               Right = 329
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DIM6"
            Begin Extent = 
               Top = 1610
               Left = 48
               Bottom = 1729
               Right = 329
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LEDGER"
            Begin Extent = 
               Top = 7
               Left = 429
               Bottom = 170
               Right = 728
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DIM7"
            Begin Extent = 
               Top = 175
               Left = 426
               Bottom = 294
               Right = 707
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'HFM'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'HFM'
GO


