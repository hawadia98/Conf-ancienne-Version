ALTER TABLE [dbo].[UP_PolicySimulations] ALTER COLUMN [WhenStarted] SMALLDATETIME NULL
GO

UPDATE [dbo].[UP_PolicySimulations] SET [State]=20 WHERE [State]=0;
UPDATE [dbo].[UP_PolicySimulations] SET [State]=30 WHERE [State]=1;
UPDATE [dbo].[UP_PolicySimulations] SET [State]=40 WHERE [State]=2;
UPDATE [dbo].[UP_PolicySimulations] SET [State]=90 WHERE [State]=3;
GO
