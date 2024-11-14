IF COL_LENGTH('dbo.UZ_PendingWorks', 'ActualCompletionDate') IS NULL
BEGIN
ALTER TABLE [dbo].[UZ_PendingWorks]
    ADD [ActualCompletionDate] SMALLDATETIME NULL;
END
GO